<?php

namespace App\Http\Requests\PromoCode;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;
use App\Http\Traits\ResponsesTrait;
use App\Http\Traits\LoggedInUserTrait;
use App\Models\PromoCode;
use Illuminate\Validation\Rule;

class UpdateRequest extends FormRequest
{

    use ResponsesTrait;
    use LoggedInUserTrait;

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
     * @return array<string, mixed>
     */
    public function rules()
    {
        $storeId = $this->getLoggedInUserStoreId();
        $promoCode = PromoCode::where('store_id', $storeId)->find($this->input('id'));

        return [

            'id'            =>  'required|exists:promo_codes,id',
            'code'          =>  ['required', 'string', 'max:20', Rule::unique('promo_codes', 'code')->where('store_id', $storeId)->ignore($promoCode)],
            'value'         =>  'required|numeric',
            'discount_type'    =>  'required|in:percentage,constant',
            'expiration_datetime' => 'required|date_format:Y-m-d H:i:s'
        ];
    }

    public function messages(): array {

        return [
            'id.required'               =>  __('validation.id.required'),
            'id.exists'                 =>  __('validation.id.exists'),
            'code.required'             =>  __('validation.code.required'),
            'value.required'            =>  __('validation.value.required'),
            'value_type.required'       =>  __('validation.value_type.required'),
            'type.required'             =>  __('validation.type.required'),
            'from.required'             =>  __('validation.from.required'),
            'to.required'               =>  __('validation.to.required'),
            'active.in'                 =>  __('validation.active.in')
        ];
    }

    public function failedValidation(Validator $validator)
    {

        throw new HttpResponseException($this->apiResponse(null,false,$validator->errors()->first()));
    }

    public function failedAuthorization()
    {

        throw new HttpResponseException($this->apiResponse(data: null, status: false, message: __('auth.authorization.not_authorized')));
    }

}
