<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class PromoCode extends Model
{

    use HasFactory;

    protected $fillable = [
       'id', 'store_id', 'code', 'expiration_datetime', 'value', 'discount_type'
    ];

    public function orders()
    {

        return $this->hasMany(Order::class, 'promo_code_id', 'id');
    }

}
