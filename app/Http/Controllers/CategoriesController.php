<?php

namespace App\Http\Controllers;

use App\Http\Traits\ResponsesTrait;
use App\Http\Controllers\Controller;
use App\Http\Traits\FileUploadTrait;
use App\Http\Services\CategoriesService;
use App\Http\Requests\Category\StoreRequest;
use App\Http\Requests\Category\UpdateRequest;
use App\Http\Requests\Category\AddCategoryToStoreRequest;

class CategoriesController extends Controller
{

    use ResponsesTrait;
    use FileUploadTrait;

    private $categoriesService;
    public function __construct()
    {

        $this->categoriesService = new CategoriesService();

    }

    public function getCategoriesNotAssignedToStore()
    {

        $categories = $this->categoriesService->getCategoriesNotAssignedToStore();
        return $this->apiResponse($categories);
    }

    public function addCategoryToMyStore(AddCategoryToStoreRequest $request)
    {

        $category = $request->validated();
         $this->categoriesService->addCategoryToMyStore($category);
        return $this->apiResponse();
    }

    public function deleteCategoryFromMyStore($categoryId)
    {

         $this->categoriesService->deleteCategoryFromMyStore($categoryId);
        return $this->apiResponse();
    }

    public function get()
    {

        $categories = $this->categoriesService->get(request('store_id'));
        return $this->apiResponse($categories);
    }
    
    public function getById($id)
    {

        $category = $this->categoriesService->getById($id);
        return $this->apiResponse($category);
    }
    public function selectCategories()
    {

        $categories = $this->categoriesService->selectCategories(companyId:request('company_id'), haveSubCategories:request('have_sub_categories'), parentId:request('parent_id'));
        return $this->apiResponse($categories);
    }

    public function create(StoreRequest $request)
    {

        $category = $request->validated();
        $createdCategory = $this->categoriesService->create($category);
        return $this->apiResponse($createdCategory);
    }

    public function update(UpdateRequest $request)
    {

        $category = $request->validated();
        $updatedCategory = $this->categoriesService->update($category);
        return $this->apiResponse($updatedCategory);
    }

    public function delete($id)
    {

        $this->categoriesService->delete($id);
        return $this->apiResponse(null, true, __('deleted'));
    }

}


