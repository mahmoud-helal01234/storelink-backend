<?php

namespace App\Http\Requests\Order;

use Carbon\Carbon;
use App\Http\Traits\ResponsesTrait;
use App\Rules\IsLocationBelongToClientRule;
use Illuminate\Foundation\Http\FormRequest;
use App\Rules\PickupTransportationPeriodRule;
use Illuminate\Contracts\Validation\Validator;
use App\Rules\PromoCodeForCompanyOrCountryRule;
use App\Http\Services\Orders\ClientOrdersService;
use App\Rules\IsProductOptionBelongToCompanyRule;
use Illuminate\Http\Exceptions\HttpResponseException;
use App\Rules\CapacityOfTransportationPeriodAssignedToDriverRule;

class CheckOutRequest extends FormRequest
{
    use ResponsesTrait;
    public function __construct()
    {}


    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {

        return [ 
                "order_id" => 'required|numeric|exists:orders,id,status,in_cart'
        ];
    }

    public function messages(): array
    {

        return [];
    }

    public function failedValidation(Validator $validator)
    {

        throw new HttpResponseException($this->apiResponse(null, false, $validator->errors()->first()));
    }

    public function failedAuthorization()
    {

        throw new HttpResponseException($this->apiResponse(null, false, "not authorized to access this"));
    }
}
