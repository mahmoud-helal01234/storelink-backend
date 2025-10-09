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


    public function get()
    {

        $orders = $this->clientOrdersService->get(statuses :request('statuses'),whereNotStatus:request('not_status'), companyId: request('company_id') , clientId:request('client_id'), from :request('from') , to : request('to'));
        return $this->apiResponse($orders);
    }

    public function getWorkingOn()
    {

        $clientOrders = $this->clientOrdersService->get(null, ['in_cart', 'done']);
        return $this->apiResponse($clientOrders);
    }
    // public function getCartClientOrderDetails()
    // {

    //     $clientOrders = $this->clientOrdersService->getCartClientOrderDetails(request('clientOrder_id'));
    //     return $this->apiResponse($clientOrders);
    // }

    // public function getClientOrderDetails($id)
    // {

    //     $clientOrders = $this->clientOrdersService->getClientOrderDetails($id);
    //     return $this->apiResponse($clientOrders);
    // }

    public function getClientOrdersInCartNum()
    {
        $cartNum = $this->clientOrdersService->getClientOrdersInCartNum(request('client_id'));
        return $this->apiResponse($cartNum);
    }
    public function getClientOrdersInCart()
    {
        $orderInCart = $this->clientOrdersService->getClientOrdersInCart(request('client_id'));
        return $this->apiResponse(OrderInCartResource::collection($orderInCart));
    }
    public function getClientOrders()
    {
        $clientOrders = $this->clientOrdersService->getClientOrders(request('order_id'));
        return $this->apiResponse($clientOrders);
    }
    public function create(StoreRequest $request)
    {
        // throw new HttpResponseException($this->apiResponse("sometimes|nullable|date_format:Y-m-d H:i". (request('pickup_start_date_time') ?  ("|after:" .Carbon::createFromFormat("Y-m-d H:i",request('pickup_start_date_time'))->addHours(23)->format("Y-m-d H:i")):"")));
        $data = $request->validated();
        $this->clientOrdersService->create($data);
        return $this->apiResponse();
    }

    public function update(UpdateRequest $request)
    {

        $clientOrder = $request->validated();
        $this->clientOrdersService->update($clientOrder);
        return $this->apiResponse();
    }

    // done till here

    // public function rate(RateClientOrderRequest $request)
    // {
    //     $data = $request->validated();
    //     $this->clientOrdersService->rate($data);
    //     return $this->apiResponse();
    // }

    public function addPromoCodeToOrder(AddPromoCodeToOrderRequest $request)
    {
        $data = $request->validated();
        $this->clientOrdersService->addPromoCodeToOrder($data);
        return $this->apiResponse(null, true, __('success.added'));
    }
    public function checkOut(CheckOutRequest $request)
    {

        $data = $request->validated();
        $this->ordersService->checkOut($data);
        return $this->apiResponse();
    }

    public function addProductOptionsToCart(AddProductsToCartRequest $request)
    {

        $data = $request->validated();
        $this->clientOrdersService->addProductOptionsToCart($data);
        return $this->apiResponse(null, true, __('success.added'));
    }

    public function changeCompany(ChangeCompanyRequest $request)
    {

        $data = $request->validated();
        $this->clientOrdersService->changeCompany($data);
        return $this->apiResponse();
    }

    public function addItem(StoreItemRequest $request)
    {

        // $data = $request->validated();
        // $this->clientOrdersService->addItem($data);
        // return $this->apiResponse(null, true, __('success.added'));
    }



    // public function updateClientOrderItem(UpdateClientOrderItemRequest $request)
    // {

    //     $clientOrderItem = $request->validated();
    //     $this->clientOrdersService->updateClientOrderItemQuantity($clientOrderItem);
    //     return $this->apiResponse();
    // }

    // public function deleteClientOrderItem($id){

    //     $this->clientOrdersService->deleteClientOrderItem($id);
    //     return $this->apiResponse(null, true, __('deleted'));
    // }

    public function delete($id)
    {

        $this->clientOrdersService->delete($id);
        return $this->apiResponse(null, true, __('deleted'));
    }
}
