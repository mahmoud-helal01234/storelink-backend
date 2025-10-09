<?php

namespace App\Http\Controllers;

use App\Http\Traits\ResponsesTrait;
use App\Http\Traits\FileUploadTrait;
use App\Http\Services\StoresService;
use App\Http\Controllers\Controller;

class StoresController extends Controller
{

    use ResponsesTrait;
    use FileUploadTrait;

    private $storesService;
    public function __construct()
    {

        $this->storesService = new StoresService();

    }
    
    public function get()
    {

        $store = $this->storesService->get(categoryId:request('category_id'), rating:request('rating'),sortByRating:request('sort_by_rating'),distanceInMeters:request('distance_in_meters'));
        return $this->apiResponse($store);
    }

    public function getDetailsById()
    {

        $store = $this->storesService->getDetailsById(request('store_id'));
        return $this->apiResponse($store);
    }

    public function getById($id)
    {

        $store = $this->storesService->getById($id);
        return $this->apiResponse($store);
    }
    
    public function selectStores()
    {

        $stores = $this->storesService->selectStores(companyId:request('company_id'), haveSubStores:request('have_sub_stores'), parentId:request('parent_id'));
        return $this->apiResponse($stores);
    }

    public function create(StoreRequest $request)
    {

        $store = $request->validated();
        $createdStore = $this->storesService->create($store);
        return $this->apiResponse($createdStore);
    }

    public function update(UpdateRequest $request)
    {

        $store = $request->validated();
        $updatedStore = $this->storesService->update($store);
        return $this->apiResponse($updatedStore);
    }

    public function delete($id)
    {

        $this->storesService->delete($id);
        return $this->apiResponse(null, true, __('deleted'));
    }

}


