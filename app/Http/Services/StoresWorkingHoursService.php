<?php

namespace App\Http\Services;

use App\Models\WeekDay;
use App\Models\StoreWorkingHour;
use App\Http\Traits\ResponsesTrait;
use App\Http\Traits\LoggedInUserTrait;
use Illuminate\Http\Exceptions\HttpResponseException;

class StoresWorkingHoursService
{

    use ResponsesTrait;
    use LoggedInUserTrait;

    public function get($storeId)
    {

        $storeWorkingHours = WeekDay::leftJoin('store_working_hours', function ($join) use ($storeId) {
            $join->on('week_days.id', '=', 'store_working_hours.week_day_id')
                ->where('store_working_hours.store_id', $storeId);
        })
            ->orderBy('week_days.id')
            ->select(
                'week_days.*',
                'store_working_hours.from',
                'store_working_hours.to',
                'store_working_hours.full_day'
            )
            ->get();

        return $storeWorkingHours;
    }

    // this function updates the working hours of the logged-in user's store only
    public function updateMyWorkingHours($storeWorkingHoursList)
    {

        $storeId = $this->getLoggedInUserStoreId();


        // delete existing working hours
        StoreWorkingHour::where('store_id', $storeId)->delete();

        // create new working hours
        foreach ($storeWorkingHoursList as $storeWorkingHours) {
            $storeWorkingHours['store_id'] = $storeId;
            StoreWorkingHour::create($storeWorkingHours);
        }
        try {
        } catch (\Exception $ex) {

            throw new HttpResponseException($this->apiResponse(status: false));
        }
    }
}
