<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class News extends Model
{
    
    protected $table = "news";

    use HasFactory;
    protected $fillable = [
        'text_ar', 'text_en'
    ];
 
}
