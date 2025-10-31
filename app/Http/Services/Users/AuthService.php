<?php

namespace App\Http\Services\Users;

use App\Models\User;
use App\Mail\OTPMail;
use App\Models\Client;
use Illuminate\Support\Str;
use App\Models\UserPasswordReset;
use Tymon\JWTAuth\Facades\JWTAuth;
use App\Http\Traits\ResponsesTrait;
use App\Models\ClientPasswordReset;
use App\Http\Traits\ArraySliceTrait;
use App\Http\Traits\FileUploadTrait;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use App\Mail\ResetPasswordTokenEmail;
use App\Http\Traits\LoggedInUserTrait;
use App\Models\DriversApp\UserDeviceToken;
use App\Http\Resources\Auth\ClientLoginResource;
use App\Models\ConfirmationCode;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Support\Facades\DB;

class AuthService
{

    use ResponsesTrait;
    use FileUploadTrait;
    use ArraySliceTrait;
    use LoggedInUserTrait;
    public function me()
    {

        $user = $this->getLoggedInUser();
        if( $this->isLoggedInUserStore()){
            $user->store;
        } elseif($this->isLoggedInUserClient()){
            $user->client;
        }
        return $user;
    }

    public function resetPassword($request)
    {

        $userId = $this->getLoggedInUser()->id;
        $user = User::find($userId);
        $user->password = $request['password']; 
        $user->save();
        return;
    }

    public function verifyOTP($request){
        DB::beginTransaction();
        $email = $request['email'];
        $otp = $request['otp'];
        $ConfirmationCode = ConfirmationCode::where(['email' => $email, 'code' => $otp, 'active' => 1])->get()->first();
        if($ConfirmationCode == null){
            throw new HttpResponseException($this->apiResponse(null, false, __('invalid otp')));
        }
        if($ConfirmationCode->created_at->addMinutes(5)->isPast()){
            throw new HttpResponseException($this->apiResponse(null, false, __('otp expired')));
        }   

        $ConfirmationCode->active = 0;
        $ConfirmationCode->save();
        $user = User::where('email', $email)->first();
        $user->is_verified = 1;
        $user->save();
        if($user == null){
            throw new HttpResponseException($this->apiResponse(null, false, __('user not found')));
        }
        $token = JWTAuth::fromUser($user);
        $user['token'] = $token;
        DB::commit();
    
        return $user;
            
    }

    public function sendOTP($email){
        $otp = rand(100000, 999999);
        ConfirmationCode::updateOrCreate(
            ['email' => $email],
            ['code' => $otp,'active' => 1, 'created_at' => now()]
        );
        
        // Mail::to($email)
        //     ->send(new OTPMail($otp));
        return $otp; // for testing purposes only
    }

    public function forgetPassword($request){
        
        if(User::where('email', $request['email'])->first() == null){
            throw new HttpResponseException($this->apiResponse(null, false, __('user not found')));
        }
        
        return $this->sendOTP($request['email']);
            
    }

    public function socialLogin() {}

    public function clientLogin($user)
    {

        // Config::set('jwt.user', 'App\Models\Client');
        // Config::set('auth.providers.users.model', \App\Models\Client::class);

        $credentials = $this->array_slice_assoc($user, ['email', 'password']);

        $token = Auth::guard('authenticate-clients')->attempt($credentials);

        if (!$token) {

            throw new HttpResponseException($this->apiResponse(null, false, __('validation.failed.failed')));
        }
        $user = Auth::guard('authenticate-clients')->user();
        $user['token'] = $token;
        return $user;
        //return ClientLoginResource::make($user);
    }

    public function clientRegister($client)
    {

        // Config::set('jwt.user', 'App\Models\User');
        // Config::set('auth.providers.users.model', \App\Models\User::class);

        $password = $client['password'];
        $createdClient = Client::create($client);

        $credentials =  ['email' => $client['email'], 'password' => $password];
        // $token = Auth::guard('authenticate-clients')->attempt($credentials);
        $token = JWTAuth::fromUser($createdClient);
        // $token = Auth::guard('authenticate-clients')->attempt($credentials);
        $createdClient['token'] = $token;

        return ClientLoginResource::make($createdClient);
    }

    public function sendPasswordResetTokenUsers($email)
    {

        $user = User::where('email', $email)->first();
        if ($user != null) {
            UserPasswordReset::where(["user_id" => $user->id])->delete();
            $token = Str::random(5);
            UserPasswordReset::create(["user_id" => $user->id, "token" => $token]);
            Mail::to($email)->send(new ResetPasswordTokenEmail($token));
        }
    }

    public function sendPasswordResetTokenClients($email)
    {

        $client = Client::where('email', $email)->first();
        if ($client != null) {
            ClientPasswordReset::where(["client_id" => $client->id])->delete();
            $token = Str::random(5);
            ClientPasswordReset::create(["client_id" => $client->id, "token" => $token]);
            Mail::to($email)->send(new ResetPasswordTokenEmail($token));
        }
    }

    public function resetPasswordClients($data)
    {

        $email = $data['email'];
        $clientPasswordReset = ClientPasswordReset::where(["token" => $data['token']])->whereHas('client', function ($q) use ($email) {
            $q->where('email', $email);
        })->first();

        if ($clientPasswordReset == null)
            throw new HttpResponseException($this->apiResponse(null, false, __("auth.failed")));
        Client::where('id', $clientPasswordReset->client_id)->update(['password' => Hash::make($data['password'])]);
        $clientPasswordReset->delete();
    }

    public function login($user)
    {

        // Config::set('jwt.user', 'App\Models\User');
        // Config::set('auth.providers.users.model', \App\Models\User::class);
        $credentials = $this->array_slice_assoc($user, ['email', 'password']);

        $token = Auth::guard('authenticate')->attempt($credentials);

        if (!$token) {

            throw new HttpResponseException($this->apiResponse(null, false, __('wrong email or password')));
        }

        $authUser = Auth::guard('authenticate')->user();
        if (isset($user['device_token']) &&  $user['device_token'] != null) {
            UserDeviceToken::create([

                'user_id' => $authUser->id,
                'device_token' => $user['device_token'],
            ]);
        }
        $authUser['token'] = $token;
        return $authUser;
    }
}
