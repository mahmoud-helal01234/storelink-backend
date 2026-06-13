<?php

namespace App\Http\Controllers;

use App\Http\Traits\ResponsesTrait;
use App\Http\Controllers\Controller;
use App\Http\Services\OrdersService;
use App\Http\Traits\FileUploadTrait;
use App\Http\Resources\OrderInCartResource;

use App\Http\Requests\Order\CheckOutRequest;

use App\Http\Requests\Order\StoreItemRequest;
use App\Http\Requests\ClientOrder\StoreRequest;
use App\Http\Requests\Order\ReviewOrderRequest;
use App\Http\Requests\ClientOrder\UpdateRequest;
use App\Http\Requests\Order\ChangeCompanyRequest;
use App\Http\Requests\Order\AddProductToCartRequest;
use App\Http\Requests\Order\ChangeOrderStatusRequest;
use App\Http\Requests\Order\AddPromoCodeToOrderRequest;
use App\Http\Requests\Order\CancelPromoCodeFromOrderRequest;

class OrdersController extends Controller
{

    use ResponsesTrait;
    use FileUploadTrait;
    private $ordersService;

    public function __construct()
    {

        $this->ordersService = new OrdersService();
    }

    public function get()
    {

        $orders = $this->ordersService->get(status: request('status'),storeId: request('store_id'), clientId: request('client_id'));
        return $this->apiResponse($orders);
    }

    public function getMyOrders()
    {

        $orders = $this->ordersService->getMyOrders();
        return $this->apiResponse($orders);
    }
    
    public function getCartDetails()
    {

        $cartDetails = $this->ordersService->getCartDetails();
        return $this->apiResponse($cartDetails);
    }


    public function addProductToCart(AddProductToCartRequest $request)
    {

        $data = $request->validated();
        $this->ordersService->addProductToCart($data);
        return $this->apiResponse();
    }

    public function applyPromoCode(AddPromoCodeToOrderRequest $request)
    {

        $data = $request->validated();
        $cartDetails = $this->ordersService->applyPromoCode($data);
        return $this->apiResponse($cartDetails);
    }

    public function cancelPromoCode(CancelPromoCodeFromOrderRequest $request)
    {

        $data = $request->validated();
        $cartDetails = $this->ordersService->cancelPromoCode($data);
        return $this->apiResponse($cartDetails);
    }

    public function reviewOrder(ReviewOrderRequest $request)
    {

        $data = $request->validated();
        $this->ordersService->reviewOrder($data);
        return $this->apiResponse();
    }

    public function changeOrderStatus(ChangeOrderStatusRequest $request)
    {

        $data = $request->validated();
        $this->ordersService->changeOrderStatus($data);
        return $this->apiResponse();
    }


   
    public function checkOut(CheckOutRequest $request)
    {

        $data = $request->validated();
        $this->ordersService->checkOut($data);
        return $this->apiResponse();
    }

   
}
