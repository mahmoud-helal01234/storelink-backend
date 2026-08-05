<?php

namespace App\Http\Requests\Auth;

use App\Http\Traits\ResponsesTrait;
use App\Models\User;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;

class LoginRequest extends FormRequest
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

            'email' => [
                'required',
                'string',
                'email',
                function ($attribute, $value, $fail) {
                    $user = User::where('email', $value)->first();

                    if (! $user) {
                        $fail(__('validation.email.exists'));
                        return;
                    }

                    if (! $user->active) {
                        $fail(__('auth.email_not_active'));
                    }
                },
            ],
            'password' => 'required|string',
            'device_token' => 'sometimes|string',
        ];
    }

    public function messages(): array
    {
        return [
            'email.required' => __('validation.email.required'),
            'password.required' => __('validation.password.required'),
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
