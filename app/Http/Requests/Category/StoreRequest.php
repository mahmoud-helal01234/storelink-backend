<?php

namespace App\Http\Requests\Category;

use App\Http\Traits\ResponsesTrait;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;
use App\Http\Constants\FormRequestRulesConstant;
use Illuminate\Http\Exceptions\HttpResponseException;

class StoreRequest extends FormRequest
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
            'name_en'               =>  'required|string',
            'name_ar'               =>  'required|string',
            'description_en'        =>  'required|string',
            'description_ar'        =>  'required|string',
            'image'              =>  'required|' . FormRequestRulesConstant::ImageValidation
        ];
    }
    public function messages(): array
    {

        return [
            'name.required'          => __('validation.name.required'),
            'image.required'         => __('validation.image.required')
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
