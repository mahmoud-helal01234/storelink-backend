<?php

namespace App\Models;

use App\Models\Company;
use App\Models\Country;
use App\Http\Traits\FileUploadTrait;
use App\Http\Traits\ImagesTrait;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;

class Category extends Model
{
    use HasFactory;
    use FileUploadTrait;
    use ImagesTrait;
    
    protected $fillable = [

        'id',
        'name_en',
        'name_ar',
        'description_en',
        'description_ar',
        'name_ar',
        'image'
    ];

    protected $hidden = ['pivot', 'deleted_at'];
    public function setImageAttribute($value)
    {
        $this->attributes['image'] = $this->uploadFile($value, 'images/categories', $this->attributes['image'] ?? "");
    }

    public function products()
    {
        return $this->hasMany(Product::class, "category_id", "id");
    }
    
    public function stores()
    {
        // pivot: store_category (category_id, store_id)
        return $this->belongsToMany(Store::class, 'store_category', 'category_id', 'store_id');
    }


}
