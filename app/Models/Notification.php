<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;

class Notification extends BaseModel
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
