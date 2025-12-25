<?php

namespace App\Http\Controllers;

use App\Http\Traits\ResponsesTrait;
use App\Http\Controllers\Controller;
use App\Http\Traits\FileUploadTrait;
use App\Http\Requests\FAQs\StoreRequest;
use App\Http\Requests\FAQs\UpdateRequest;
use App\Http\Services\FAQsService;

class FAQsController extends Controller
{

    use ResponsesTrait;
    use FileUploadTrait;
    private $faqsService;

    public function __construct()
    {

        $this->faqsService = new FAQsService();
    }

    public function getById()
    {

        $news = $this->faqsService->getById(id: request('id'));
        return $this->apiResponse($news);
    }
    public function get()
    {

        $news = $this->faqsService->get();
        return $this->apiResponse($news);
    }

    public function create(StoreRequest $request)
    {

        $data = $request->validated();

        $createdNew = $this->faqsService->create($data);
        return $this->apiResponse($createdNew);
    }


    public function update(UpdateRequest $request)
    {

        $new = $request->validated();
        $updatedNew = $this->faqsService->update($new);
        return $this->apiResponse($updatedNew);
    }

    public function delete($id)
    {

        $this->faqsService->delete($id);
        return $this->apiResponse(null, true, __('deleted'));
    }
}
