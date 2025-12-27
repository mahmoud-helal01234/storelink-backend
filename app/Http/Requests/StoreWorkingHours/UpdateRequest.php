<?php

namespace App\Http\Requests\StoreWorkingHours;

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
            '*.week_day_id' => 'required|exists:week_days,id',
            '*.from' => 'date_format:H:i|sometimes|nullable',
            '*.to' => 'date_format:H:i|after:*.from|sometimes|nullable',
            '*.full_day' => 'boolean',
        ];
    }

    public function messages(): array
    {

        return [
           
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
