<?php

namespace App\Http\Services;

use App\Models\Review;
use App\Http\Traits\ResponsesTrait;
use App\Http\Traits\FileUploadTrait;
use Illuminate\Http\Exceptions\HttpResponseException;

class ReviewsService{

    use ResponsesTrait;
    use FileUploadTrait;


    public function getById($id){

        $review = Review::find($id);
        if($review == null)
            throw new HttpResponseException($this->apiResponse(null, false, __('validation.not_exist')));
        return $review;
    }

    public function delete($id){

        $review = $this->getById($id);

        try{

            $review->delete();

        }catch(\Exception $ex){

            throw new HttpResponseException($this->apiResponse(null, false, __('validation.cannot_delete')));
        }
    }



}
