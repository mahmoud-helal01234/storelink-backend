<?php

namespace App\Http\Requests\Client;

use App\Http\Traits\LoggedInUserTrait;
use App\Http\Traits\ResponsesTrait;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;

class UpdateClientProfileRequest extends FormRequest
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
            'name'          => 'required|string|max:100',
            'address'       => 'required|string|max:255',
            'email'         => 'required|string|email|max:255|unique:users,email,' . $this->getLoggedInUserClientId(),
            'phone'         => 'required|string|max:255',
            'password'      => 'sometimes|nullable|string|min:6',
            'lat'           => 'required|numeric',
            'long'          => 'required|numeric'
        ];
    }

    

    public function messages(): array
    {

        return [
            'name.required' => __('validation.name.required'),
            'email.required' => __('validation.email.required'),
            'email.email' => __('validation.email.email'),
            'email.unique' => __('validation.email.unique'),
            'phone.required' => __('validation.phone.required'),
            'lat.required' => __('validation.lat.required'),
            'long.required' => __('validation.long.required'),
            'password.required' => __('validation.password.required'),
            'password.min' => __('validation.password.min'),
            'address.required' => __('validation.address.required'),
            'address.max' => __('validation.address.max'),
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