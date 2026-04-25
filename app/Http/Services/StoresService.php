<?php

namespace App\Http\Services;

use App\Http\Constants\OrderStatusesConstant;
use App\Http\Resources\Auth\StoreLoginResource;
use App\Http\Services\Users\AuthService;
use App\Http\Traits\ArraySliceTrait;
use App\Http\Traits\FileUploadTrait;
use App\Http\Traits\LoggedInUserTrait;
use App\Http\Traits\ResponsesTrait;
use App\Models\Category;
use App\Models\DriversApp\UserDeviceToken;
use App\Models\Order;
use App\Models\Product;
use App\Models\PromoCode;
use App\Models\Review;
use App\Models\Store;
use App\Models\StoreCategory;
use App\Models\User;
use App\Models\WeekDay;
use Exception;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Laravel\Socialite\Facades\Socialite;
use stdClass;
use Tymon\JWTAuth\Facades\JWTAuth;

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
            'whatsapp_number',
            'telegram_number'
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
        $newUser['is_profile_completed'] = 1;

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
            'whatsapp_number',
            'telegram_number'
        ]);

        $store['user_id'] = $user->id;
        $createdStore = Store::create($store);

        // 3- create token for user
        $credentials =  ['email' => $user['email'], 'password' => $user['password']];


        DB::commit();
        
        
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
            throw new HttpResponseException($this->apiResponse(["is_active" => 0], false, __('account not active')));
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

            $stores = Store::with('user')->get();
        }



        return $stores;
    }

    public function getNearbyStores()
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
            $stores = Store::select('stores.*')
                ->selectRaw("{$haversine} AS distance", [$lat, $long, $lat])
                ->withAvg(['orders as avg_rating' => function ($query) {
                    $query->select(DB::raw('coalesce(avg(reviews.rating), 0)'))
                        ->join('reviews', 'orders.id', '=', 'reviews.order_id');
                }], 'avg_rating')
                ->orderBy('distance', 'asc');
            
            $stores = $stores->limit(20)->get();
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
                $query->where('store_id', $storeId)->with('images');
            },
        ])->first();
        if($store == null){
            throw new HttpResponseException($this->apiResponse(null, false, __('validation.not_exist')));
        }
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
            
        $store->working_hours = WeekDay::leftJoin('store_working_hours', function ($join) use ($storeId) {
            $join->on('week_days.id', '=', 'store_working_hours.week_day_id')
                ->where('store_working_hours.store_id', $storeId);
        })
            ->orderBy('week_days.id')
            ->select(
                'week_days.*',
                'store_working_hours.from',
                'store_working_hours.to',
                'store_working_hours.full_day'
            )
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
                ->with('categories.products.images', 'promoCodes')->first();
            $ordersService = new OrdersService();
            $store->orders = Order::with('items', 'review', 'client')->where('store_id', $storeId)
                ->whereNot('status', 'in_cart')->get();
        }
        if ($store == null)
            throw new HttpResponseException($this->apiResponse(null, false, __('validation.not_exist')));
        return $store;
    }

    public function getMyStatistics(){
        $storeId = $this->getLoggedInUserStoreId();
        $categoriesCount = StoreCategory::where('store_id', $storeId)->count();
        $promoCodesCount = PromoCode::where('store_id',$storeId)->count();
        $productsCount = Product::where('store_id',$storeId)->count();
        $activeOrdersCount = Order::where('store_id', $storeId)->whereNot('status', 'in_cart')->whereNot('status', 'returned')->whereNot('status','canceled')->count();
        
        $statuses = OrderStatusesConstant::statuses;

        $rawCounts = Order::where('store_id', $storeId)
            ->select('status', DB::raw('COUNT(*) as count'))
            ->groupBy('status')
            ->pluck('count', 'status')
            ->toArray();

        $ordersPerStatusCount = [];

        foreach ($statuses as $status) {
            $ordersPerStatusCount[$status] = $rawCounts[$status] ?? 0;
        }


        return [
            'categories_count' => $categoriesCount,
            'promo_codes_count' => $promoCodesCount,
            'active_orders_count' => $activeOrdersCount,
            'products_count' => $productsCount,
            'orders_per_status_count' => $ordersPerStatusCount
        ];

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

    public function socialLogin($data)
    {

        $providerUser = Socialite::driver($data['provider'])->stateless()->userFromToken($data['access_token']);
        $email = $providerUser->getEmail();
        
        // $email = "store@gmail.com";

        // if email not found then register them in the system with complete_data = false
        $user = User::where('email', $email)->first();

        if($user != null && $user->role != 'store'){
            throw new HttpResponseException($this->apiResponse(null, false, __('unauthorized')));
        }
        
        if($user == null){
         
            DB::beginTransaction();
            // 1- create user
            $user = ["email" => $email];
            $user['role'] = 'store';
            $user['active'] = 1;
            $user['is_verified'] = 1;

            $user['is_profile_completed'] = 0;

            $user = User::create($user);

            // 2- create client with user_id
            $store = ['user_id' => $user->id];
            Store::create($store);

            DB::commit();
            $token = Auth::guard('authenticate')->login($user);
            $user->token = $token;
            return $user;
        }else if($user->is_profile_completed == false){
            $token = Auth::guard('authenticate')->login($user);
            $user->token = $token;
            return $user;

        }else{
            // login the user
            $token = Auth::guard('authenticate')->login($user);
            $user->token = $token;
            return $user;
        }
    }
}
