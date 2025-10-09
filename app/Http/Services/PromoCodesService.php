<?php

namespace App\Http\Services;

use App\Http\Services\Users\CompaniesService;
use App\Models\PromoCode;
use Illuminate\Support\Facades\DB;
use App\Http\Traits\ResponsesTrait;
use App\Http\Traits\LoggedInUserTrait;
use Illuminate\Http\Exceptions\HttpResponseException;
use Carbon\Carbon;

class PromoCodesService
{

    use ResponsesTrait;
    use LoggedInUserTrait;

    // store only access
    public function get()
    {


        $storeId = $this->getLoggedInUserStoreId();
        
        $data = PromoCode::where('store_id', $storeId)->orderBy('created_at', 'DESC')->get();

        return $data;
    }


    public function getByCode($code)
    {

        $promoCode = PromoCode::where('code', $code)->get()->first();

        if ($promoCode == null)
            throw new HttpResponseException($this->apiResponse(null, false, __('validation.not_exist'),statusCode: 404));

        return $promoCode;
    }
    public function isPromoCodeExpired($promoCode)
    {

        if (Carbon::parse($promoCode->expiration_datetime)->lt(now()))
            throw new HttpResponseException($this->apiResponse(null, false, __('validation.expired'),statusCode: 404));
        return true;
    }

    public function validatePromoCode($code)
    {

        $promoCode = $this->getByCode($code);
        $this->isPromoCodeExpired($promoCode);
        if (!$promoCode->active)
            throw new HttpResponseException($this->apiResponse(null, false, __('validation.inactive'),statusCode: 404));
        return $promoCode;
    }

    public function getById($id)
    {

        $promoCode = PromoCode::find($id);

        if ($promoCode == null)
            throw new HttpResponseException($this->apiResponse(null, false, __('validation.not_exist'),statusCode: 404));
        return $promoCode;
    }
    public function create($promoCode)
    {

            $promoCode['store_id'] = $this->getLoggedInUserStoreId();

            $createdPromoCode = PromoCode::create($promoCode);
            return $createdPromoCode;
        try {
        } catch (\Exception $ex) {

            throw new HttpResponseException($this->apiResponse(status: false));;
        }
    }

    public function canAccessPromoCode($promoCode)
    {

        if ($promoCode->store_id != $this->getLoggedInUserStoreId())
            throw new HttpResponseException($this->apiResponse(null, false, __('auth.authorization.not_authorized'),statusCode: 403));
    }
    public function update($newPromoCode)
    {

        $promoCode = $this->getById($newPromoCode['id']);
        $this->canAccessPromoCode($promoCode);
        $promoCode['store_id'] = $this->getLoggedInUserStoreId();

        try {

            $promoCode->update($newPromoCode);
            
            return $promoCode;
        } catch (\Exception $ex) {

            throw new HttpResponseException($this->apiResponse(status: false));
        }
    }

    
    public function delete($id)
    {


        $promoCode = $this->getById($id);
        $this->canAccessPromoCode($promoCode);

        try {

            $promoCode->delete();
        } catch (\Exception $ex) {

            throw new HttpResponseException($this->apiResponse(null, false, __('validation.cannot_delete')));
        }
    }

    public function toggleActivation($id, $activationStatus)
    {

        $promoCode = $this->getById($id);
        try {

            $promoCode->update(['active' => $activationStatus]);
        } catch (\Exception $ex) {

            throw new HttpResponseException($this->apiResponse(status: false));;
        }
    }
}
