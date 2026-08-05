<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use App\Models\Driver;
use App\Models\Company;
use App\Models\CountryManager;
use Laravel\Sanctum\HasApiTokens;
use App\Http\Traits\ResponsesTrait;
use Illuminate\Support\Facades\Hash;
use Tymon\JWTAuth\Contracts\JWTSubject;
use Illuminate\Notifications\Notifiable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable implements JWTSubject
{
    use HasApiTokens, HasFactory, Notifiable;
    use ResponsesTrait;
    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [

        'id',
        'email',
        'password',
        'role',
        'active',
        'is_verified',
        'is_profile_completed',
        'one_signal_device_id',
        'is_social'
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token'
    ];

   

    public function getJWTIdentifier()
    {
        return $this->getKey();
    }

    /**
     * Return a key value array, containing any custom claims to be added to the JWT.
     *
     * @return array
     */
    public function getJWTCustomClaims()
    {
        return [];
    }

    public function setPasswordAttribute($value)
    {
        if (!is_null($value))
            $this->attributes['password'] = Hash::make($value);
    }

    public function deviceTokens()
    {

        return $this->hasMany(UserDeviceToken::class, "user_id", 'id');
    }

    public function store()
    {

        return $this->hasOne(Store::class, "user_id", "id");
    }

    public function client()
    {

        return $this->hasOne(Client::class, "user_id", "id");
    }

    public static function boot()
    {
        parent::boot();

        static::deleting(function ($data) {

            $data->id;
            // invalidate tokens for user id
        });
    }
}
