<?php

namespace App\Http\Services;

use stdClass;
use Exception;
use Carbon\Carbon;
use App\Models\User;
use App\Models\Order;
use App\Models\Driver;
use App\Models\Review;
use App\Models\Setting;
use App\Models\EasyOrder;
use App\Models\OrderItem;
use App\Models\PromoCode;
use App\Models\DeviceToken;
use App\Models\Notification;
use App\Models\OrderComment;
use App\Models\ProductOption;
use App\Models\ClientLocation;
use App\Mail\NewOrderNotification;
use Illuminate\Support\Facades\DB;
use App\Http\Traits\ResponsesTrait;
use Illuminate\Support\Facades\Log;
use App\Http\Traits\ArraySliceTrait;
use Illuminate\Support\Facades\Mail;
use App\Http\Services\ProductsService;
use App\Http\Traits\LoggedInUserTrait;
use App\Http\Traits\NotificationTrait;
use App\Models\OrderHaveBaseOrdersRate;
use App\Http\Services\PromoCodesService;
use App\Http\Constants\OrderStatusesConstant;
use App\Http\Services\Orders\ClientOrdersService;
use App\Models\TransportationPeriodAssignedToDriver;
use Illuminate\Http\Exceptions\HttpResponseException;
use App\Http\Services\DriversApp\DriversAppOrdersService;

class OrdersService
{

    use ResponsesTrait, ArraySliceTrait;
    use LoggedInUserTrait, NotificationTrait;

    
    public function getMyOrders()
    {
        if ($this->isLoggedInUserStore()) {
            $storeId = $this->getLoggedInUserStoreId();
            $orders = Order::with(['items.product', 'store', 'client', 'promoCode'])
                ->where('store_id', $storeId)
                ->where('status', '!=', 'in_cart')
                ->orderBy('created_at', 'DESC')
                ->get();

            return $orders;
        } else if ($this->isLoggedInUserClient()) {

            $clientId = $this->getLoggedInUserClientId();
            $orders = Order::with(['items.product', 'store', 'client', 'promoCode'])
                ->where('client_id', $clientId)
                ->where('status', '!=', 'in_cart')
                ->orderBy('created_at', 'DESC')
                ->get();

            return $orders;
        }
    }
    
    public function getCartDetails()
    {
        $order = Order::with(
            ['items.product', 'store', 'client', 'promoCode']
        )->where('status', 'in_cart')->where('client_id', $this->getLoggedInUserClientId())->first();
        
        if($order != null ){
            // validate promo code if expired remove it
            if ( $order->promoCode != null && Carbon::parse($order->promoCode->expiration_datetime)->lt(now())) {
                $order->promo_code_id = null;
                $order->save();
            }
            
            $order = $this->calculateCartOrderPrices($order);
        }
        return $order;
    }

    // client use only
    public function addProductToCart($addedProduct)
    {
        // get product's store id
        $productsService = new ProductsService();
        $product = $productsService->getById($addedProduct['product_id']);
        $storeId = $product->store_id;

        // get client id
        $clientId = $this->getLoggedInUser()->id;

        // get/create order in cart for this client and this store
        $order = Order::where('status', 'in_cart')->where('client_id', $clientId)->where('store_id', $storeId)->first();

        if ($order == null) {
            // get in_cart order for this product's store if not exist remove the other store's active orders for this client then add the current store order.
            Order::where('status', 'in_cart')->where('client_id', $clientId)->delete();
            $order = Order::create([
                'client_id' => $clientId,
                'store_id' => $storeId,
                'status' => 'in_cart',
                'price' => 0
            ]);
        }
        DB::beginTransaction();

        // check if product already in cart
        $orderItem = OrderItem::where('order_id', $order->id)->where('product_id', $addedProduct['product_id'])->first();
        if ($orderItem == null) {
            if ($addedProduct['quantity'] > 0) {
                // add product to cart
                OrderItem::create([
                    'order_id' => $order->id,
                    'product_id' => $addedProduct['product_id'],
                    'quantity' => $addedProduct['quantity']
                ]);
            }
        } else {

            // update quantity if quantity > 0 else remove from cart
            if ($addedProduct['quantity'] <= 0) {
                $orderItem->delete();
                DB::commit();
                return;
            }
            $orderItem->quantity = $addedProduct['quantity'];
            $orderItem->save();
        }
        DB::commit();

        return;
    }

    public function calculateCartOrderPrices($order)
    {

        $price = 0;
        foreach ($order->items as $item) {
            
            if ($item->product->offer_price != null && $item->product->offer_price > 0)
                $price += $item->product->offer_price * $item->quantity;
            else
                $price += $item->product->price * $item->quantity;
        }

        $order->price = $price;
        $order->total_price = $price;

        // apply promo code & validate it if exists 
        if ($order->promo_code_id != null) {
            $discountValue = 0;
            $promoCodesService = new PromoCodesService();

            if ($promoCodesService->isPromoCodeExpired($order->promoCode)) {
                $promoCode = $order->promoCode;
                if ($promoCode->discount_type == 'percentage') {
                    $discountValue = $price * $promoCode->value / 100;
                } else {
                    $discountValue = $promoCode->value;
                }
                $order->promo_code_discount = $discountValue;

                $order->total_price -= $discountValue;
            }
        }

        // get delivery charge
        $order->delivery_charge = $order->store->delivery_charge;

        $order->total_price += $order->delivery_charge;

        return $order;
    }

    public function calculateCartOrderTotalPrice($order)
    {
        $price = 0;
        foreach ($order->items as $item) {
            if ($item->product->offer_price != null && $item->product->offer_price > 0)
                $price += $item->product->offer_price * $item->quantity;
            else
                $price += $item->product->price * $item->quantity;
        }

        $totalPrice = $price;

        // apply promo code & validate it if exists 
        if ($order->promo_code_id != null) {
            $discountValue = 0;
            $promoCodesService = new PromoCodesService();

            if ($promoCodesService->isPromoCodeExpired($order->promoCode)) {
                $promoCode = $order->promoCode;
                if ($promoCode->discount_type == 'percentage') {
                    $discountValue = $price * $promoCode->value / 100;
                } else {
                    $discountValue = $promoCode->value;
                }
                $totalPrice -= $discountValue;
            }
        }

        // get delivery charge
        $order->delivery_charge = $order->store->delivery_charge;

        $totalPrice += $order->delivery_charge;

        return $totalPrice;
    }

