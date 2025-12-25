<?php

namespace App\Models;

use App\Http\Traits\FileUploadTrait;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
//use Illuminate\Database\Eloquent\SoftDeletes;

class LandingPageContent extends Model
{

    protected $table = "landing_page_content";
    use HasFactory;
    use FileUploadTrait;
    protected $fillable = [

        "about_us_content_ar",
        "about_us_content_en"
    ];

    public $timestamps = false;
}
