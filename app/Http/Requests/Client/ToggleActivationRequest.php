<?php

namespace App\Http\Requests\Client;

use App\Http\Traits\ResponsesTrait;
use App\Http\Traits\LoggedInUserTrait;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;

class ToggleActivationRequest extends FormRequest
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

        return [

            'user_id'            => 'required|numeric|exists:users,id',
            'status'          => 'required|in:0,1'
        ];
    }

    public function messages(): array
    {

        return [

            'user_id.required' => __('validation.user_id.required'),
            'user_id.numeric' => __('validation.user_id.numeric'),
            'status.required' => __('validation.status.required'),
            'status.in' => __('validation.status.in'),
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