    public function checkOut($data)
    {

        $order = Order::with(['items.product', 'store', 'client'])->findOrFail($data['order_id']);

        $this->canClientEditOrder($order);
        $price = 0;

        foreach ($order->items as $item) {
            if ($item->product->offer_price != null && $item->product->offer_price > 0)
                $item->price = $item->product->offer_price;
            else
                $item->price = $item->product->price;
            $item->save();
            $price += $item->price * $item->quantity;
        }
        $order->price = $price;
        $totalPrice = $price;

        // apply promo code & validate it if exists 
        if ($order->promo_code_id != null) {
            $discountValue = 0;
            $promoCodesService = new PromoCodesService();

            if ($promoCodesService->isPromoCodeExpired($order->promoCode)) {
                $promoCode = $order->promoCode;
                if ($promoCode->discount_type == 'percentage') {
                    $discountValue = $price * $promoCode->value / 100;
                } else {
                    $discountValue = $promoCode->value;
                }
                $order->promo_code_discount = $discountValue;
                $totalPrice -= $discountValue;
            }
        }

        // get delivery charge
        $order->delivery_charge = $order->store->delivery_charge;

        $totalPrice += $order->delivery_charge;

        $order->total_price = $totalPrice;
        // set location
        $order->lat = $order->client->lat;
        $order->long = $order->client->long;
        $order->status = 'pending';
        $order->save();
        $notificationsService = new NotificationsService();

        $notificationsService->create([
            'user_id' => $order->store_id,
            'order_id' => $order->id,
            'title_en' => "New order placed #". $order->id,
            'title_ar' => "تم تقديم طلب جديد " . $order->id,
            'body_en' => "A new order has been placed by " . $order->client->name,
            'body_ar' => "تم تقديم طلب جديد بواسطة " . $order->client->name
        ]);

        return $order;
    }

    public function isOrderForLoggedInClient($order)
    {
        if ($order->client_id != $this->getLoggedInUser()->id)
            throw new HttpResponseException($this->apiResponse(null, false, __('validation.not_authorized'), statusCode: 403));
        return true;
    }

    public function canClientEditOrder($order)
    {
        if (!$this->isOrderForLoggedInClient($order) || $order->status != 'in_cart')
            throw new HttpResponseException($this->apiResponse(null, false, __('validation.not_authorized'), statusCode: 403));
        return true;
    }

    public function canClientReviewOrder($order)
    {
        dd($this->isOrderForLoggedInClient($order));
        if (!$this->isOrderForLoggedInClient($order) || $order->status != 'delivered')
            throw new HttpResponseException($this->apiResponse(null, false, __('validation.not_authorized'), statusCode: 403));
        return true;
    }


    public function applyPromoCode($addedPromoCode)
    {

        // validate it's not expired 
        $promoCodesService = new PromoCodesService();
        $promoCode = $promoCodesService->getByCode($addedPromoCode['promo_code']);

        $promoCodesService->isPromoCodeExpired($promoCode);

        // validate it's corresponding to same order's store and for logged in client
        $order = $this->getById($addedPromoCode['order_id']);
        if ($order->store_id != $promoCode->store_id)
            throw new HttpResponseException($this->apiResponse(null, false, __('validation.not_exist'), statusCode: 404));

        $this->canClientEditOrder($order);

        // validate that it's not used before by this client
        if (Order::where('client_id', $order->client_id)->where('promo_code_id', $promoCode->id)->count() > 0)
            throw new HttpResponseException($this->apiResponse(null, false, __('validation.used_before'), statusCode: 404));

        $order->promo_code_id = $promoCode->id;
        $order->save();

        return $this->getCartDetails();
    }

    public function cancelPromoCode($orderId)
    {

        $order = $this->getById($orderId);
        $this->canClientEditOrder($order);

        $order->promo_code_id = null;
        $order->save();

        return $this->getCartDetails();
    }

    public function reviewOrder($data)
    {

        $order = $this->getById($data['order_id']);
        $this->canClientReviewOrder($order);

        $review = Review::where('order_id', $order->id)->first();
        if ($review == null)
            $review = Review::create($data);
        else {
            $review->rating = $data['rating'];
            $review->review = $data['review'];
            $review->save();
        }
        return;
    }






