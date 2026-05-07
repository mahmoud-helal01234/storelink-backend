<?php

namespace App\Http\Requests\StoreAd;

use App\Http\Traits\ResponsesTrait;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;
use App\Http\Constants\FormRequestRulesConstant;
use Illuminate\Http\Exceptions\HttpResponseException;

class UpdateRequest extends FormRequest
{
    use ResponsesTrait;

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
        return [

            'id'                => 'required|numeric|exists:stores_ads,id',
            'description_ar'    =>  'sometimes|nullable|string|max:150',
            'description_en'    =>  'sometimes|nullable|string|max:150',
            'image'             =>  'sometimes|'.FormRequestRulesConstant::ImageValidation
        ];
    }

    public function messages(): array {
        return [
            'id.required'               =>  __('validation.id.required'),
            'id.numeric'                =>  __('validation.id.numeric'),
            'id.exists'                 =>  __('validation.id.exists'),
            'description_ar.required'   =>  __('validation.description_ar.required'),
            'description_ar.string'     =>  __('validation.description_ar.string'),
            'description_ar.max'        =>  __('validation.description_ar.max'),
            'description_en.required'   =>  __('validation.description_en.required'),
            'description_en.string'     =>  __('validation.description_en.string'),
            'description_en.max'        =>  __('validation.description_en.max'),
            'image.required'            =>  __('validation.image.required')
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
