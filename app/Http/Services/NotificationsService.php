<?php

namespace App\Http\Services;

use App\Models\User;
use App\Http\Traits\ResponsesTrait;
use App\Http\Traits\LoggedInUserTrait;
use App\Http\Traits\NotificationTrait;
use App\Models\DriversApp\Notification;
use Illuminate\Http\Exceptions\HttpResponseException;

class NotificationsService
{

    use ResponsesTrait, LoggedInUserTrait, NotificationTrait;

    public function get()
    {

        return Notification::with('user')
            ->where('user_id', $this->getLoggedInUser()->id)->orderBy('created_at', 'DESC')->get();
    }

    public function getById($id)
    {

        $notification = Notification::find($id);
        if ($notification == null)
            throw new HttpResponseException($this->apiResponse(null, false, __('validation.not_exist')));
        return $notification;
    }

    public function create($notification, $app = "client")
    {

        try {

            $createdNotification = Notification::create($notification);
            $oneSignalDeviceId = 
            User::where('id', $notification['user_id'])->first()->one_signal_device_id;
            if ($oneSignalDeviceId == null)
                return $createdNotification;

            $this->sendNotification(
                [
                    "title_ar" => $notification['title_ar'],
                    "title_en" => $notification['title_en'],
                    "body_ar" => $notification['body_ar'],
                    "body_en" => $notification['body_en'],
                    "notification_type" => "order_status_changed",
                    "order_id" => $notification['order_id']
                ],
                [$oneSignalDeviceId],
                $app
            );
            return $createdNotification;
        }
         catch (\Exception $ex) {

            throw new HttpResponseException($this->apiResponse(status: false));
        }
    }

    public function delete($id)
    {

        $notification = $this->getById($id);

        $this->canUserDeleteNotification($this->getLoggedInUser(), $notification);
        try {

            $notification->delete();
        } catch (\Exception $ex) {

            throw new HttpResponseException($this->apiResponse(null, false, __('validation.cannot_delete')));
        }
    }

    public function canUserDeleteNotification($user, $notification)
    {

        if ($user->role == "admin" || $user->id == $notification->user_id)
            return;
        else
            throw new HttpResponseException($this->apiResponse(status: false));
    }
}
