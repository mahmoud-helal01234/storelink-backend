<?php

namespace App\Models;

use App\Models\Product;
use App\Http\Traits\FileUploadTrait;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class ProductImage extends Model
{

    use HasFactory;
    use FileUploadTrait;

    protected $fillable = [
        'id', 'product_id', 'image',
    ];
    public $timestamps = false;
    public function setImageAttribute($value)
    {

        $this->attributes['image'] = 
        $this->uploadFile($value, 'images/products', $this->attributes['image'] ?? "");
    }

    public function product()
    {
        return $this->belongsTo(Product::class, 'product_id', 'id');
    }

}
