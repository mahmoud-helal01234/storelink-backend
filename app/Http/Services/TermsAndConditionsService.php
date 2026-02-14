<?php

namespace App\Http\Services;

use App\Models\TermAndCondition;
use App\Http\Traits\ResponsesTrait;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Support\Facades\DB;

class TermsAndConditionsService
{

    use ResponsesTrait;

    public function get()
    {

        $termsAndConditions = TermAndCondition::with('termAndConditionItems')->get();

        return $termsAndConditions;
    }

    public function getById($id)
    {

        $termAndCondition = TermAndCondition::with('termAndConditionItems')->find($id);

        if ($termAndCondition == null)
            throw new HttpResponseException($this->apiResponse(null, false, __('validation.not_exist')));

        return $termAndCondition;
    }

    public function create($termAndCondition)
    {

        try {
            DB::beginTransaction();
            $createdTermAndCondition = TermAndCondition::create($termAndCondition);
            $createdTermAndCondition->termAndConditionItems()->createMany($termAndCondition['term_and_condition_items']);
            DB::commit();
            return $createdTermAndCondition->load('termAndConditionItems');
        } catch (\Exception $ex) {
            DB::rollBack();
            throw new HttpResponseException($this->apiResponse(status: false));
        }
    }

    public function update($newTermAndCondition)
    {

        $termAndCondition = $this->getById($newTermAndCondition['id']);
        try {
            DB::beginTransaction();
            $termAndCondition->update($newTermAndCondition);
            
            $ids = collect($newTermAndCondition['term_and_condition_items'])
                ->pluck('id')->filter();
            $termAndCondition->termAndConditionItems()
                ->whereNotIn('id', $ids)
                ->delete();

            foreach ($newTermAndCondition['term_and_condition_items'] as $item) {
                $termAndCondition->termAndConditionItems()->updateOrCreate(
                    ['id' => $item['id'] ?? null],
                    $item
                );
            }
            
            DB::commit();
            return $termAndCondition->load('termAndConditionItems');
        } catch (\Exception $ex) {
            DB::rollBack();
            throw new HttpResponseException($this->apiResponse(status: false));;
        }
    }
    public function delete($id)
    {

        $termAndCondition = $this->getById($id);
        try {
            DB::beginTransaction();
            $termAndCondition->termAndConditionItems()->delete();
            $termAndCondition->delete();
            DB::commit();
            return true;
        } catch (\Exception $ex) {
            DB::rollBack();
            throw new HttpResponseException($this->apiResponse(status: false));;
        }
    }
}
