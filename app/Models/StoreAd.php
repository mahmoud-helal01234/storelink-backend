<?php

namespace App\Models;

use App\Http\Traits\FileUploadTrait;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class StoreAd extends Model
{
    use HasFactory;
    use FileUploadTrait;
    use SoftDeletes;

    protected $table = "stores_ads";

    protected $fillable = [

        'id', 'image', 'description_ar','description_en','store_id', 'created_at', 'updated_at','active'
    ];

    public function setImageAttribute($value){
        $this->attributes['image'] = $this->uploadFile($value, 'images/store_ads', $this->attributes['image'] ?? "");
    }

    public function store()
    {

        return $this->belongsTo(Store::class, 'store_id', 'user_id');
    }

}
