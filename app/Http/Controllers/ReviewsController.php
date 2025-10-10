<?php

namespace App\Http\Controllers;

use App\Http\Traits\ResponsesTrait;
use App\Http\Controllers\Controller;
use App\Http\Services\ReviewsService;

class ReviewsController extends Controller
{

    use ResponsesTrait;
    private $reviewsService;

    public function __construct()
    {

        $this->reviewsService = new ReviewsService();
    }

    public function delete($id)
    {

        $this->reviewsService->delete($id);
        return $this->apiResponse(null, true, __('deleted'));
    }

}
