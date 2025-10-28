<?php

namespace App\Http\Services;

use App\Models\User;
use App\Models\Client;
use Illuminate\Support\Facades\DB;
use Tymon\JWTAuth\Facades\JWTAuth;
use Illuminate\Support\Facades\Log;
use App\Http\Traits\ArraySliceTrait;
use App\Http\Traits\FileUploadTrait;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use App\Http\Traits\LoggedInUserTrait;
use App\Http\Services\Users\AuthService;
use App\Http\Resources\Auth\ClientLoginResource;
use Illuminate\Http\Exceptions\HttpResponseException;


class ClientsService
{

    use FileUploadTrait;
    use ArraySliceTrait;
    use LoggedInUserTrait;

    public function me()
    {

        $user = $this->getLoggedInUser();
        if (!$this->isLoggedInUserClient()) {
            throw new HttpResponseException($this->apiResponse(null, false, __('unauthorized')));
        }

        $user->client;
        return $user;
    }

    public function getClientIdByUserId($userId)
    {

        Log::info("start get stores");

        $client = Client::where('user_id', $userId)->
            // with('')
            // ->when($storeId != null,
            // function ($query) use($storeId){
            //     return $query->where('store_id',$storeId);
            // })->
            get()->first();
        return $client->id;
    }


    public function login($user)
    {

        // Config::set('jwt.user', 'App\Models\User');
        // Config::set('auth.providers.users.model', \App\Models\User::class);
        $credentials = $this->array_slice_assoc($user, ['email', 'password']);

        $token = Auth::guard('authenticate')->attempt($credentials);

        if (!$token || !$this->isLoggedInUserClient()) {

            throw new HttpResponseException($this->apiResponse(null, false, __('wrong email or password')));
        }

        $authUser = Auth::guard('authenticate')->user();
        if($authUser->active == 0){
            throw new HttpResponseException($this->apiResponse(null, false, __('account not active')));
        }

        if($authUser->is_verified == 0){
            // send otp to user's email
            $authService = new AuthService();
            $authService->sendOTP($authUser->email);
            throw new HttpResponseException($this->apiResponse(["is_verified" => 0], false, __('account not verified')));
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


    public function register($request)
    {

        // Config::set('jwt.user', 'App\Models\User');
        // Config::set('auth.providers.users.model', \App\Models\User::class);

        DB::beginTransaction();
        // 1- create user
        $user = $this->array_slice_assoc($request, ['email', 'password']);
        $user['role'] = 'client';
        $user['active'] = 1;

        $user = User::create($user);

        // 2- create client with user_id
        $client = $this->array_slice_assoc($request, ['name', 'address', 'lat', 'long', 'phone']);
        $client['user_id'] = $user->id;
        $createdClient = Client::create($client);

        // 3- create token for user
        $credentials =  ['email' => $user['email'], 'password' => $user['password']];
        // $token = Auth::guard('authenticate-clients')->attempt($credentials);
        $token = JWTAuth::fromUser($user);
        // $token = Auth::guard('authenticate-clients')->attempt($credentials);

        DB::commit();
        $user->token = $token;
        $user->phone = $createdClient->phone;
        return ClientLoginResource::make($user);
    }

    // public function register($client)
    // {

    //     // Config::set('jwt.user', 'App\Models\User');
    //     // Config::set('auth.providers.users.model', \App\Models\User::class);

    //     $password = $client['password'];
    //     $createdClient = Client::create($client);

    //     $credentials =  ['email' => $client['email'], 'password' => $password];
    //     // $token = Auth::guard('authenticate-clients')->attempt($credentials);
    //     $token = JWTAuth::fromUser($createdClient);
    //     // $token = Auth::guard('authenticate-clients')->attempt($credentials);
    //     $createdClient['token'] = $token;

    //     return ClientLoginResource::make($createdClient);
    // }

    public function updateProfile($request)
    {

        $clientId = $this->getLoggedInUser()->id;
        $client = $this->getById($clientId);
        $newClient = $this->array_slice_assoc($request, ['address', 'lat', 'long', 'phone']);
        
        $client->update($newClient);
        $newUser = $this->array_slice_assoc($request, ['name', 'email']);
        if (isset($request['password']) && $request['password'] != null)
            $newUser['password'] = $request['password']; 
        $client->user->update($newUser);

        return;
    }

    public function forgetPasswordEmail($email)
    {

        Mail::send('emails.forget_password', [], function ($message) use ($email) {

            $message->to($email)->subject('Subject of the message!');
        });
        // $client = Client::where('email',$email);

        // if($client == null)
        //     throw new HttpResponseException($this->apiResponse(null, false, __('validation.not_exist')));

    }

    public function getById($id)
    {

        $client = Client::find($id);
        if ($client == null)
            throw new HttpResponseException($this->apiResponse(null, false, __('validation.not_exist')));
        return $client;
    }

    public function get()
    {

        $clients = User::with('client')->where('role', 'client')->get();

        return $clients;
    }

    public function toggleActivation($request)
    {

        $client = $this->getById($request->client_id);
        try {

            $client->update(['active' => $request->status]);
        } catch (\Exception $ex) {

            throw new HttpResponseException($this->apiResponse(null, false, __('validation.cannot_delete')));
        }
    }

    public function viewProfile()
    {
        $loggedInUser = $this->getLoggedInUser();
        if ($loggedInUser->role == 'client')
            $clientId = $loggedInUser->id;
        else
            throw new HttpResponseException($this->apiResponse(null, false, __('validation.not_authorized')));
        $client = Client::where('id', $clientId)->with('clientLocation')->get();

        return $client;
    }

    public function create($client)
    {


        $createdUser = Client::create($client);
        return $createdUser;
    }


    public function update($newClient)
    {

        $client = $this->getById($newClient['id']);
        $client->update($newClient);
        return $client;
    }

    public function delete($id)
    {

        $client = $this->getById($id);
        try {

            $avatarPath = $client->avatar;
            $client->delete();
            $this->deleteFile($avatarPath);
        } catch (\Exception $ex) {

            throw new HttpResponseException($this->apiResponse(null, false, __('validation.cannot_delete')));
        }
    }
}
