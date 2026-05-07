<?php

namespace App\Models;

use Carbon\Carbon;
use DateTimeInterface;
use Illuminate\Database\Eloquent\Model;

class BaseModel extends Model
{
    protected function serializeDate(DateTimeInterface $date): string
    {
            return Carbon::instance($date)
            ->setTimezone(config('app.timezone'))
            ->format('Y-m-d H:i:s');
    }
}