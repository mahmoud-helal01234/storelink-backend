<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Notification extends Model
{

    protected $table = "notifications";
    use HasFactory;

    protected $fillable = [

        'user_id', 'title', 'body', 'image'
    ];

    public function setImageAttribute($value)
    {

        $this->attributes['image'] = $this->uploadFile($value, 'images/notifications', $this->attributes['image'] ?? "");
    }


}
