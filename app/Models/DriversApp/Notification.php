<?php

namespace App\Models\DriversApp;

use App\Models\Order;
use App\Models\User;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Notification extends Model
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
