<?php

namespace App\Http\Controllers;

use App\Http\Traits\ResponsesTrait;
use App\Http\Controllers\Controller;
use App\Http\Requests\TermAndCondition\StoreRequest;
use App\Http\Requests\TermAndCondition\UpdateRequest;
use App\Http\Services\TermsAndConditionsService;

class TermsAndConditionsController extends Controller
{

    use ResponsesTrait;
    private $termsAndConditionsService;

    public function __construct()
    {

        $this->termsAndConditionsService = new TermsAndConditionsService();
    }

    public function getById()
    {

        $termAndCondition = $this->termsAndConditionsService->getById(id: request('id'));
        return $this->apiResponse($termAndCondition);
    }
    public function get()
    {

        $termsAndConditions = $this->termsAndConditionsService->get();
        return $this->apiResponse($termsAndConditions);
    }

    public function create(StoreRequest $request)
    {

        $data = $request->validated();

        $createdTermAndCondition = $this->termsAndConditionsService->create($data);
        return $this->apiResponse($createdTermAndCondition);
    }


    public function update(UpdateRequest $request)
    {

        $termAndCondition = $request->validated();
        $updatedTermAndCondition = $this->termsAndConditionsService->update($termAndCondition);
        return $this->apiResponse($updatedTermAndCondition);
    }

    public function delete($id)
    {

        $this->termsAndConditionsService->delete($id);
        return $this->apiResponse(null, true, __('deleted'));
    }
}
