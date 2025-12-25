<?php

namespace App\Http\Services;

use Exception;
use App\Models\FAQ;
use App\Http\Traits\ResponsesTrait;
use Illuminate\Support\Facades\Log;
use Illuminate\Http\Exceptions\HttpResponseException;

class FAQsService
{

    use ResponsesTrait;

    public function get()
    {

        Log::info("start get faqs");

        $faqs = FAQ::get();
        return $faqs;
    }

    public function getById($id)
    {

        Log::info("start get faq by id");

        $faq = FAQ::find($id);

        if ($faq == null)
            throw new HttpResponseException($this->apiResponse(null, false, __('validation.not_exist')));
        return $faq;
    }

    public function create($faq)
    {

       
            Log::info("start create faq");

            return FAQ::create($faq);
             try {
        } catch (\Exception $ex) {

            throw new HttpResponseException($this->apiResponse(status: false));;
        }
    }

    public function update($newFAQ)
    {

        Log::info("start update faq");

        $faq = $this->getById($newFAQ['id']);

        try {
            $faq->update($newFAQ);
            return $faq;
        } catch (\Exception $ex) {

            throw new HttpResponseException($this->apiResponse(status: false));;
        }
    }

    public function delete($id)
    {

        Log::info("start delete faq");

        $faq = $this->getById($id);
        try {
            $faq->delete();
        } catch (\Exception $ex) {

            throw new HttpResponseException($this->apiResponse(null, false, __('validation.cannot_delete')));
        }
    }
}
