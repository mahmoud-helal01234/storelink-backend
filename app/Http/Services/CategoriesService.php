<?php

namespace App\Http\Services;

use Exception;
use App\Models\Category;
use App\Http\Traits\ResponsesTrait;
use Illuminate\Support\Facades\Log;
use App\Http\Traits\FileUploadTrait;
use App\Http\Traits\LoggedInUserTrait;
use Illuminate\Http\Exceptions\HttpResponseException;

class CategoriesService
{

    use ResponsesTrait;
    use FileUploadTrait;
    use LoggedInUserTrait;

    private $companiesCategoriesService;
    private $proudctsService;
    
    public function getCategoriesNotAssignedToStore()
    {
        
        $storeId = $this->getLoggedInUserStoreId();
        Log::info("start get categories not assigned to store {$storeId}");
        return Category::query()
        ->whereDoesntHave('stores', function ($q) use ($storeId) {
            // either constrain by stores.id or by pivot store_id (both work)
            $q->where('stores.user_id', $storeId);
            // or: $q->where('store_category.store_id', $storeId);
        })
        ->get();
    }

    public function get($storeId = null)
    {

        Log::info("start get categories");

        $categories = Category::
        // with('')
        // ->when($storeId != null,
        // function ($query) use($storeId){
        //     return $query->where('store_id',$storeId);
        // })->
        get();
        return $categories;
    }





    public function getById($id)
    {

        Log::info("start get category by id");


        $category = Category::find($id);

        if ($category == null)
            throw new HttpResponseException($this->apiResponse(null, false, __('validation.not_exist')));
        return $category;
    }

    public function addCategoryToMyStore($category)
    {

        $storeId = $this->getLoggedInUserStoreId();
        try {

            Log::info("start add category to my store {$storeId}");
            $category = $this->getById($category['category_id']);
            $category->stores()->syncWithoutDetaching([$storeId]);


        } catch (\Exception $ex) {

            throw new HttpResponseException($this->apiResponse(status: false));;
        }
    }

    public function deleteCategoryFromMyStore($categoryId)
    {

        $storeId = $this->getLoggedInUserStoreId();
        try {

            Log::info("start delete category from my store {$storeId}");
            $category = $this->getById($categoryId);
            $category->stores()->detach($storeId);
        } catch (\Exception $ex) {
            throw new HttpResponseException($this->apiResponse(status: false));
        }
    }

    public function create($category)
    {

        try {
            Log::info("start create category");

            return Category::create($category);
        } catch (\Exception $ex) {

            throw new HttpResponseException($this->apiResponse(status: false));;
        }
    }


    public function update($newCategory)
    {

        Log::info("start update category");

        $category = $this->getById($newCategory['id']);


        try {
            $category->update($newCategory);
            return $category;
        } catch (\Exception $ex) {

            throw new HttpResponseException($this->apiResponse(status: false));;
        }
    }

    public function delete($id)
    {

        Log::info("start delete category");

        $category = $this->getById($id);

        try {

            // $this->deleteRelationsWithCategory($category->id);
            $category->delete();

        } catch (\Exception $ex) {

            throw new HttpResponseException($this->apiResponse(null, false, __('validation.cannot_delete')));
        }
    }

    public function deleteRelationsWithCategory($categoryId)
    {

        $this->proudctsService = new ProductsService;
        $this->proudctsService->deleteChildren(categoryId: $categoryId);
    }

    public function deleteChildren($mainCategoryId = null)
    {
        $categories = Category::where('main_category_id', $mainCategoryId)->get();
        

        foreach ($categories as $category) {

            $this->deleteRelationsWithCategory($category->id);
            $category->delete();
        }
    }
}
