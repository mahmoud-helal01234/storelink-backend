<?php

namespace App\Http\Services;

use App\Http\Resources\Auth\ClientLoginResource;
use App\Http\Services\Users\AuthService;
use App\Http\Traits\ArraySliceTrait;
use App\Http\Traits\FileUploadTrait;
use App\Http\Traits\LoggedInUserTrait;
use App\Models\Client;
use App\Models\Order;
use App\Models\Review;
use App\Models\User;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Mail;
use Laravel\Socialite\Facades\Socialite;
use Tymon\JWTAuth\Facades\JWTAuth;


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
            $otp = $authService->sendOTP($authUser->email);
            throw new HttpResponseException($this->apiResponse(["is_verified" => 0,"otp" => $otp], false, __('account not verified')));
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
        Client::create($client);


        DB::commit();

        return;
        // return ClientLoginResource::make($user);
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
        $newClient = $this->array_slice_assoc($request, ['address', 'lat', 'long', 'phone','name']);
        
        $client->update($newClient);
        
        $newUser = $this->array_slice_assoc($request, ['name', 'email']);
        $newUser['is_profile_completed'] = 1;
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
            $this->deleteRelatedData($id);
        } catch (\Exception $ex) {

            throw new HttpResponseException($this->apiResponse(null, false, __('validation.cannot_delete')));
        }
    }
    private function deleteRelatedData($clientId)
    {
        // delete related data such as orders, reviews, etc.
        Order::where('client_id', $clientId)->delete();
        Review::where('client_id', $clientId)->delete();
        
    }

    public function socialLogin($data)
    {

        $providerUser = Socialite::driver($data['provider'])->stateless()->userFromToken($data['access_token']);
        $email = $providerUser->getEmail();
        $name = $providerUser->getName();
        
        // $email = "client@gmail.com";
        // $name = "client name";
        
        // if email not found then register them in the system with complete_data = false
        $user = User::where('email', $email)->first();
        if($user == null){
         
            DB::beginTransaction();
            // 1- create user
            $user = ["email" => $email, 'name' => $name];
            $user['role'] = 'client';
            $user['active'] = 1;
            $user['is_verified'] = 1;

            $user['is_profile_completed'] = 0;

            $user = User::create($user);

            // 2- create client with user_id
            $client = ['name' => $name,'user_id' => $user->id];
            Client::create($client);

            DB::commit();
            $token = Auth::guard('authenticate')->login($user);
            $user->token = $token;
            return $user;
        }else if($user->is_profile_completed == false){
            $token = Auth::guard('authenticate')->login($user);
            $user->token = $token;
            return $user;

        }else{
            // login the user
            $token = Auth::guard('authenticate')->login($user);
            $user->token = $token;
            return $user;
        }
    }
}