    public function createForClient($order)
    {


        // dd($order);
        $loggedInUser = $this->getLoggedInUser();
        if ($loggedInUser != null) {

            switch ($loggedInUser->role) {

                case "client":

                    $order['client_id'] = $loggedInUser->id;
                    $order['status'] = "in_waiting_list";
                    break;
            }
        } else {
            $order['status'] = "confirmed";
        }

        $price = 0;
        $productOptionIds = array_column($order['items'], 'id');

        $productOptions = ProductOption::with('product')->whereIn('id', $productOptionIds)->get();

        foreach ($order['items'] as $orderItem) {

            $productOption = $productOptions->where('id', $orderItem['id'])->first();

            $price +=  $productOption['price'] * $orderItem['quantity'];
        }
        $discountValue = 0;
        // apply discount 
        if (isset($order['promo_code_id'])) {
            $promoCode = PromoCode::where('id', $order['promo_code_id'])->first();
            // $discountValue = 0;

            if ($promoCode->discount_type == 'percentage') {
                $discountValue = $price * $promoCode->value / 100;
            } else {
                $discountValue = $promoCode->value;
            }

            $discountValue = $discountValue > $promoCode->max_fixed_value ? $promoCode->max_fixed_value : $discountValue;

            $price -= $discountValue;
        }

        $minOrderPrice = Setting::first()->min_order_price;

        $price = $price < $minOrderPrice ? $minOrderPrice : $price;

        $order['price'] = $price;
        $notification = null;
        $createdOrder = null;
        $itemsForEmail = null;
        DB::transaction(function () use (&$notification, &$createdOrder, &$itemsForEmail, $order, $productOptions, $loggedInUser, $discountValue) {
            $itemsForEmail = [];

            if ($loggedInUser != null) {
                $createdOrder = Order::create($this->array_slice_assoc($order, [
                    'client_id',
                    'location_id',
                    'price',
                    'special_instructions',
                    'status',
                    'promo_code_id'
                ]));
            } else {
                $createdOrder = Order::create($this->array_slice_assoc($order, [
                    'client_name',
                    'address',
                    'phone',
                    'preferred_pickup_time',
                    'price',
                    'promo_code_id'
                ]));
            }
            // $totalPrice = 0;
            foreach ($order['items'] as $orderItem) {

                $productOption = $productOptions->where('id', $orderItem['id'])->first();

                OrderItem::create([

                    'order_id' => $createdOrder->id,
                    'product_option_id' => $orderItem['id'],
                    'name_en' => $productOption->product->name_en . " - " . $productOption->name_en,
                    'name_ar' => $productOption->product->name_ar . " - " . $productOption->name_ar,

                    'price' => $productOption->price,
                    'quantity' => $orderItem['quantity']
                ]);

                $itemsForEmail[] = [
                    'name_en' => $productOption->product->name_en . ' - ' . $productOption->name_en,
                    'name_ar' => $productOption->product->name_ar . ' - ' . $productOption->name_ar,
                    'price' => $productOption->price,
                    'quantity' => $orderItem['quantity'],
                ];

                // $totalPrice += $productOption->price * $orderItem['quantity'];
            }

            // $createdOrder->price = $totalPrice;
            $createdOrder->save();
            $subscribers = [];
            $admins = User::with('deviceTokens')
                ->get()
                ->pluck('deviceTokens.*.device_token')
                ->flatten(); // Flatten the array to get a list of tokens only
            // if ($appointment->client->device_id != null) {
            //     $subscribers[] = $appointment->client->device_id;
            // }
            $not = [
                'appointment_id' => $createdOrder->id,
                // 'client_id' => $client->id
            ];
            // Notification::create($not);
            $clientName = $createdOrder->client != null ?
                $createdOrder->client->name : $createdOrder->client_name;
            $notification =
                [
                    'type' => "1",
                    'title' => "  طلب زيارة لدي العميل   :-" . $clientName,
                    'title_en' => "new appointment for client " . $clientName,
                    'message'  => "  طلب جديد لدي العميل :-" . $clientName,
                    'message_en' => "new appointment for client " . $clientName,
                    // 'message' => $request->description_ar,
                    // 'message_en' => $request->description_en,
                    'order_id' => $createdOrder->id,

                ];
        });

        // Log::info("before send  notification " .$subscribers );

        if (!empty($admins) &&  $admins != null) {
            // Log::info("send  notification " .$subscribers );
            // 
            //   Log::info( 

            // $this->sendNotification($data_send = $notification, $subscribers);
            $this->sendAdminNotification($data_send = $notification, []);
        }

        if (!empty($subscribers) &&  $subscribers != null) {

            // $this->sendNotification($data_send = $notification, $subscribers);
        }

        try {

            Mail::to(env('NOTIFICATION_EMAIL', 'aquacarelaundry@gmail.com'))
                ->send(new NewOrderNotification($createdOrder, $itemsForEmail, $discountValue));
        } catch (Exception $ex) {
            Log::error('Email with a created order not been sent to the admin.');
        }

        // start notifications

        // end notifications


    }


    public function driverOrderInDeliveryOrPickup($driverId)
    {

        $order = Order::where(function ($query) use ($driverId) {

            $query->whereHas('pickupTrasportationPeriodAssignedToDriver', function ($query) use ($driverId) {
                $query->with(['driver' => function ($query) use ($driverId) {
                    $query->where('id', $driverId);
                }]);
            })->where('status', 'in_pickup');
        })->orWhere(function ($query) use ($driverId) {

            $query->whereHas('deliveryTrasportationPeriodAssignedToDriver', function ($query) use ($driverId) {
                $query->with(['driver' => function ($query) use ($driverId) {
                    $query->where('id', $driverId);
                }]);
            })->where('status', 'in_delivery');
        })->first();
        return $order;
    }


    public function changeOrderStatus($request)
    {

        $order = $this->getById($request['order_id']);
        if($this->getLoggedInUserStoreId() != $order->store_id)
            throw new HttpResponseException($this->apiResponse(null, false, __('validation.not_authorized'), statusCode: 403));
        if(!in_array($request['status'], OrderStatusesConstant::statuses))
            throw new HttpResponseException($this->apiResponse(null, false, __('validation.invalid_status'), statusCode: 400));

        $order->update(['status' => $request['status']]);

        // additional logic based on status
        if($order->status=='processing')
        {
            $notification =
            [
                'title_ar' => "حالة الطلب رقم" . $order->id . "تغيرت",
                'title_en' => "Order status changed #" . $order->id,
                'body_ar' => "تم تغيير حالة الطلب إلى قيد التنفيذ",
                'body_en' => "Order status changed to processing",
            ];
        }else if($order->status=='in_delivery')
        {
            $notification =
            [
                'title_ar' => "حالة الطلب رقم" . $order->id . "تغيرت",
                'title_en' => "Order status changed #" . $order->id,
                'body_ar' => "جاري توصيل الطلب",
                'body_en' => "Your order is out for delivery",
            ];
        }else if($order->status=='delivered')
        {
            $notification =
            [
                'title_ar' => "تم توصيل الطلب رقم " . $order->id,
                'title_en' => "Order Delivered #" . $order->id,
                'body_ar' => "تم توصيل طلبك بنجاح",
                'body_en' => "Your order has been delivered successfully",
            ];
        }
        if(isset($notification)){

            $notificationsService = new NotificationsService();

            $notificationsService->create([
                'user_id' => $order->client_id,
                'title_en' => $notification['title_en'],
                'title_ar' => $notification['title_ar'],
                'body_en' => $notification['body_en'],
                'body_ar' => $notification['body_ar']
            ]);                          

        }

        // send notification to all related users
        /*
        $user_ids = [
            $order->client_id
        ];
        $userDeviceTokens = DeviceToken::whereIn('user_id', $user_ids)->pluck('device_token')->toArray();


        Notification::create([
            'user_id' => $order->client_id,
            'order_id' => $order->id,
            'title_ar' => "حالة الطلب تغيرت ",
            'title_en' => "Order status changed ",
            'body_ar' =>  "تم تغيير حالة الطلب " . $order->status,
            'body_en' =>  "Order status changed " . $order->status,
            'action' => "order_moved",
        ]);

        $notification =
            [
                'type' => "1",
                'title_ar' => "حالة الطلب تغيرت",
                'title_en' => "Order status changed",
                'message_ar' => $order['status'] . " تم تغيير حالة الطلب ",
                'message_en' =>  $order['status'] . " Order status changed",
            ];

        $subscribers = $userDeviceTokens;

        $this->sendNotification($data_send = $notification, $users = $subscribers);
        */
    }


