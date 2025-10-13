<?php

namespace App\Http\Resources\Auth;

use Illuminate\Http\Resources\Json\JsonResource;

class StoreLoginResource extends JsonResource
{

    public function toArray($request)
    {

        return [

            "id"    => $this->id,
            "name"  => $this->name,
            "email" => $this->email,
            "token" => $this->token
            // "country_name_ar"    => $this->country->name_ar,
            // "country_name_en"    => $this->country->name_en
        ];
    }
}
