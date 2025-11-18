<?php

namespace App\Http\Controllers;

use App\Http\Traits\ResponsesTrait;
use App\Http\Controllers\Controller;
use App\Http\Traits\FileUploadTrait;
use App\Http\Requests\News\StoreRequest;
use App\Http\Requests\News\UpdateRequest;
use App\Http\Services\NewsService;

class NewsController extends Controller
{

    use ResponsesTrait;
    use FileUploadTrait;
    private $newsService;

    public function __construct()
    {

        $this->newsService = new NewsService();
    }

    public function getById()
    {

        $news = $this->newsService->getById(id: request('id'));
        return $this->apiResponse($news);
    }
    public function get()
    {

        $news = $this->newsService->get();
        return $this->apiResponse($news);
    }

    public function create(StoreRequest $request)
    {

        $data = $request->validated();

        $createdNew = $this->newsService->create($data);
        return $this->apiResponse($createdNew);
    }


    public function update(UpdateRequest $request)
    {

        $new = $request->validated();
        $updatedNew = $this->newsService->update($new);
        return $this->apiResponse($updatedNew);
    }

    public function delete($id)
    {

        $this->newsService->delete($id);
        return $this->apiResponse(null, true, __('deleted'));
    }
}
