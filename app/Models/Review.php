<?php

namespace App\Models;

use App\Http\Traits\ImagesTrait;
use App\Http\Traits\FileUploadTrait;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;

class Review extends Model
{
    use HasFactory;
    use FileUploadTrait;
    use ImagesTrait;

    protected $fillable = [
        'id', 'order_id', 'rating', 'review'
    ];
    protected $hidden = ['deleted_at'];

    public function order()
    {
        return $this->belongsTo(Order::class, 'order_id', 'id');
    }
}