    public function getClientOrdersInCartNum($clientId)
    {

        $ordersNum = Order::where('client_id', $clientId)->where('status', 'in_cart')->count();
        return $ordersNum;
    }

    public function getOrdersNumBetweenTwoTimesForDriver($driverId, $startDateTime, $endDateTime)
    {

        return Order::where(function ($query) use ($driverId) {

            $query->wherePickupDriverId($driverId)->orWhere('delivery_driver_id', $driverId);
        })

            ->where(function ($query) use ($startDateTime, $endDateTime) {

                $query
                    ->where(function ($query) use ($startDateTime) {

                        $query->where('pickup_start_date_time', '<', $startDateTime)->where('pickup_end_date_time', '>', $startDateTime);
                    })->orWhere(function ($query) use ($endDateTime) {

                        $query->where('pickup_start_date_time', '<', $endDateTime)->where('pickup_end_date_time', '>', $endDateTime);
                    })

                    ->orWhere(function ($query) use ($startDateTime) {

                        $query->where('delivery_start_date_time', '<', $startDateTime)->where('delivery_end_date_time', '>', $startDateTime);
                    })

                    ->orWhere(function ($query) use ($endDateTime) {

                        $query->where('delivery_start_date_time', '<', $endDateTime)->where('delivery_end_date_time', '>', $endDateTime);
                    })

                    ->orWhereBetween('pickup_start_date_time', [$startDateTime, $endDateTime])
                    ->orWhereBetween('pickup_end_date_time', [$startDateTime, $endDateTime])
                    ->orWhereBetween('delivery_start_date_time', [$startDateTime, $endDateTime])->orWhereBetween('delivery_end_date_time', [$startDateTime, $endDateTime]);
            })
            ->count();
    }

    public function checkDriverCapacity($order)
    {
        if (isset($order['pickup_start_date_time']) || isset($order['pickup_end_date_time'])) {
            if (isset($order['pickup_driver_id']) || isset($order['delivery_driver_id'])) {

                $driverOrderNum = 0;
                $driverId = isset($order['pickup_driver_id']) ?? isset($order['delivery_driver_id']);
                $driverOrderNum = $this->getOrdersNumBetweenTwoTimesForDriver(driverId: $driverId, startDateTime: $order['pickup_start_date_time'], endDateTime: $order['pickup_end_date_time']);

                //if driverordernum is = capacity per hour in drivers table return false

                if ($driverOrderNum >= Driver::where('user_id', $driverId)->pluck('capacity_per_hour')->first()) {

                    throw new HttpResponseException($this->apiResponse(status: false, message: "this driver have a max order per hour"));
                }
            }
        }
    }

    public function createBasedOnType($order)
    {

        //$order['order_id'] = $this->create($order)->id;
        //dd($order);
        switch ($order['role']) {

            case "client":

                $clientOrdersService = new ClientOrdersService();
                $clientOrdersService->create($order);
                break;

            case "drivers_app":

                $driversAppService = new DriversAppOrdersService();
                $driversAppService->create($order);
                break;
        }

        //  $deviceTokens = $this->getDeviceTokensForOrderStatusChangedNotification($order);
        //  $this->sendNotification(__('notifications.orderCreated'), __('notifications.orderMovedTo') . __('orders.statuses.' . $order['status']), firebaseDeviceTokens: $deviceTokens, data: ['order' => $order]);

        try {
        } catch (\Exception $ex) {

            throw new HttpResponseException($this->apiResponse(status: false));;
        }
    }


