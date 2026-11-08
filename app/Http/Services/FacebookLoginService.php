<?php

namespace App\Http\Services;

use App\Http\Traits\ResponsesTrait;
use App\Models\Client;
use App\Models\Store;
use App\Models\User;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class FacebookLoginService
{
    use ResponsesTrait;

    public function login($providerUser, string $role)
    {
        // Identity must come from Socialite's token response, never the request body.
        $facebookId = $providerUser->getId();
        if ((!is_string($facebookId) && !is_int($facebookId)) || trim((string) $facebookId) === '') {
            throw new HttpResponseException($this->apiResponse(null, false, __('auth.failed'), 422));
        }
        $email = $providerUser->getEmail();
        $email = is_string($email) && trim($email) !== '' ? trim($email) : null;

        $user = DB::transaction(function () use ($providerUser, $role, $facebookId, $email) {
            $user = User::where('facebook_id', (string) $facebookId)->lockForUpdate()->first();
            // Preserve existing email-based accounts on their first Facebook login.
            if (!$user && $email !== null) {
                $user = User::where('email', $email)->lockForUpdate()->first();
                if ($user && $user->facebook_id !== null && $user->facebook_id !== (string) $facebookId) {
                    throw new HttpResponseException($this->apiResponse(null, false, __('auth.failed'), 422));
                }
            }
            if ($user && $user->role !== $role) {
                $message = $role === 'client' ? 'auth.email_registered_as_store' : 'auth.email_registered_as_client';
                throw new HttpResponseException($this->apiResponse(null, false, __($message)));
            }
            if (!$user) {
                $user = User::create([
                    'email' => $email,
                    'facebook_id' => (string) $facebookId,
                    'role' => $role,
                    'active' => $role === 'client' ? 1 : 0,
                    'is_verified' => 1,
                    'is_social' => 1,
                    'is_profile_completed' => 0,
                ]);
                if ($role === 'client') {
                    Client::create(['name' => $providerUser->getName() ?: 'User', 'user_id' => $user->id]);
                } else {
                    Store::create(['user_id' => $user->id]);
                }
            } elseif ($user->facebook_id === null) {
                $user->facebook_id = (string) $facebookId;
                $user->save();
            }
            return $user;
        });

        $user->token = Auth::guard('authenticate')->login($user);
        return $user;
    }
}
