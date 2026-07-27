<?php

namespace App\Http\Services;

use Exception;

use App\Http\Traits\ResponsesTrait;
use Illuminate\Support\Facades\Log;
use App\Http\Traits\FileUploadTrait;
use App\Http\Traits\LoggedInUserTrait;
use App\Models\StoreAd;
use Illuminate\Http\Exceptions\HttpResponseException;

class StoresAdsService
{

    use ResponsesTrait;
    use FileUploadTrait;
    use LoggedInUserTrait;

    public function get()
    {

        Log::info("start get stores ads");
        if ($this->isLoggedInUserStore()) {
            return StoreAd::where('store_id', $this->getLoggedInUserStoreId())
                ->orderBy('created_at', 'desc')
                ->get();
        } else if ($this->isLoggedInUserAdmin()) {
            return StoreAd::orderBy('created_at', 'desc')->with('store')
                ->get();
        } else {
            return StoreAd::whereHas('store', function ($q) {
                $q->where('active', true);
            })
                ->orderBy('created_at', 'desc')
                ->get();
        }
    }

    public function getById($id)
    {

        Log::info("start get store ad by id: $id");

        $storeAd = StoreAd::find($id);

        if ($storeAd == null)
            throw new HttpResponseException($this->apiResponse(null, false, __('validation.not_exist')));

        return $storeAd;
    }


    public function create($storeAd)
    {

        Log::info("start create store ad");

            if ($this->isLoggedInUserStore()) {
                $storeAd['store_id'] = $this->getLoggedInUserStoreId();
            } else {
                throw new HttpResponseException($this->apiResponse(null, false, __('validation.not_authorized')));
            }

            return StoreAd::create($storeAd);
        try {
            
        } catch (\Exception $ex) {

            throw new HttpResponseException($this->apiResponse(status: false));;
        }
    }


    public function update($newStoreAd)
    {

        Log::info("start update store ad");

        $storeAd = $this->getById($newStoreAd['id']);

        try {

            $storeAd->update($newStoreAd);
            return $storeAd;
        } catch (\Exception $ex) {

            throw new HttpResponseException($this->apiResponse(status: false));
        }
    }

    public function delete($id){

        Log::info("start delete store ad");

        $storeAd = $this->getById($id);
        if ($this->isLoggedInUserStore() && $storeAd->store_id != $this->getLoggedInUserStoreId()) {
            throw new HttpResponseException($this->apiResponse(null, false, __('validation.not_authorized')));
        }

        try {

            $storeAd->delete();
        } catch (\Exception $ex) {

            throw new HttpResponseException($this->apiResponse(null, false, __('validation.cannot_delete')));
        }
    }

    public function toggleActivation($id, $activationStatus)
    {

        $storeAd = $this->getById($id);
        try {

            $storeAd->update(['active' => $activationStatus]);
        } catch (\Exception $ex) {

            throw new HttpResponseException($this->apiResponse(null, false, __('validation.cannot_update')));
        }
    }
}
