<?php

namespace App\Http\Services\PagesContent;

use App\Models\Review;
use App\Models\SocialLink;
use App\Models\LandingPageContent;
use App\Models\LandingSliderImage;
use App\Models\FloatingSocialLink;
use App\Http\Traits\ResponsesTrait;
use App\Http\Traits\FileUploadTrait;
use App\Http\Traits\LoggedInUserTrait;
use Illuminate\Http\Exceptions\HttpResponseException;

class LandingPageContentService
{

    use ResponsesTrait;
    use FileUploadTrait;
    use LoggedInUserTrait;

    public function get()
    {

        $loggedInUser = $this->getLoggedInUser();

        if ($loggedInUser != null){
            if($loggedInUser->role == "admin"){

                $data = LandingPageContent::first();
                return $data;
            }
        }
        $data = LandingPageContent::first();
        // $data['floating_social_link'] = FloatingSocialLink::where('active', 1)->orderBy('created_at', 'DESC')->select('img_path')->get();
        // $data['social_links'] = SocialLink::where('active', 1)->orderBy('created_at', 'DESC')->select('img_path')->get();
        // $data['reviews'] = Review::where('active', 1)->orderBy('created_at', 'DESC')->select('img_path')->get();

        return $data;
    }

    public function update($newLandingPageContent)
    {

        try {

            $landingPageContent = LandingPageContent::updateOrCreate(['id' => 1], $newLandingPageContent);
            return $landingPageContent;
        } catch (\Exception $ex) {

            throw new HttpResponseException($this->apiResponse(status:false));;
        }
    }
}
