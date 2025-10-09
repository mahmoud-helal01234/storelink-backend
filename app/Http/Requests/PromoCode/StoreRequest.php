<?php

namespace App\Http\Requests\PromoCode;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;
use App\Http\Traits\ResponsesTrait;

class StoreRequest extends FormRequest
{
    use ResponsesTrait;

    // protected $stopOnFirstFailure = true;

    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {

        // authorize user
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

            'code'          =>  'required|string|max:20|unique:promo_codes,code',
            'value'         =>  'required|numeric',
            'discount_type'	=>  'required|in:percentage,constant',
            'expiration_datetime' => 'required|date_format:Y-m-d H:i:s'

        ];
    }

    public function messages(): array {

        return [
            'code.required'             =>  __('validation.code.required'),
            'value.required'            =>  __('validation.value.required'),
            'value_type.required'       =>  __('validation.value_type.required'),
            'expiration_datetime.required'             =>  __('validation.expiration_datetime.required'),
            'to.required'               =>  __('validation.to.required'),
            'active.in'                 =>  __('validation.active.in'),
            'companies_ids.*'           =>  __('validation.id.required'),
            'countries_ids.*'           =>  __('validation.id.required'),
            'products_ids.*'           =>  __('validation.id.required'),
            'companies_ids.*.exists'    =>  __('validation.id.exists'),
            'countries_ids.*.exists'    =>  __('validation.id.exists'),
            'products_ids.*.exists'     =>  __('validation.id.exists'),
        ];
    }

    public function failedValidation(Validator $validator)
    {

        throw new HttpResponseException($this->apiResponse(null, false, $validator->errors()->first()));
    }

    public function failedAuthorization()
    {

        throw new HttpResponseException($this->apiResponse(data: null, status: false, message: __('auth.authorization.not_authorized')));
    }


}



