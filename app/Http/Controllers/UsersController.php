<?php

namespace App\Http\Controllers;

use App\Http\Traits\ResponsesTrait;
use App\Http\Controllers\Controller;


use App\Http\Requests\Client\ToggleActivationRequest;
use App\Http\Services\UsersService;

class UsersController extends Controller
{

    use ResponsesTrait;
    private $usersService;
    public function __construct()
    {

        $this->usersService = new UsersService();
    }
    public function toggleActivation(ToggleActivationRequest $request)
    {

        $this->usersService->toggleActivation($request);
        return $this->apiResponse();
    }

}
