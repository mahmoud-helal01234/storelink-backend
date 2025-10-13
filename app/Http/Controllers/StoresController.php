<?php

namespace App\Http\Controllers;

use App\Http\Traits\ResponsesTrait;
use App\Http\Controllers\Controller;
use App\Http\Services\StoresService;
use App\Http\Traits\FileUploadTrait;
use App\Http\Requests\Auth\LoginRequest;
use App\Http\Requests\Client\StoreRegisterRequest;
use App\Http\Requests\Store\UpdateStoreProfileRequest;

class StoresController extends Controller
{

    use ResponsesTrait;
    use FileUploadTrait;

    private $storesService;
    public function __construct()
    {

        $this->storesService = new StoresService();
    }

    public function me()
    {

        $client = $this->storesService->me();
        return $this->apiResponse($client);
    }
    
    public function updateProfile(UpdateStoreProfileRequest $request)
    {

        $store = $request->validated();
        $this->storesService->updateProfile($store);

        return $this->apiResponse(status: true,message: __('success.updated'));
    }
    

    public function login(LoginRequest $request)
    {

        $user = $request->validated();
        $LoggedInUser = $this->storesService->login($user);
        return $this->apiResponse($LoggedInUser,true,__('success.login'));
    }
    
    public function register(StoreRegisterRequest $request)
    {

        $user = $request->validated();
        $CreatedUser = $this->storesService->register($user);

        return $this->apiResponse($CreatedUser, true, __('success.login'));
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


