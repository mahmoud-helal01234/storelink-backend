<?php

namespace App\Http\Controllers;

use App\Http\Traits\ResponsesTrait;
use App\Http\Controllers\Controller;
use App\Http\Requests\PrivacyPolicy\StoreRequest;
use App\Http\Requests\PrivacyPolicy\UpdateRequest;
use App\Http\Services\PrivacyPoliciesService;

class PrivacyPoliciesController extends Controller
{

    use ResponsesTrait;
    private $privacyPoliciesService;
    public function __construct()
    {

        $this->privacyPoliciesService = new PrivacyPoliciesService();
    }

    public function getById()
    {

        $privacyPolicy = $this->privacyPoliciesService->getById(id: request('id'));
        return $this->apiResponse($privacyPolicy);
    }
    public function get()
    {

        $privacyPolicies = $this->privacyPoliciesService->get();
        return $this->apiResponse($privacyPolicies);
    }

    public function create(StoreRequest $request)
    {

        $data = $request->validated();

        $createdPrivacyPolicy = $this->privacyPoliciesService->create($data);
        return $this->apiResponse($createdPrivacyPolicy);
    }


    public function update(UpdateRequest $request)
    {

        $privacyPolicy = $request->validated();
        $updatedPrivacyPolicy = $this->privacyPoliciesService->update($privacyPolicy);
        return $this->apiResponse($updatedPrivacyPolicy);
    }

    public function delete($id)
    {

        $this->privacyPoliciesService->delete($id);
        return $this->apiResponse(null, true, __('deleted'));
    }
}
