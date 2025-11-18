<?php

namespace App\Http\Controllers;

use App\Http\Traits\ResponsesTrait;
use App\Http\Services\NotificationsService;
use App\Http\Traits\FileUploadTrait;
use App\Http\Controllers\Controller;

class NotificationsController extends Controller
{

    use ResponsesTrait;
    use FileUploadTrait;

    private $notificationsService;

    public function __construct()
    {

        $this->notificationsService = new NotificationsService();
    }

    public function test()
    {

        $notificationsService = new NotificationsService();

        $notificationsService->create([
            'user_id' => 2,
            'order_id' => 2,
            'title_en' => "New order placed #" . 2,
            'title_ar' => "تم تقديم طلب جديد " . 2,
            'body_en' => "A new order has been placed by " . "Client Name",
            'body_ar' => "تم تقديم طلب جديد بواسطة " . "client name",
        ], "store");
        return $this->apiResponse();
    }

    public function get()
    {


        $notifications = $this->notificationsService->get();
        return $this->apiResponse($notifications);
    }

    // public function create(StoreRequest $request)
    // {

    //     $notification = $request->validated();

    //     $this->notificationsService->create($notification);

    //     return $this->apiResponse();
    // }
    public function delete($id)
    {

        $this->notificationsService->delete($id);
        return $this->apiResponse(null, true, __('deleted'));
    }

}

