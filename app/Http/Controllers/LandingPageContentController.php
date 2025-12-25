<?php

namespace App\Http\Controllers;

use App\Http\Traits\ResponsesTrait;
use App\Http\Controllers\Controller;
use App\Http\Traits\FileUploadTrait;
use Illuminate\Support\Facades\Hash;
use App\Http\Requests\LandingPageContent\UpdateRequest;
use App\Http\Services\PagesContent\LandingPageContentService;

class LandingPageContentController extends Controller
{

    use ResponsesTrait;
    use FileUploadTrait;
    private $landingPageContentService;

    public function __construct()
    {

        $this->landingPageContentService = new LandingPageContentService();
    }

    public function get()
    {
       
        $landingPageContent = $this->landingPageContentService->get();
        return $this->apiResponse($landingPageContent);
    }

    public function update(UpdateRequest $request)
    {

        $landingPageContent = $request->validated();
        $updatedLandingPageContent = $this->landingPageContentService->update($landingPageContent);
        return $this->apiResponse($updatedLandingPageContent);
    }

}