    public function getTotalPriceForOrder($items)
    {
        $totalPrice = 0;
        foreach ($items as $item) {
            $price = $item['price'] * $item['quantity'];
            $totalPrice += $price;
        }
        return $totalPrice;
    }
    public function getDiscountViaPromoCode($promoCode)
    {

        $promoCode = PromoCode::where('code', $promoCode)->first();
        $discount['value'] = $promoCode->value;
        $discount['value_type'] = $promoCode->value_type;
        return $discount;
    }
    public function create_($order)
    {

        try {
            $loggedInUser = $this->getLoggedInUser();
            switch ($loggedInUser->role) {
                case "client":
                    $order['client_id'] = $loggedInUser->id;
                    break;
            }

            $createdOrder = null;

            if (isset($order['type']) && $order["type"] == "items") {
                if ($order['price'] == null || $order['price'] == 0)
                    $order['price'] = $this->getTotalPriceForOrder($order['items']);
            }
            //$this->checkDriverCapacity($order);
            if (isset($order['promo_code']) && $order['promo_code'] != null) {

                $discount = $this->getDiscountViaPromoCode($order['promo_code']);
                $order['discount_value'] = $discount['value'];
                $order['discount_value_type'] = $discount['value_type'];
            }

            if ($order['role'] == "drivers_app") {
                $order['status'] = 'confirmed';
            } else {
                $order['status'] = 'in_cart';
                // if(isset($order['pickup_driver_assigned_to_transportation_period_id']))
                //     $order['drivers_manager_id'] = $this->getDriversManagerToOrder($order['pickup_driver_assigned_to_transportation_period_id']);
                // if(isset($order['delivery_driver_assigned_to_transportation_period_id']))
                //     $order['drivers_manager_id'] = $this->getDriversManagerToOrder($order['delivery_driver_assigned_to_transportation_period_id']);
            }

            DB::transaction(function () use ($order, &$createdOrder) {

                $createdOrder = Order::create($order);

                switch ($order['type']) {
                    case "items":
                        switch ($order['role']) {

                            case "client":

                                // loop to store their names and quantity and price

                                // product options from db
                                $productOptionIds = array_column($order['items'], 'product_option_id');
                                $productOptions = ProductOption::whereIn('id', $productOptionIds)->get();

                                foreach ($order['items'] as $orderItem) {

                                    $productOption = $productOptions->where('id', $orderItem['product_option_id'])->first();

                                    OrderItem::create([

                                        'order_id' => $createdOrder->id,
                                        'name' => $productOption['name_ar'],
                                        'price' => $productOption['price'],
                                        'quantity' => $orderItem['quantity']
                                    ]);
                                }

                                // foreach ($productOptions as $productOption) {

                                //         $quantity = 0;
                                //         foreach($order['items'] as $orderItem)
                                //             if($orderItem['product_option_id'] == $productOption->id)
                                //                 $quantity = $orderItem['quantity'];


                                //         OrderItem::create([

                                //             'order_id' => $createdOrder->id,
                                //             'name' => $productOption['name_ar'],
                                //             'price' => $productOption['price'],
                                //             'quantity' => $quantity
                                //         ]);

                                // }

                                break;
                            case "drivers_app":
                                if (isset($order['items'])) {
                                    foreach ($order['items'] as $item) {
                                        OrderItem::create([
                                            'name' => $item['name'],
                                            'price' => $item['price'],
                                            'order_id' => $createdOrder->id,
                                            'quantity' => $item['quantity'],
                                        ]);
                                    }
                                }
                        }
                        break;

                    case "easy":
                        EasyOrder::create(["order_id" => $createdOrder->id, "content" => $order['content']]);
                        break;
                };
                $order['order_id'] = $createdOrder->id;
                $this->createBasedOnType($order);
                // switch ($order['role']) {

                //         // case "client":

                //         // $clientOrdersService = new ClientOrdersService();

                //         //     $clientOrdersService->create($order);
                //         //     break;

                //     case "drivers_app":

                //         $driversAppService = new DriversAppOrdersService();
                //         $driversAppService->create($order);
                // }

                // $driverId = $order->pickup_driver_assigned_to_transportation_period_id->driver_id;
                // if($driverId == null){
                //     $driverId = $order->clientOrder->company_id;
                // }
                // if($driverId == null){
                //     $driverId = $order->driversAppOrder->user_id;
                // }

                $user_ids = [
                    $createdOrder->pickupTrasportationPeriodAssignedToDriver->driver_id ?? null,
                    $createdOrder->deliveryTrasportationPeriodAssignedToDriver->driver_id ?? null,
                    $createdOrder->clientOrder->company_id ?? null,
                    $createdOrder->driversAppOrder->user_id ?? null
                ];

                $userDeviceTokens = DeviceToken::whereIn('user_id', $user_ids)->pluck('device_token')->toArray();

                foreach ($user_ids as $user_id) {
                    if ($user_id !== null) {
                        Notification::create([
                            'user_id' => $user_id,
                            'order_id' => $createdOrder->id,
                            'title_ar' => "تم انشاء طلب ",
                            'title_en' => "Order created ",
                            'body_ar' =>  "تم انشاء طلب " . $createdOrder->status,
                            'body_en' =>  "Order created " . $createdOrder->status,
                            'action' => "order_created",
                        ]);
                    }
                }
                $notification =
                    [
                        'type' => "1",
                        'title_ar' => "تم انشاء طلب",
                        'title_en' => "Order created",
                        'message_ar' => $createdOrder['status'] . " تم انشاء طلب",
                        'message_en' =>  $createdOrder['status'] . " Order has been created",
                    ];

                $subscribers = $userDeviceTokens;

                $this->sendNotification($data_send = $notification, $users = $subscribers);
            });
            return $createdOrder;
        } catch (\Exception $ex) {

            throw new HttpResponseException($this->apiResponse(status: false));
        }
    }
    public function temp()
    {
        $order = Order::find(199)->pickupTrasportationPeriodAssignedToDriver->driver_id;
        return $order;
    }

    public function updateBasedOnRole($neworder, $order)
    {

        //$order = $this->getById($neworder['id']);
        // SELECT DRIVER MANGER FROM NEW ORDER (PICKUP || DELIVERY )DRIVER AND ADD DRIVERS MANGER TO NEW ORDER
        //$neworder = $this->getDriversManagerToOrder($neworder);
        //
        switch ($order['role']) {
            case "client":

                $clientOrdersService = new ClientOrdersService();

                $clientOrdersService->update($neworder);
                break;

            case "drivers_app":

                $driversAppService = new DriversAppOrdersService();
                $driversAppService->update($neworder);
                break;
        }
        try {
        } catch (\Exception $ex) {

            throw new HttpResponseException($this->apiResponse(status: false));
        }
    }
    public function update($newOrder)
    {
        $order = $this->getById($newOrder['id']);
        try {
            $CurrentOrderStatus = $order->status;
            DB::transaction(function () use ($order, $newOrder) {
                $order->update($newOrder);

                switch ($order->type) {
                    case "items":
                        switch ($order->role) {
                            case "client":
                                $productOptionIds = array_column($newOrder['items'], 'product_option_id');
                                $productOptions = ProductOption::whereIn('id', $productOptionIds)->get();

                                OrderItem::where('order_id', $order['id'])->delete();

                                foreach ($newOrder['items'] as $orderItem) {

                                    $productOption = $productOptions->where('id', $orderItem['product_option_id'])->first();

                                    OrderItem::create([

                                        'order_id' => $order->id,
                                        'name' => $productOption['name_ar'],
                                        'price' => $productOption['price'],
                                        'quantity' => $orderItem['quantity']
                                    ]);
                                }
                                break;
                            case "drivers_app":

                                if (isset($newOrder['items'])) {

                                    OrderItem::where('order_id', $newOrder['id'])->delete();

                                    foreach ($newOrder['items'] as $item) {

                                        OrderItem::create([
                                            'order_id' => $order->id,
                                            'name' => $item['name'],
                                            'quantity' => $item['quantity'],
                                            'price' => $item['price']
                                        ]);
                                    }
                                }
                        }
                        break;
                    case "easy":
                        $easyOrder = EasyOrder::where('order_id', $order['id'])->first();
                        $easyOrder->update(['content' => $newOrder['content']]);
                        break;
                }
                $this->updateBasedOnRole($newOrder, $order);
            });
            if (isset($newOrder['status'])) {
                if (!$CurrentOrderStatus == $newOrder['status']) {
                    $pickupStatuses = ['in_cart', 'in_waiting_list', 'confirmed', 'in_picking', 'picked_up'];

                    if (in_array($order->status, $pickupStatuses)) {
                        $driverId = $order->pickup_driver_assigned_to_transportation_period_id->driver_id;
                    } else {
                        $driverId = $order->delivery_driver_assigned_to_transportation_period_id->driver_id;
                    }
                    if ($driverId == null) {
                        $driverId = $order->clientOrder->company_id;
                    }
                    if ($driverId == null) {
                        $driverId = $order->driversAppOrder->user_id;
                    }

                    $user_ids = [
                        $order->pickupTrasportationPeriodAssignedToDriver->driver_id ?? null,
                        $order->deliveryTrasportationPeriodAssignedToDriver->driver_id ?? null,
                        $order->clientOrder->company_id ?? null,
                        $order->driversAppOrder->user_id ?? null
                    ];
                    $userDeviceTokens = DeviceToken::whereIn('user_id', $user_ids)->pluck('device_token')->toArray();

                    foreach ($user_ids as $user_id) {
                        if ($user_id !== null) {
                            Notification::create([
                                'user_id' => $user_id,
                                'order_id' => $order->id,
                                'title_ar' => "حالة الطلب تغيرت ",
                                'title_en' => "Order created ",
                                'body_ar' =>  "حالة الطلب تغيرت " . $order->status,
                                'body_en' =>  "Order created " . $order->status,
                                'action' => "order_updated",
                            ]);
                        }
                    }
                    $notification =
                        [
                            'type' => "1",
                            'title_ar' => "حالة الطلب تغيرت",
                            'title_en' => "Order status changed",
                            'message_ar' => $order['status'] . "حالة الطلب تغيرت ",
                            'message_en' =>  $order['status'] . " Order status changed",
                        ];

                    $subscribers = $userDeviceTokens;

                    $this->sendNotification($data_send = $notification, $users = $subscribers);
                }
            }

            return true;
        } catch (\Exception $ex) {

            throw new HttpResponseException($this->apiResponse(status: false));;
        }
    }
    public function getStatuses()
    {

        return OrderStatusesConstant::statuses;
    }

