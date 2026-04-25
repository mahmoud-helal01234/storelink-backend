<?php

namespace App\Http\Requests\LandingPageContent;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;
use App\Http\Traits\ResponsesTrait;

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
          
            'about_us_content_ar'          =>  'required|string|max:5000',
            'about_us_content_en'          =>  'required|string|max:5000',
            'description_ar'               =>  'required|string|max:5000',
            'description_en'               =>  'required|string|max:5000'
        ];

    }

    public function messages(): array
    {

        return [
            'about_us_content_ar.required'     => __('validation.about_us_content_ar.required'),
            'about_us_content_ar.string'       => __('validation.about_us_content_ar.string'),
            'about_us_content_ar.max'          => __('validation.about_us_content_ar.max'),
            'about_us_content_en.required'     => __('validation.about_us_content_en.required'),
            'about_us_content_en.string'       => __('validation.about_us_content_en.string'),
            'about_us_content_en.max'          => __('validation.about_us_content_en.max')
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
