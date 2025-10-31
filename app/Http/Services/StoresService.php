<?php

namespace App\Http\Services;

use stdClass;
use Exception;
use App\Models\User;
use App\Models\Order;
use App\Models\Store;
use App\Models\Review;
use App\Models\Category;
use Illuminate\Support\Facades\DB;
use Tymon\JWTAuth\Facades\JWTAuth;
use App\Http\Traits\ResponsesTrait;
use Illuminate\Support\Facades\Log;
use App\Http\Traits\ArraySliceTrait;
use App\Http\Traits\FileUploadTrait;
use Illuminate\Support\Facades\Auth;
use App\Http\Traits\LoggedInUserTrait;
use App\Http\Services\Users\AuthService;
use App\Models\DriversApp\UserDeviceToken;
use App\Http\Resources\Auth\StoreLoginResource;
use Illuminate\Http\Exceptions\HttpResponseException;

class StoresService
{

    use ResponsesTrait;
    use FileUploadTrait;
    use ArraySliceTrait;
    use LoggedInUserTrait;

    private $companiesCategoriesService;
    private $proudctsService;

    public function me()
    {

        $user = $this->getLoggedInUser();
        if (!$this->isLoggedInUserStore()) {
            throw new HttpResponseException($this->apiResponse(null, false, __('unauthorized')));
        }

        $user->store;
        return $user;
    }

    public function updateProfile($request)
    {

        $storeId = $this->getLoggedInUser()->id;
        $store = $this->getById($storeId);
        $newStore = $this->array_slice_assoc($request, [
            'name_en',
            'name_ar',
            'delivery_charge',
            'lat',
            'long',
            'address',
            'first_phone_number',
            'second_phone_number',
            'whatsapp_number'
        ]);


        if (isset($request['logo_image']) && $request['logo_image'] != null && !str_starts_with($request['logo_image'], 'http')) {
            $newStore['logo_image'] = $request['logo_image'];
        }

        if (isset($request['cover_image']) && $request['cover_image'] != null && !str_starts_with($request['cover_image'], 'http')) {
            $newStore['cover_image'] = $request['cover_image'];
        }

        $store->update($newStore);

        // update user
        $newUser = $this->array_slice_assoc($request, ['name', 'email']);
        if (isset($request['password']) && $request['password'] != null)
            $newUser['password'] = $request['password'];

        $store->user->update($newUser);
        return;
    }

    public function register($request)
    {


        DB::beginTransaction();
        // 1- create user
        $user = $this->array_slice_assoc($request, ['email', 'password']);
        $user['role'] = 'store';
        $user['active'] = 0;

        $user = User::create($user);

        // 2- create client with user_id
        $store = $this->array_slice_assoc($request, [
            'name_en',
            'name_ar',
            'logo_image',
            'cover_image',
            'delivery_charge',
            'lat',
            'long',
            'address',
            'first_phone_number',
            'second_phone_number',
            'whatsapp_number'
        ]);

        $store['user_id'] = $user->id;
        $createdStore = Store::create($store);

        // 3- create token for user
        $credentials =  ['email' => $user['email'], 'password' => $user['password']];

        $token = JWTAuth::fromUser($user);

        DB::commit();
        $user->token = $token;
        $user->phone = $createdStore->phone;

        return StoreLoginResource::make($user);
    }

    public function login($user)
    {

        $credentials = $this->array_slice_assoc($user, ['email', 'password']);

        $token = Auth::guard('authenticate')->attempt($credentials);

        if (!$token || !$this->isLoggedInUserStore()) {

            throw new HttpResponseException($this->apiResponse(null, false, __('wrong email or password')));
        }

        $authUser = Auth::guard('authenticate')->user();
        if ($authUser->active == 0) {
            throw new HttpResponseException($this->apiResponse(null, false, __('account not active')));
        }

        if ($authUser->is_verified == 0) {
            // send otp to user's email
            $authService = new AuthService();
            $otp = $authService->sendOTP($authUser->email);
            throw new HttpResponseException($this->apiResponse(["is_verified" => 0, "otp" => $otp], false, __('account not verified')));
        }

        if (isset($user['device_token']) &&  $user['device_token'] != null) {
            UserDeviceToken::create([

                'user_id' => $authUser->id,
                'device_token' => $user['device_token'],
            ]);
        }

        $authUser['token'] = $token;
        return $authUser;
    }

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
        } else if ($this->isLoggedInUserAdmin()) {

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

        $store = Store::where('user_id', $storeId)->with([
            'categories.products' => function ($query) use ($storeId) {
                $query->where('store_id', $storeId);
            },
        ])->first();
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
        } else if ($this->isLoggedInUserAdmin()) {

            $store = Store::where('user_id', $storeId)
                ->with('categories.products', 'promoCodes')->first();
            $ordersService = new OrdersService();
            $store->orders = Order::with('items', 'review', 'client')->where('store_id', $storeId)
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
