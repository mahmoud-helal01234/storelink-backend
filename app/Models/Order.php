<?php

namespace App\Models;

use App\Models\PromoCode;
use App\Http\Traits\ImagesTrait;
use App\Http\Traits\FileUploadTrait;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Order extends Model
{
    use HasFactory;
    use FileUploadTrait;
    use ImagesTrait;

    protected $fillable = [

        'id',
        'status',
        'client_id',
        'lat',
        'long',
        'store_id',
        'promo_code_id',
        'price',
        'promo_code_discount',
        'delivery_charge',
        'total_price'
    ];

    public function items()
    {

        return $this->hasMany(OrderItem::class, 'order_id', 'id');
    }

    public function client()
    {

        return $this->hasOne(Client::class, 'user_id', 'client_id');
    }

    public function promoCode()
    {

        return $this->belongsTo(PromoCode::class, 'promo_code_id', 'id');
    }
    
    public function store()
    {

        return $this->belongsTo(Store::class, 'store_id', 'user_id');
    }

    public function review()
    {

        return $this->hasOne(Review::class, 'order_id', 'id');
    }

}
