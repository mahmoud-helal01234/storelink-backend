<?php

namespace App\Http\Requests\TermAndCondition;

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
            'id'                                    => 'required|numeric|exists:terms_and_conditions,id',
            'title_ar'                              => 'required|string|max:500',
            'title_en'                              => 'required|string|max:500',
            'term_and_condition_items'              => 'required|array|min:1',
            'term_and_condition_items.*.id'         => 'sometimes|numeric|exists:terms_and_conditions_items,id,term_and_condition_id,' . request('id'),
            'term_and_condition_items.*.content_ar' => 'required|string|max:1000',
            'term_and_condition_items.*.content_en' => 'required|string|max:1000'
        ];
    }

    public function messages(): array
    {

        return [
            'id.required'              => __('validation.id.required'),
            'id.numeric'               => __('validation.id.numeric'),
            'id.exists'                => __('validation.id.exists'),
            'title_ar.required'        => __('validation.title_ar.required'),
            'title_ar.string'          => __('validation.title_ar.string'),
            'title_ar.max'            => __('validation.title_ar.max'),
            'title_en.required'        => __('validation.title_en.required'),
            'title_en.string'          => __('validation.title_en.string'),
            'title_en.max'            => __('validation.title_en.max'),
            'term_and_condition_items.required' => __('validation.term_and_condition_items.required'),
            'term_and_condition_items.array' => __('validation.term_and_condition_items.array'),
            'term_and_condition_items.min' => __('validation.term_and_condition_items.min'),
            'term_and_condition_items.*.content_ar.required' => __('validation.term_and_condition_items.*.content_ar.required'),
            'term_and_condition_items.*.content_ar.string' => __('validation.term_and_condition_items.*.content_ar.string'),
            'term_and_condition_items.*.content_ar.max' => __('validation.term_and_condition_items.*.content_ar.max'),
            'term_and_condition_items.*.content_en.required' => __('validation.term_and_condition_items.*.content_en.required'),
            'term_and_condition_items.*.content_en.string' => __('validation.term_and_condition_items.*.content_en.string'),
            'term_and_condition_items.*.content_en.max' => __('validation.term_and_condition_items.*.content_en.max')
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
