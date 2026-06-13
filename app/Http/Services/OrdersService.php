<?php

namespace App\Http\Services;

use Exception;
use Carbon\Carbon;
use App\Models\Order;
use App\Models\Review;
use App\Models\OrderItem;
use Illuminate\Support\Facades\DB;
use App\Http\Traits\ResponsesTrait;
use App\Http\Traits\ArraySliceTrait;
use App\Http\Services\ProductsService;
use App\Http\Traits\LoggedInUserTrait;
use App\Http\Traits\NotificationTrait;
use App\Http\Services\PromoCodesService;
use App\Http\Constants\OrderStatusesConstant;
use App\Http\enums\DeliveryType;
use Illuminate\Http\Exceptions\HttpResponseException;

class OrdersService
{

    use ResponsesTrait, ArraySliceTrait;
    use LoggedInUserTrait, NotificationTrait;


    public function getMyOrders()
    {
        if ($this->isLoggedInUserStore()) {
            $storeId = $this->getLoggedInUserStoreId();
            $orders = Order::with(['items.product', 'store', 'client', 'promoCode', 'review'])
                ->where('store_id', $storeId)
                ->where('status', '!=', 'in_cart')
                ->orderBy('created_at', 'DESC')
                ->get();

            return $orders;
        } else if ($this->isLoggedInUserClient()) {

            $clientId = $this->getLoggedInUserClientId();
            $orders = Order::with(['items.product', 'store', 'client', 'promoCode', 'review'])
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

        if ($order != null) {
            // validate promo code if expired remove it
            if ($order->promoCode != null && Carbon::parse($order->promoCode->expiration_datetime)->lt(now())) {
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
        $storeService = new StoresService();
        $store = $storeService->getById($storeId);
        
        // get client id
        $clientId = $this->getLoggedInUser()->id;
        DB::beginTransaction();
        try {


            // get/create order in cart for this client and this store
            $order = Order::where('status', 'in_cart')->where('client_id', $clientId)->where('store_id', $storeId)->first();

            if ($order == null) {
                // get in_cart order for this product's store if not exist remove the other store's active orders for this client then add the current store order.
                Order::where('status', 'in_cart')->where('client_id', $clientId)->delete();
                $order = Order::create([
                    'client_id' => $clientId,
                    'store_id' => $storeId,
                    'status' => 'in_cart',
                    'price' => 0,
                    'delivery_type' => $store->delivery_type
                ]);
            }

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
                    $order = $order->fresh();
                    $order = $this->calculateCartOrderPrices($order);
                    $order->save();
                    if ($order->items()->count() == 0) {
                        $order->delete();
                    }
                    DB::commit();
                    return;
                } else {
                    $orderItem->quantity = $addedProduct['quantity'];
                    $orderItem->save();
                }
            }
            $order = $order->fresh();
            $order = $this->calculateCartOrderPrices($order);
            $order->save();
            DB::commit();
        } catch (Exception $ex) {
            DB::rollBack();
            throw new HttpResponseException($this->apiResponse(null, false, __('validation.something_went_wrong')));
        }
        return;
    }

    public function calculateCartOrderPrices($order)
    {

        $price = 0;
        $order->load('items.product', 'promoCode', 'store');

        foreach ($order->items as $item) {

            if ($item->product->offer_price != null && $item->product->offer_price > 0)
                $item->price = $item->product->offer_price;
            else
                $item->price = $item->product->price;
            $item->save();
            $price += $item->price * $item->quantity;
        }

        $order->price = $price;

        $order->total_price = $price;

        // apply promo code & validate it if exists 
        if ($order->promo_code_id != null) {
            $discountValue = 0;
            $promoCodesService = new PromoCodesService();
            try {
                $promoCodesService->validatePromoCodeById($order->promo_code_id);
            } catch (HttpResponseException $ex) {
                $order->promo_code_id = null;
                $order->promo_code_discount = 0;
            }

            if ($order->promo_code_id != null) {
                $promoCode = $order->promoCode;
                if ($promoCode->discount_type == 'percentage') {
                    $discountValue = $price * $promoCode->value / 100;
                } else {
                    $discountValue = $promoCode->value;
                }
                $order->promo_code_discount = $discountValue;

                $order->total_price = max(0, $order->total_price - $discountValue);
            }
        }

        $order->delivery_type = $order->store->delivery_type;
        if ($order->delivery_type == DeliveryType::FIXED_PRICE->name) {
            // get delivery charge     
            $order->delivery_charge = $order->store->delivery_charge;

            if ($order->delivery_charge > 0)
                $order->total_price += $order->delivery_charge;
        }

        return $order;
    }


    public function checkOut($data)
    {

        $order = Order::with(['items.product', 'store', 'client'])->findOrFail($data['order_id']);

        $this->canClientEditOrder($order);
        $order->delivery_type = $order->store->delivery_type;

        $order = $this->calculateCartOrderPrices($order);

        // set location
        $order->lat = $order->client->lat;
        $order->long = $order->client->long;
        $order->status = 'pending';
        
        $order->save();
        $notificationsService = new NotificationsService();

        $notificationsService->create([
            'user_id' => $order->store_id,
            'order_id' => $order->id,
            'title_en' => "New order placed #" . $order->id,
            'title_ar' => "تم تقديم طلب جديد " . $order->id,
            'body_en' => "A new order has been placed by " . $order->client->name,
            'body_ar' => "تم تقديم طلب جديد بواسطة " . $order->client->name
        ], app: "store");

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
        if (!$this->isOrderForLoggedInClient($order) || $order->status != 'delivered')
            throw new HttpResponseException($this->apiResponse(null, false, __('validation.not_authorized'), statusCode: 403));
        return true;
    }


    public function applyPromoCode($addedPromoCode)
    {

        // validate it's not expired 
        $promoCodesService = new PromoCodesService();

        $promoCode = $promoCodesService->validatePromoCode($addedPromoCode['promo_code']);

        // validate it's corresponding to same order's store and for logged in client
        $order = $this->getById($addedPromoCode['order_id']);

        if ($order->store_id != $promoCode->store_id)
            throw new HttpResponseException($this->apiResponse(null, false, __('validation.not_exist'), statusCode: 404));

        $this->canClientEditOrder($order);

        // validate that it's not used before by this client
        if (Order::where('client_id', $order->client_id)->where('promo_code_id', $promoCode->id)->WhereNotIn('status',['returned', 'canceled'])->count() > 0)
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


    public function changeOrderStatus($request)
    {

        $order = $this->getById($request['order_id']);
        if ($this->getLoggedInUserStoreId() != $order->store_id)
            throw new HttpResponseException($this->apiResponse(null, false, __('validation.not_authorized'), statusCode: 403));
        if (!in_array($request['status'], OrderStatusesConstant::statuses))
            throw new HttpResponseException($this->apiResponse(null, false, __('validation.invalid_status'), statusCode: 400));

        $order->update(['status' => $request['status']]);

        // additional logic based on status
        if ($order->status == 'processing') {
            $notification =
                [
                    'title_ar' => "حالة الطلب رقم" . $order->id . "تغيرت",
                    'title_en' => "Order status changed #" . $order->id,
                    'body_ar' => "تم تغيير حالة الطلب إلى قيد التنفيذ",
                    'body_en' => "Order status changed to processing",
                ];
        } else if ($order->status == 'in_delivery') {
            $notification =
                [
                    'title_ar' => "حالة الطلب رقم" . $order->id . "تغيرت",
                    'title_en' => "Order status changed #" . $order->id,
                    'body_ar' => "جاري توصيل الطلب",
                    'body_en' => "Your order is out for delivery",
                ];
        } else if ($order->status == 'delivered') {
            $notification =
                [
                    'title_ar' => "تم توصيل الطلب رقم " . $order->id,
                    'title_en' => "Order Delivered #" . $order->id,
                    'body_ar' => "تم توصيل طلبك بنجاح",
                    'body_en' => "Your order has been delivered successfully",
                ];
        }

        if (isset($notification)) {

            $notificationsService = new NotificationsService();

            $notificationsService->create([
                'user_id' => $order->client_id,
                'title_en' => $notification['title_en'],
                'title_ar' => $notification['title_ar'],
                'body_en' => $notification['body_en'],
                'body_ar' => $notification['body_ar']
            ], 'client');
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
                'store',
                'review'
            ]
        )->where('status', '!=', 'in_cart');

        return $orders->orderBy('id', 'DESC')->get();
    }

    public function getById($id)
    {

        $order = Order::where('id', $id)->first();
        if ($order == null)
            throw new HttpResponseException($this->apiResponse(null, false, __('validation.not_exist')));
        return $order;
    }
}
