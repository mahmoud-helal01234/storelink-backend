<?php

namespace App\Http\Services;

use stdClass;
use Exception;
use App\Models\Order;
use App\Models\Store;
use App\Models\Review;
use App\Models\Category;
use Illuminate\Support\Facades\DB;
use App\Http\Traits\ResponsesTrait;
use Illuminate\Support\Facades\Log;
use App\Http\Traits\FileUploadTrait;
use App\Http\Traits\LoggedInUserTrait;
use Illuminate\Http\Exceptions\HttpResponseException;

class StoresService
{

    use ResponsesTrait;
    use FileUploadTrait;
    use LoggedInUserTrait;

    private $companiesCategoriesService;
    private $proudctsService;

    public function getCategoriesNotAssignedToStore()
    {

        Log::info("start get categories not assigned to store");

        $store = Category::where('user_id', $this->getLoggedInUserStoreId())->get()->first();
        return $store->id;
    }
    public function getStoreIdByUserId($userId)
    {

        Log::info("start get stores");

        $store = Store::where('user_id', $userId)->
            // with('')
            // ->when($storeId != null,
            // function ($query) use($storeId){
            //     return $query->where('store_id',$storeId);
            // })->
            get()->first();
        return $store->user_id;
    }

    public function get($categoryId, $rating = null, $sortByRating = null, $distanceInMeters = null)
    {
        Log::info("start get stores");

        $stores = [];

        if ($this->isLoggedInUserClient()) {
            $clientId = $this->getLoggedInUserClientId();
            $clientsService = new ClientsService();
            $client = $clientsService->getById($clientId);
            $lat = $client->lat;
            $long = $client->long;
            // Haversine formula in meters (earth radius = 6,371,000 m)
            $haversine = "(6371000 * acos(least(1, cos(radians(?)) 
                    * cos(radians(stores.lat)) 
                    * cos(radians(stores.long) - radians(?)) 
                    + sin(radians(?)) 
                    * sin(radians(stores.lat)))))";

            // by category id
            $stores = Store::whereHas('categories', function ($q) use ($categoryId) {
                $q->where('categories.id', $categoryId);
            })
                ->select('stores.*')
                ->selectRaw("{$haversine} AS distance", [$lat, $long, $lat])
                ->withAvg(['orders as avg_rating' => function ($query) {
                    $query->select(DB::raw('coalesce(avg(reviews.rating), 0)'))
                        ->join('reviews', 'orders.id', '=', 'reviews.order_id');
                }], 'avg_rating')
                ->when($rating != null, function ($query) use ($rating) {
                    $query->having('avg_rating', '>=', $rating);
                })->when($sortByRating, function ($query) {
                    $query->orderBy('avg_rating', 'asc');
                })
                ->orderBy('distance', 'asc');
            if ($distanceInMeters != null) {

                $stores = $stores->whereRaw("{$haversine} <= ?", [$lat, $long, $lat, $distanceInMeters]);
            }
            $stores = $stores->get();
        }else if($this->isLoggedInUserAdmin()) {
            
            $stores = Store::get();
        }



        return $stores;
    }

    public function getById($id)
    {

        Log::info("start get store by id");


        $store = Store::find($id);

        if ($store == null)
            throw new HttpResponseException($this->apiResponse(null, false, __('validation.not_exist')));
        return $store;
    }

    public function getDetailsById($storeId = null)
    {

        Log::info("start get store details by id");

        if ($this->isLoggedInUserStore() && $storeId == null)
            $storeId = $this->getLoggedInUserStoreId();

        $store = Store::where('user_id', $storeId)->with('categories.products')->first();
        $store->reviews =  Review::join('orders', 'reviews.order_id', '=', 'orders.id')
            ->join('clients', 'orders.client_id', '=', 'clients.user_id')
            ->where('orders.store_id', $storeId)
            ->select([
                'reviews.id',
                'reviews.review',
                'reviews.rating',
                'clients.name as client_name'
            ])
            ->get();

        if ($this->isLoggedInUserClient()) {
            $ordersService = new OrdersService();
            $order = Order::with('items')->where('client_id', $this->getLoggedInUserClientId())
                ->where('store_id', $storeId)
                ->where('status', 'in_cart')->first();

            if ($order != null) {

                // calculate total price for cart order
                $order->total_price = $ordersService->calculateCartOrderTotalPrice($order);
                $cartOrder = new stdClass();
                $cartOrder->total_price = $order->total_price;
                $cartOrder->items = [];

                // ✅ Fill the items list with product_id as id + quantity
                foreach ($order->items as $item) {
                    $newItem = new stdClass();
                    $newItem->id = $item->product_id;
                    $newItem->quantity = $item->quantity;
                    $cartOrder->items[] = $newItem;
                }
                $store->cart_order = $cartOrder;
            }
        }else if($this->isLoggedInUserAdmin()) {
            
            $store = Store::where('user_id', $storeId)
            ->with('categories.products','promoCodes')->first();
            $ordersService = new OrdersService();
            $store->orders = Order::with('items','review','client')->where('store_id', $storeId)
                ->whereNot('status', 'in_cart')->get();

        }
        if ($store == null)
            throw new HttpResponseException($this->apiResponse(null, false, __('validation.not_exist')));
        return $store;
    }

    public function create($store)
    {

        try {
            Log::info("start create store");

            return Store::create($store);
        } catch (\Exception $ex) {

            throw new HttpResponseException($this->apiResponse(status: false));;
        }
    }


    public function update($newStore)
    {

        Log::info("start update store");

        $store = $this->getById($newStore['id']);


        try {
            $store->update($newStore);
            return $store;
        } catch (\Exception $ex) {

            throw new HttpResponseException($this->apiResponse(status: false));;
        }
    }

    public function delete($id)
    {

        Log::info("start delete store");

        $store = $this->getById($id);

        try {

            // $this->deleteRelationsWithStore($store->id);
            $store->delete();
        } catch (\Exception $ex) {

            throw new HttpResponseException($this->apiResponse(null, false, __('validation.cannot_delete')));
        }
    }

    public function deleteRelationsWithStore($storeId)
    {

        $this->proudctsService = new ProductsService;
        $this->proudctsService->deleteChildren(storeId: $storeId);
    }

    public function deleteChildren($mainStoreId = null)
    {
        $stores = Store::where('main_store_id', $mainStoreId)->get();


        foreach ($stores as $store) {

            $this->deleteRelationsWithStore($store->id);
            $store->delete();
        }
    }
}
