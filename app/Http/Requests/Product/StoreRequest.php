<?php

namespace App\Http\Requests\Product;

use Illuminate\Support\Facades\DB;
use App\Http\Traits\ResponsesTrait;
use App\Http\Traits\LoggedInUserTrait;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;
use App\Http\Constants\FormRequestRulesConstant;
use Illuminate\Http\Exceptions\HttpResponseException;

class StoreRequest extends FormRequest
{
    use ResponsesTrait, LoggedInUserTrait;

    // protected $stopOnFirstFailure = true;

    

    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {

        // authorize user
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {



        return
            [

                'name_en'          =>  'required|string|max:100',
                'name_ar'          =>  'required|string|max:100',
                'description_en'   =>  'required|string|max:500',
                'description_ar'   =>  'required|string|max:500',
                'category_id'   =>  "required|numeric|exists:categories,id",
                'image'         =>  'required|' . FormRequestRulesConstant::ImageValidation,
                'price'         =>  'required|numeric|min:0',
                'offer_price'   =>  'sometimes|nullable|numeric|min:0'
            ];
    }

    public function messages(): array
    {

        return [
            'name.required'         => __('validation.name.required'),
            'description.required'  => __('validation.description.required'),
            'category_id.required'  => __('validation.category_id.required'),
            'category_id.exists'    => __('validation.category_id.exists'),
            'image.required'        => __('validation.image.required'),

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
