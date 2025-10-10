<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Store extends Model
{
    use HasFactory;

    protected $primaryKey = 'user_id';

    protected $hidden = [ 'deleted_at'];
    protected $fillable = [
        
        'user_id', 'name_en', 'name_ar', 'logo_image', 'cover_image', 
        'delivery_charge', 'lat', 'long', 
        'first_phone_number', 'second_phone_number', 
        'whatsapp_number'];

    public function setLogoImageAttribute($value){
        $this->attributes['logo_image'] = $this->uploadFile($value, 'images/products', $this->attributes['logo_image'] ?? "");
    }

    public function setCoverImageAttribute($value){
        $this->attributes['cover_image'] = $this->uploadFile($value, 'images/products', $this->attributes['cover_image'] ?? "");
    }

    public function categories()
    {
        return $this->belongsToMany(Category::class, 'store_category', 'store_id', 'category_id');
    }

    public function orders()
    {
        return $this->hasMany(Order::class, 'store_id', 'id');
    }

    public function promoCodes()
    {
        return $this->hasMany(PromoCode::class, 'store_id', 'user_id');
    }


}
