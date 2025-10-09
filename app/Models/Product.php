<?php

namespace App\Models;

use App\Models\Company;
use App\Models\Category;
use App\Http\Traits\ImagesTrait;
use App\Http\Traits\FileUploadTrait;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;

class Product extends Model
{
    use HasFactory, SoftDeletes;
    use FileUploadTrait;
    use ImagesTrait;
    
    protected $fillable = [
        'category_id', 'store_id', 'name_en', 'name_ar', 'image', 'description_en', 'description_ar', 'price', 'offer_price'
    ];

    protected $hidden = ['deleted_at'];

    public function setImageAttribute($value)
    {

        $this->attributes['image'] = $this->uploadFile($value, 'images/products', $this->attributes['image'] ?? "");
    }

    public function category()
    {

        return $this->belongsTo(Category::class, 'category_id', 'id');
    }

    public function store()
    {

        return $this->belongsTo(Store::class, 'store_id', 'user_id');
    }


}
