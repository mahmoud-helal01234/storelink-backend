<?php

namespace App\Http\Traits;

use App\Http\Traits\ResponsesTrait;
use App\Http\Services\StoresService;
use Illuminate\Support\Facades\Auth;
use App\Http\Services\ClientsService;


trait LoggedInUserTrait {

use ResponsesTrait;

    public function getLoggedInUserRole(){

        $loggedInUser = $this->getLoggedInUser();
        return $loggedInUser->role;
    }

    public function getLoggedInUser(){

        $loggedInUser = Auth::guard('authenticate')->user();
        if(!$loggedInUser){
            $loggedInUser = Auth::guard('authenticate-clients')->user();
            if($loggedInUser)
                $loggedInUser->role = "client";
        }
        return $loggedInUser;
    }

    public function getLoggedInUserStoreId(){

        $loggedInUser = $this->getLoggedInUser();
        return $loggedInUser->id;
    }

    public function getLoggedInUserClientId(){

        $loggedInUser = $this->getLoggedInUser();
        return $loggedInUser->id;
    }

    public function isLoggedInUserStore(){

        $loggedInUser = $this->getLoggedInUser();
        return $loggedInUser->role == "store";
    }

    public function isLoggedInUserClient(){

        $loggedInUser = $this->getLoggedInUser();
        return $loggedInUser->role == "client";
    }

}
