<?php

namespace App\Http\Services;

use App\Models\Product;
use App\Http\Traits\ResponsesTrait;
use App\Models\CompaniesCategories;
use App\Http\Traits\FileUploadTrait;
use App\Http\Traits\LoggedInUserTrait;
use App\Http\Services\Products\ProductOptionsService;
use Illuminate\Http\Exceptions\HttpResponseException;

class ProductsService
{

    use ResponsesTrait;
    use FileUploadTrait;
    use LoggedInUserTrait;

    // for store access only
    public function get($categoryId)
    {

        $storeId = $this->getLoggedInUserStoreId();

        $products = Product::where('category_id', $categoryId)->when($storeId, function ($q) use ($storeId) {
            $q->where('store_id', $storeId);
        })->get();

        return $products;
    }

    public function getById($id)
    {

        $product = Product::where('id', $id)->first();

        if ($product == null)
            throw new HttpResponseException($this->apiResponse(null, false, __('validation.not_exist')));

        return $product;
    }

    public function create($product)
    {

        $product['store_id'] = $this->getLoggedInUserStoreId();
        $createdProduct = Product::create($product);
        return $createdProduct;
        try {
        } catch (\Exception $ex) {

            throw new HttpResponseException($this->apiResponse(status: false));;
        }
    }

    public function canAccessProduct($product)
    {
        
        if ($product->store_id != $this->getLoggedInUserStoreId())
            throw new HttpResponseException($this->apiResponse(null, false, __('auth.authorization.not_authorized'), statusCode: 403));
    }
    public function update($newProduct)
    {

        $product = $this->getById($newProduct['id']);
        $this->canUserUpdate($product);
        $product['store_id'] = $this->getLoggedInUserStoreId();

        try {

            $product->update($newProduct);

            return $product;
        } catch (\Exception $ex) {

            throw new HttpResponseException($this->apiResponse(status: false));
        }
    }


    public function delete($id)
    {


        $product = $this->getById($id);
        $this->canAccessProduct($product);

        try {

            $product->delete();
        } catch (\Exception $ex) {

            throw new HttpResponseException($this->apiResponse(null, false, __('validation.cannot_delete')));
        }
    }

    public function canUserUpdate($product)
    {

        if ($product->store_id != $this->getLoggedInUserStoreId())
            throw new HttpResponseException($this->apiResponse(null, false, __('auth.authorization.not_authorized'),statusCode: 403));
        return true;
    }
    

    public function deleteWithRelations($id)
    {
        $product = $this->getById($id);

        $productOptionsService = new ProductOptionsService();
        $productOptionsService->delete(productId: $id);
        $product->delete();
    }
    public function deleteChildren($categoryId = null)
    {
        $categoryProudcts = Product::where('category_id', $categoryId)->get();
        $productOptionsService = new ProductOptionsService();

        foreach ($categoryProudcts as $categoryProudct) {
            $productOptionsService->delete(productId: $categoryProudct->id);
            $categoryProudct->delete();
        }
    }
}
