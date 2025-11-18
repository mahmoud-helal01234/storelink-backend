<?php

namespace App\Http\Requests\News;

use App\Http\Traits\ResponsesTrait;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;

class StoreRequest extends FormRequest
{
    use ResponsesTrait;

    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    private $citiesService;
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
            'text_ar'               => 'required|string|max:250',
            'text_en'               => 'required|string|max:250'
        ];
    }

    public function messages(): array {

        return [
            'text_ar.required'      => __('validation.text_ar.required'),
            'text_ar.string'        => __('validation.text_ar.string'),
            'text_ar.max'           => __('validation.text_ar.max'),
            'text_en.required'      => __('validation.text_en.required'),
            'text_en.string'        => __('validation.text_en.string'),
            'text_en.max'           => __('validation.text_en.max')
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