    public function get(
        $status = null,
        $clientId = null,
        $storeId = null,
    ) {

        $loggedInUser = $this->getLoggedInUser();
        $orders = Order::when(
            $status != null,
            function ($query) use ($status) {
                $query->where('status', $status);
            }
        );

        $orders = $orders->when(
            $clientId != null,
            function ($query) use ($clientId) {
                $query->where('client_id', $clientId);
            }
        );

        $orders = $orders->when(
            $storeId != null,
            function ($query) use ($storeId) {
                $query->where('store_id', $storeId);
            }
        );

       

        $orders->with(
            [
                'promoCode',
                'client',
                'items.product',
                'store'
            ]
        )->where('status', '!=', 'in_cart');

        return $orders->orderBy('id', 'DESC')->get();
    }

    public function getForClient()
    {

        $loggedInUser = $this->getLoggedInUser();
        $orders = Order::where('client_id', $loggedInUser->id);

        $orders->with(
            [
                'items',
                'pickupDriver:id,name,email',
                'deliveryDriver:id,name,email',
            ]
        );

        return $orders->orderBy('id', 'DESC')->get();
    }

    public function getOrderBasedonRole($orders, $loggedInUser)
    {

        switch ($loggedInUser->role) {
            case "admin":
                break;
            case "country_manager":

                $orders = $orders->where(

                    function ($query) use ($loggedInUser) {

                        $query->where(function ($query) use ($loggedInUser) {

                            $query->whereHas('clientOrder.company', function ($query) use ($loggedInUser) {

                                $query->where('country_id', $loggedInUser->countryManager->country_id);
                            })
                                ->orWhereHas('driversAppOrder.user.company', function ($query) use ($loggedInUser) {

                                    $query->where('country_id', $loggedInUser->countryManager->country_id);
                                })
                                ->orWhereHas('driversAppOrder', function ($query) use ($loggedInUser) {

                                    $query->where('user_id', $loggedInUser->id);
                                })
                                ->orWhereHas('driversAppOrder.user.driversManager', function ($query) use ($loggedInUser) {

                                    $query->where('country_id', $loggedInUser->countryManager->country_id);
                                });
                        });
                    }
                    // add drivers managers country_id and check
                );
                break;

            case "company":
                $orders = $orders->where('role', 'client')->where('status', '!=', 'in_cart')->where('status', '!=', 'in_waiting_list')->WhereHas('clientOrder', function ($query) use ($loggedInUser) {

                    $query->where('company_id', $loggedInUser->id);
                })->orWhere(function ($query) use ($loggedInUser) {

                    $query->whereHas('driversAppOrder', function ($query) use ($loggedInUser) {
                        $query->where('user_id', $loggedInUser->id);
                    });
                });

                break;
            case "drivers_manager":
                $orders = $orders->where('status', '!=', 'in_cart')->where('status', '!=', 'in_waiting_list')->where(function ($query) use ($loggedInUser) {

                    $query->where('drivers_manager_id', $loggedInUser->id)->orWhereHas('driversAppOrder', function ($query) use ($loggedInUser) {
                        $query->where('user_id', $loggedInUser->id);
                    });
                });

                break;
            case "driver":
                $orders = $orders->where(function ($query) use ($loggedInUser) {
                    // handle for pickup_driver_assigned_to_transportation_period_id and delivery_driver_assigned_to_transportation_period_id
                    $query->whereHas('pickupTrasportationPeriodAssignedToDriver', function ($query) use ($loggedInUser) {

                        $query->where('driver_id', $loggedInUser->id);
                    })
                        ->orWhereHas('deliveryTrasportationPeriodAssignedToDriver', function ($query) use ($loggedInUser) {

                            $query->where('driver_id', $loggedInUser->id);
                        });



                    // where('delivery_driver_id', $loggedInUser->id)
                    //     ->orWhere('pickup_driver_id', $loggedInUser->id);
                });

                break;
        }
        return $orders;
    }
    public function getCartOrderDetails($orderId)
    {

        $loggedInUser = $this->getLoggedInUser();
        switch ($loggedInUser->role) {

            case "client":
                $order = Order::with([
                    'promoCode',
                    'clientLocation',
                    'company' => function ($query) {
                        $query->select('id', 'name_ar', 'name_en', 'logo_path');
                    }
                ])->where('client_id', $loggedInUser->id)->where('id', $orderId)->first();

                $order->client_locations = ClientLocation::where('client_id', $loggedInUser->id)->get();

                switch ($order->type) {

                    case "items":

                        $order->items = OrderItem::with([
                            'productOption' => function ($query) {
                                $query->select('id', 'price', 'product_id');
                            },
                            'productOption.product'
                        ])->where('order_id', $order->id)->get();

                        foreach ($order->items as $key => $item) {

                            $order->items[$key]['total'] = $item->productOption['price'] * $item['quantity'];
                        }
                        if ($order->promoCode != null) {
                            throw new HttpResponseException($this->apiResponse(null, false, $order->promoCode));
                        }

                        break;
                }
                break;
        }
        return $order;
    }

