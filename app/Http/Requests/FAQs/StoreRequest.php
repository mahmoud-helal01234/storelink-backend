<?php

namespace App\Http\Requests\FAQs;

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
            'question_en'               => 'required|string|max:20000',
            'question_ar'               => 'required|string|max:20000',
            'answer_en'                 => 'required|string|max:20000',
            'answer_ar'                 => 'required|string|max:20000'
        ];
    }

    public function messages(): array {

        return [
            'question_en.required'      => __('validation.question_en.required'),
            'question_en.string'        => __('validation.question_en.string'),
            'question_en.max'           => __('validation.question_en.max'),
            'question_ar.required'      => __('validation.question_ar.required'),
            'question_ar.string'        => __('validation.question_ar.string'),
            'question_ar.max'           => __('validation.question_ar.max'),
            'answer_en.required'        => __('validation.answer_en.required'),
            'answer_en.string'          => __('validation.answer_en.string'),
            'answer_en.max'             => __('validation.answer_en.max'),
            'answer_ar.required'        => __('validation.answer_ar.required'),
            'answer_ar.string'          => __('validation.answer_ar.string'),
            'answer_ar.max'             => __('validation.answer_ar.max')
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



