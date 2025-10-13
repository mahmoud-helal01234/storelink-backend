<?php

namespace App\Http\Services;

use App\Models\User;
use App\Http\Traits\ArraySliceTrait;
use App\Http\Traits\FileUploadTrait;
use App\Http\Traits\LoggedInUserTrait;
use Illuminate\Http\Exceptions\HttpResponseException;


class UsersService
{

    use FileUploadTrait;
    use ArraySliceTrait;
    use LoggedInUserTrait;   


    public function getById($id)
    {

        $user = User::find($id);
        if (!$user) {

            throw new HttpResponseException($this->apiResponse(null, false, __('validation.not_found')));
        }
        return $user;
    }
    public function toggleActivation($request)
    {

        $user = $this->getById($request->user_id);
        try {

            $user->update(['active' => $request->status]);

        } catch (\Exception $ex) {

            throw new HttpResponseException($this->apiResponse(null, false, __('validation.cannot_delete')));
        }
    }

}
