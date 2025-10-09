<?php

namespace App\Http\Requests\Product;

use App\Http\Traits\ResponsesTrait;
use App\Http\Services\ProductsService;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;
use App\Http\Constants\FormRequestRulesConstant;
use Illuminate\Http\Exceptions\HttpResponseException;

class UpdateRequest extends FormRequest
{

    use ResponsesTrait;
    
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    //private $loggedInUser;
    private $productsService;

    public function __construct()
    {

        //$this->loggedInUser = $this->getLoggedInUser();
        $this->productsService = new ProductsService();
    }
    public function authorize()
    {
        $product = $this->productsService->getById(request('id'));
        return $this->productsService->canUserUpdate($product);
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, mixed>
     */
    public function rules()
    {

        return [

            'id'            => 'required|numeric',
            'name'          =>  'required|string|max:100',
            'description'   =>  'required|string|max:200',
            'category_id'   =>  "sometimes|numeric|exists:categories,id",
            'image'         =>  'sometimes|nullable|' . FormRequestRulesConstant::ImageValidation,
            'price'         =>  'required|numeric|min:0',
            'offer_price'   =>  'sometimes|nullable|numeric|min:0'
        ];
    }

    public function messages(): array
    {

        return [];
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
