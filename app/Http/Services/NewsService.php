<?php

namespace App\Http\Services;

use Exception;
use App\Models\News;
use App\Http\Traits\ResponsesTrait;
use Illuminate\Support\Facades\Log;
use Illuminate\Http\Exceptions\HttpResponseException;

class NewsService
{

    use ResponsesTrait;

    public function get()
    {

        Log::info("start get news");

        $news = News::get();
        return $news;
    }

    public function getById($id)
    {

        Log::info("start get new by id");

        $new = News::find($id);

        if ($new == null)
            throw new HttpResponseException($this->apiResponse(null, false, __('validation.not_exist')));
        return $new;
    }

    public function create($new)
    {

        try {
            Log::info("start create new");

            return News::create($new);
        } catch (\Exception $ex) {

            throw new HttpResponseException($this->apiResponse(status: false));;
        }
    }

    public function update($newNews)
    {

        Log::info("start update new");

        $new = $this->getById($newNews['id']);

        try {
            $new->update($newNews);
            return $new;
        } catch (\Exception $ex) {

            throw new HttpResponseException($this->apiResponse(status: false));;
        }
    }

    public function delete($id)
    {

        Log::info("start delete new");

        $new = $this->getById($id);
        try {
            $new->delete();
        
        } catch (\Exception $ex) {

            throw new HttpResponseException($this->apiResponse(null, false, __('validation.cannot_delete')));
        }
    }

}
