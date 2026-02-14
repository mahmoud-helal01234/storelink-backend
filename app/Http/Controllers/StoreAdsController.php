<?php

namespace App\Http\Controllers;

use App\Http\Traits\ResponsesTrait;
use App\Http\Controllers\Controller;
use App\Http\Traits\FileUploadTrait;
use App\Http\Requests\StoreAd\StoreRequest;
use App\Http\Requests\StoreAd\UpdateRequest;
use App\Http\Services\StoresAdsService;

class StoreAdsController extends Controller
{

    use ResponsesTrait;
    use FileUploadTrait;
    private $storesAdsService;

    public function __construct()
    {

        $this->storesAdsService = new StoresAdsService();
    }

    public function get()
    {

        $storesAds = $this->storesAdsService->get();
        return $this->apiResponse($storesAds);
    }

    public function create(StoreRequest $request)
    {

        $data = $request->validated();

        $createdStoreAd = $this->storesAdsService->create($data);
        return $this->apiResponse($createdStoreAd);
    }


    public function update(UpdateRequest $request)
    {

        $storeAd = $request->validated();
        $updatedStoreAd = $this->storesAdsService->update($storeAd);
        return $this->apiResponse($updatedStoreAd);
    }

    public function delete($id)
    {

        $this->storesAdsService->delete($id);
        return $this->apiResponse(null, true, __('deleted'));
    }

    public function toggleActivation($id,$activationStatus)
    {

        $toggledStoreAd = $this->storesAdsService->toggleActivation($id,$activationStatus);
        return $this->apiResponse($toggledStoreAd);
    }

}