    public function getOrderDetails($id)
    {

        $loggedInUser = $this->getLoggedInUser();
        switch ($loggedInUser->role) {
            case "client":

                $order = Order::with([
                    'clientLocation',
                    'company' => function ($query) {
                        $query->select('id', 'name_ar', 'name_en', 'logo_path');
                    }
                ])->where('client_id', $loggedInUser->id)->where('id', $id)->first();
                $order->client_locations = ClientLocation::where('client_id', $loggedInUser->id)->get();
                switch ($order->type) {

                    case "items":

                        $order->items = OrderItem::with(['productOption.product'])->where('order_id', $order->id)->get();

                        break;
                }
                break;
        }
        return $order;
    }

    public function getById($id)
    {

        $order = Order::where('id', $id)->first();
        if ($order == null)
            throw new HttpResponseException($this->apiResponse(null, false, __('validation.not_exist')));
        return $order;
    }

    public function orderFilter()
    {

        $loggedInUser = $this->getLoggedInUser();
        switch ($loggedInUser->role) {
            case "admin":

                $order = Order::with(['client', 'company'])

                    ->get();
                break;
        }
        return $order;
    }
    public function addItemsToCart($data)
    {

        try {

            $loggedInUser = $this->getLoggedInUser();

            $data['client_id'] = $loggedInUser->id;


            DB::transaction(function () use ($data) {

                $order = Order::firstOrNew(
                    ['client_id' => $data['client_id'], 'company_id' => $data['company_id'], 'status' => 'in_cart', 'type' => 'items']
                );
                if (isset($data['special_instructions']) && $data['special_instructions'] != null) {
                    if ($order->special_instructions != null) {

                        $order->update(['special_instructions' => $order->special_instructions . " " . $data['special_instructions']]);
                    } else {
                        $order->update(['special_instructions' => $data['special_instructions']]);
                    }
                }


                foreach ($data['items'] as $item) {

                    $orderItem = OrderItem::where('order_id', $order['id'])->where('product_option_id', $item['id'])->first();

                    if ($orderItem == null) {

                        OrderItem::create(['product_option_id' => $item['id'], 'order_id' => $order['id'], 'quantity' => $item['quantity']]);
                    } else {

                        $orderItem->update(['quantity' => $orderItem->quantity + $item['quantity']]);
                    }
                }
            });

            return;
        } catch (\Exception $ex) {

            throw new HttpResponseException($this->apiResponse(status: false));;
        }
    }

    public function deleteOrderItem($id)
    {

        try {
            $loggedInUser = $this->getLoggedInUser();
            switch ($loggedInUser->role) {
                case "client":

                    $orderItem = OrderItem::find($id);
                    if ($orderItem == null || $orderItem->order->client_id != $loggedInUser->id || $orderItem->order->status != 'in_cart')
                        throw new HttpResponseException($this->apiResponse(null, false, __('validation.not_exist')));
                    break;
            }

            $orderItem->delete();

            return;
        } catch (\Exception $ex) {

            throw new HttpResponseException($this->apiResponse(status: false));;
        }
    }

    public function updateOrderItemQuantity($newOrderItem)
    {

        try {
            $loggedInUser = $this->getLoggedInUser();
            switch ($loggedInUser->role) {
                case "client":

                    $orderItem = OrderItem::find($newOrderItem['id']);
                    // validate if he can do this
                    if ($orderItem == null || $orderItem->order->client_id != $loggedInUser->id || $orderItem->order->status != 'in_cart')
                        throw new HttpResponseException($this->apiResponse(null, false, __('validation.not_exist')));
                    break;
            }

            $orderItem->update($newOrderItem);

            return;
        } catch (\Exception $ex) {

            throw new HttpResponseException($this->apiResponse(status: false));;
        }
    }

    public function changeCompany($order)
    {

        try {
            $newCompanyId = $order['company_id'];
            $order = $this->getById($order['id']);
            switch ($order['type']) {

                case "easy":

                    $order->update(['company_id' => $newCompanyId]);
                    break;
                case "items":

                    DB::transaction(function () use ($order) {
                        $order->update(['type' => 'easy']);
                        $content = '';
                        foreach ($order->items as $item) {

                            $content .= $item->productOption->name_ar . ' => ' . $item->quantity . ' \n ';
                        }

                        EasyOrder::create(["order_id" => $order->id, "content" => $content]);
                        OrderItem::where('order_id', $order->id)->delete();
                    });

                    break;
            }

            return;
        } catch (\Exception $ex) {

            throw new HttpResponseException($this->apiResponse(status: false));;
        }
    }


    public function rate($data)
    {

        try {

            $loggedInUser = $this->getLoggedInUser();
            switch ($loggedInUser->role) {
                case "client":

                    $data['client_id'] = $loggedInUser->id;
                    if (isset($data['comment']) && $data['comment'] != null) {

                        $order = $this->getById($data['order_id']);
                        $order->update(['comment' => $data['comment']]);
                    }
                    foreach ($data['rates'] as $rate) {

                        OrderHaveBaseOrdersRate::updateOrCreate([
                            'base_orders_rate_id' => $rate['base_orders_rate_id'],
                            'order_id' => $data['order_id']
                        ], ['value' => $rate['value']]);
                    }

                    break;
            }

            return;
        } catch (\Exception $ex) {

            throw new HttpResponseException($this->apiResponse(status: false));;
        }
    }



