<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class StoreCategory extends Model
{
    use HasFactory;
    protected $fillable = ['store_id', 'category_id'];

    protected $table = 'store_category';
    public $timestamps = false;

    public function category(){

        return $this->belongsTo(Category::class,'category_id','id');
    }

    public function store(){
        
        return $this->belongsTo(Store::class,'store_id','id');
    }
}
