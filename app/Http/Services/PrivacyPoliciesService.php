<?php

namespace App\Http\Services;

use App\Models\PrivacyPolicy;
use App\Http\Traits\ResponsesTrait;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Support\Facades\DB;

class PrivacyPoliciesService
{

    use ResponsesTrait;

    public function get()
    {

        $privacyPolicies = PrivacyPolicy::with('privacyPolicyItems')->get();

        return $privacyPolicies;
    }

    public function getById($id)
    {

        $privacyPolicy = PrivacyPolicy::with('privacyPolicyItems')->find($id);

        if ($privacyPolicy == null)
            throw new HttpResponseException($this->apiResponse(null, false, __('validation.not_exist')));

        return $privacyPolicy;
    }

    public function create($privacyPolicy)
    {

        try {
            DB::beginTransaction();
            $createdPrivacyPolicy = PrivacyPolicy::create($privacyPolicy);
            $createdPrivacyPolicy->privacyPolicyItems()->createMany($privacyPolicy['privacy_policy_items']);
            DB::commit();
            return $createdPrivacyPolicy->load('privacyPolicyItems');
        } catch (\Exception $ex) {
            DB::rollBack();
            throw new HttpResponseException($this->apiResponse(status: false));
        }
    }

    public function update($newPrivacyPolicy)
    {

        $privacyPolicy = $this->getById($newPrivacyPolicy['id']);
        try {
            DB::beginTransaction();
            $privacyPolicy->update($newPrivacyPolicy);
            
            $ids = collect($newPrivacyPolicy['privacy_policy_items'])
                ->pluck('id')->filter();
            $privacyPolicy->privacyPolicyItems()
                ->whereNotIn('id', $ids)
                ->delete();

            foreach ($newPrivacyPolicy['privacy_policy_items'] as $item) {
                $privacyPolicy->privacyPolicyItems()->updateOrCreate(
                    ['id' => $item['id'] ?? null],
                    $item
                );
            }
            
            DB::commit();
            return $privacyPolicy->load('privacyPolicyItems');
        } catch (\Exception $ex) {
            DB::rollBack();
            throw new HttpResponseException($this->apiResponse(status: false));;
        }
    }
    public function delete($id)
    {

        $privacyPolicy = $this->getById($id);
        try {
            DB::beginTransaction();
            $privacyPolicy->privacyPolicyItems()->delete();
            $privacyPolicy->delete();
            DB::commit();
            return true;
        } catch (\Exception $ex) {
            DB::rollBack();
            throw new HttpResponseException($this->apiResponse(status: false));;
        }
    }
}
