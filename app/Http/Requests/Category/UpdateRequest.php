<?php

namespace App\Http\Requests\Category;

use App\Http\Traits\ResponsesTrait;
use App\Http\Traits\LoggedInUserTrait;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;
use App\Http\Constants\FormRequestRulesConstant;
use Illuminate\Http\Exceptions\HttpResponseException;

class UpdateRequest extends FormRequest
{
    use ResponsesTrait,  LoggedInUserTrait;

    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    // private $loggedInUser;
    // private $categoriesService;

    public function __construct()
    {

        // $this->loggedInUser = $this->getLoggedInUser();
        // $this->categoriesService = new CategoriesService();
    }
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

            'id'                    =>  'required|numeric', // checked for existence inside
            'name_en'               =>  'required|string',
            'name_ar'               =>  'required|string',
            'description_en'        =>  'required|string',
            'description_ar'        =>  'required|string',
            'image'              =>  'sometimes|nullable|' . FormRequestRulesConstant::ImageValidation
        ];
    }
    public function messages(): array
    {

        return [
            'id.required'       => __('validation.id.required'),
            'name_en.required'  => __('validation.name.required')
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
