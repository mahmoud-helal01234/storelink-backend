<?php

namespace App\Models;

use App\Http\Traits\ImagesTrait;
use App\Http\Traits\FileUploadTrait;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;

class WeekDay extends Model
{
    use HasFactory;


    protected $fillable = [

        'id', 'name_en', 'name_ar'
    ];
    
}
