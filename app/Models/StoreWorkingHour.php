<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class StoreWorkingHour extends Model
{
    use HasFactory;

    protected $table = "store_working_hours";
    protected $fillable = [
        'id', 'store_id', 'week_day_id', 'from', 'to', 'full_day'
    ];

    public function weekDay()
    {
        return $this->belongsTo(WeekDay::class, 'week_day_id', 'id');
    }

    public function store()
    {
        return $this->belongsTo(Store::class, 'store_id', 'id');
    }

}
