<?php

namespace App\Http\Requests\FAQs;

use App\Http\Traits\ResponsesTrait;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;

class UpdateRequest extends FormRequest
{

    use ResponsesTrait;

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
            'id'                        => 'required|numeric|exists:faqs,id',
            'question_en'               => 'required|string|max:250',
            'question_ar'               => 'required|string|max:250',
            'answer_en'                 => 'required|string|max:500',
            'answer_ar'                 => 'required|string|max:500'
        ];
    }

    public function messages(): array
    {

        return [
            'id.required'           => __('validation.id.required'),
            'id.numeric'            => __('validation.id.numeric'),
            'id.exists'             => __('validation.id.exists'),
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

        throw new HttpResponseException($this->apiResponse(null, false, $validator->errors()->first()));
    }

    public function failedAuthorization()
    {

        throw new HttpResponseException($this->apiResponse(data: null, status: false, message: __('auth.authorization.not_authorized')));
    }
}
