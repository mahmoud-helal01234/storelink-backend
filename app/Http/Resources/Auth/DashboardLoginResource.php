<?php

namespace App\Http\Resources\Auth;

use Illuminate\Http\Resources\Json\JsonResource;

class DashboardLoginResource extends JsonResource
{

    public function toArray($request)
    {

        return [

            "id" => $this->id,
            "name" => $this->name,
            "email" => $this->email,
            "phone"  => $this->phone,
            "role"  => $this->role,
            "created_at" => $this->created_at,
            "updated_at" => $this->updated_at,
        ];
    }
}
