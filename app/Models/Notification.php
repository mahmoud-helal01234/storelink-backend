<?php

namespace App\Models;

use App\Models\User;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Notification extends BaseModel
{
    use HasFactory;

    protected $fillable = [
        'id', 'user_id', 'title_ar', 'title_en', 'body_ar', 'body_en', 'created_at'
    ];

    public function user()
    {

        return $this->belongsTo(User::class, 'user_id', 'id');
    }

}