    public function delete($id)
    {

        $order = $this->getById($id);

        if (!$this->canLoggedInUserDeleteOrder($order))
            throw new HttpResponseException($this->apiResponse(null, false, __('you_cannot_delete_this_order')));

        $this->deleteChildren($order);
        if ($order)
            $order->delete();
        try {
        } catch (Exception $ex) {

            throw new HttpResponseException($this->apiResponse(null, false, __('order.delete_error')));
        }
    }
    public function deleteChildren($order)
    {
        switch ($order->role) {
            case "client":
                $clientOrdersService = new ClientOrdersService();
                $clientOrdersService->delete($order->id);
                break;
        }

        /// DELETE ORDER ITEM

        OrderItem::where('order_id', $order->id)->delete();

        //// DELETE ORDER COMMENT
        OrderComment::where('order_id', $order->id)->delete();

        //// DELETE EASY ORDER
        EasyOrder::where('order_id', $order->id)->delete();
    }
    public function canUserRoleCreateOrderRole($userRole, $orderRole)
    {

        // if($userRole == 'client')
        //     return $orderRole == 'client';
        switch ($userRole) {
            case "admin":
            case "country_manger":
                return true;

            case 'client':
                if ($orderRole == 'client')
                    return true;
            default:
                return $orderRole == 'drivers_app';
        }
    }

    public function canUserRoleUpdateOrderRole($userRole, $orderRole)
    {

        switch ($userRole) {
            case "admin":
            case "country_manger":
                return true;

            case 'client':
                return $orderRole == 'client';
            case 'company':
            case "drivers_manager":
                return $orderRole == 'drivers_app';
        }
    }

    public function canUserAccessOrderDetails($user, $orderId)
    {

        // $order = $this->getById($orderId);
        // validate drivers manager, country manager, company
        $user = $this->getLoggedInUser();
        $order = $this->getById($orderId);

        switch ($order->role) {
            case "client":
                $clientOrdersService = new ClientOrdersService();
                return $clientOrdersService->canUserAccessOrderDetails($order, $user);

            case "drivers_app":
                $driversAppService = new DriversAppOrdersService();
                // return $driversAppService->canUserAccessOrderDetails($order, $user);
        }
    }

    public function canUserAddCommentToOrder($user, $orderId)
    {

        // $order = $this->getById($orderId);
        // validate drivers manager, country manager, company
        $order = $this->getById($orderId);
        $ids[] = $order->delivery_driver_id;
        $ids[] = $order->pickup_driver_id;
        $ids[] = $order->company_id;


        return $user->role == "admin" || in_array($user->id, $ids);
    }
    public function canLoggedInUserDeleteOrder($order)
    {

        $loggedInUser = $this->getLoggedInUser();

        switch ($loggedInUser->role) {
            case "admin":
                return true;

            case "country_manager":

                switch ($order->role) {
                    case 'client':
                        return $order->clientOrder->company->country_id == $loggedInUser->countryManager->country_id;

                    case 'drivers_app':

                        if ($order->driversAppOrder->user_id == $loggedInUser->id)
                            return true;
                        if ($order->driversAppOrder->user->role == 'drivers_manager')
                            return $order->driversAppOrder->user->driversManager->country_id == $loggedInUser->countryManager->country_id;
                        else if ($order->driversAppOrder->user->role == 'company')
                            return $order->driversAppOrder->user->company->country_id == $loggedInUser->countryManager->country_id;
                }
                break;
            case "company":
                switch ($order->role) {
                    // case 'client':
                    //     return $order->clientOrder->company_id == $loggedInUser->id;

                    case 'drivers_app':
                        return ($order->driversAppOrder->user_id == $loggedInUser->id && $order->status != "in_delivery");
                }
                break;
            case "drivers_manager":

                return $order->driversAppOrder->user_id == $loggedInUser->id;
                // case "client":
                //     if ($order->clientOrder->client_id == $loggedInUser->id && $order->status == "in_cart")
                //         return true;
        }
        return false;
    }



    public function canUserCreateOrderWithCompanyIdAndTransportationPeriodAssignedToDriver($transportationPeriodsAssignedToDriverId, $driverId, $companyId, $pickupDate)
    {

        // check if driver_id is exist in transportation_periods_assigned_to_drivers table

        $transportationPeriodsAssignedToDriver = TransportationPeriodAssignedToDriver::find($transportationPeriodsAssignedToDriverId);
        //dd($transportationPeriodsAssignedToDriver);
        if ($transportationPeriodsAssignedToDriver->driver_id != $driverId) {

            throw new HttpResponseException($this->apiResponse(null, false, __('driver_dosent_belong_to_period')));
        }
        if (!($transportationPeriodsAssignedToDriver->transportationPeriod->user_id == $companyId /*|| $transportationPeriodsAssignedToDriver->transportationPeriod->user_id ==*/)) {

            throw new HttpResponseException($this->apiResponse(null, false, __('period_dosent_belong_to_company')));
        }
        if ($this->driverCapacity($transportationPeriodsAssignedToDriver, $pickupDate))
            return true;
    }
    //make function check driver capacity take two parameter transportationPeriodsAssignedToDriver and pickupdate select last order from orders where driver id = transportationPeriodsAssignedToDriver
    public function driverCapacity($transportationPeriodsAssignedToDriver, $pickupDate)
    {

        $driverOrderInPeriod = Order::where('delivery_driver_assigned_to_transportation_period_id', $transportationPeriodsAssignedToDriver->driver_id)
            ->orwhere('pickup_driver_assigned_to_transportation_period_id', $transportationPeriodsAssignedToDriver->driver_id)
            ->where('pickup_date', $pickupDate)->count();
        //dd($driverOrderInPeriod >= $transportationPeriodsAssignedToDriver->capacity);

        if ($driverOrderInPeriod >= $transportationPeriodsAssignedToDriver->capacity)
            throw new HttpResponseException($this->apiResponse(null, false, __('driver_has_full_capacity')));

        // return true;

    }
}
