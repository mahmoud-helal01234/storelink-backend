<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Traits\ResponsesTrait;
use App\Http\Controllers\Controller;

use Illuminate\Support\Facades\Auth;

use App\Http\Services\ClientsService;
use Laravel\Socialite\Facades\Socialite;
use GuzzleHttp\Exception\ClientException;
use App\Http\Requests\Client\StoreRequest;
use App\Http\Requests\Client\UpdateRequest;
use App\Http\Requests\Client\ClientLoginRequest;
use App\Http\Requests\Client\UpdateProfileRequest;
use App\Http\Requests\Client\ClientRegisterRequest;
use App\Http\Requests\Client\ForgetPasswordRequest;
use App\Http\Requests\Client\ToggleActivationRequest;
use App\Http\Requests\Client\ClientSocialLoginRequest;
use App\Http\Requests\Client\UpdateClientProfileRequest;

class ClientsController extends Controller
{

    use ResponsesTrait;
    private $clientsService;
    public function __construct()
    {

        $this->clientsService = new ClientsService();
    }

    public function me()
    {

        $client = $this->clientsService->me();
        return $this->apiResponse($client);
    }


    public function get()
    {

        $clients = $this->clientsService->get();
        return $this->apiResponse($clients);
    }


    public function login(ClientLoginRequest $request)
    {

        $user = $request->validated();
        $LoggedInUser = $this->clientsService->login($user);
        return $this->apiResponse($LoggedInUser, true, __('success.login'));
    }

    public function register(ClientRegisterRequest $request)
    {

        $user = $request->validated();
        $CreatedUser = $this->clientsService->register($user);

        return $this->apiResponse($CreatedUser, true, __('success.register'));
    }


    public function selectClientsByCompany($companyId)
    {

        $clientsForCompany = $this->clientsService->selectClientsByCompany($companyId);
        return $this->apiResponse($clientsForCompany);
    }
    public function viewProfile()
    {
        $client = $this->clientsService->viewProfile();

        return $this->apiResponse($client);
    }

    public function updateProfile(UpdateClientProfileRequest $request)
    {

        $client = $request->validated();
        $this->clientsService->updateProfile($client);

        return $this->apiResponse(status: true,message: __('success.updated'));
    }
    

    public function forgetPassword(ForgetPasswordRequest $request)
    {

        $email = $request->validated();
        $this->clientsService->forgetPasswordEmail($email);

        return $this->apiResponse();
    }


    public function logout()
    {

        Auth::guard('authenticate-clients')->logout();
        return response()->json([
            'status' => 'success',
            'message' => 'Successfully logged out',
        ]);
    }

    public function refresh()
    {
        return response()->json([
            'status' => 'success',
            'user' => Auth::user(),
            'authorisation' => [
                'token' => Auth::refresh(),
                'type' => 'bearer',
            ]
        ]);
    }

    public function socialLogin(ClientSocialLoginRequest $request)
    {

        $user = $request->validated();
        $response = $this->clientsService->socialLogin($user);
        return $this->apiResponse($response, true, __('success.login'));
        
       
    }


    public function create(StoreRequest $request)
    {

        $client = $request->validated();
        $this->clientsService->create($client);
        return $this->apiResponse();
    }

    public function update(UpdateRequest $request)
    {

        $user = $request->validated();
        $this->clientsService->update($user);
        return $this->apiResponse();
    }

    public function delete($id)
    {

        $this->clientsService->delete($id);
        return $this->apiResponse(null, true, __('deleted'));
    }
}
