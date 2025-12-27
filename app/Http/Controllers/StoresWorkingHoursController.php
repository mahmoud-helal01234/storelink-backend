<?php

namespace App\Http\Controllers;

use App\Http\Traits\ResponsesTrait;
use App\Http\Controllers\Controller;
use App\Http\Requests\StoreWorkingHours\UpdateRequest;
use App\Http\Services\StoresWorkingHoursService;

class StoresWorkingHoursController extends Controller
{

    use ResponsesTrait;
    private $storesWorkingHoursService;

    public function __construct()
    {

        $this->storesWorkingHoursService = new StoresWorkingHoursService();
    }

    public function get($storeId)
    {

        $news = $this->storesWorkingHoursService->get($storeId);
        return $this->apiResponse($news);
    }

    public function update(UpdateRequest $request)
    {

        $storeWorkingHours = $request->validated();
        $updatedStoreWorkingHours = $this->storesWorkingHoursService->updateMyWorkingHours($storeWorkingHours);
        return $this->apiResponse($updatedStoreWorkingHours);
    }

}
