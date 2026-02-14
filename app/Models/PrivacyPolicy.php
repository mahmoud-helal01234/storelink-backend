<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PrivacyPolicy extends Model
{

    protected $table = "privacy_policies";
    use HasFactory;

    protected $fillable = [

        'id', 'title_ar', 'title_en', 'created_at', 'updated_at'
    ];
    
    function privacyPolicyItems()
    {
        return $this->hasMany(PrivacyPolicyItem::class, 'privacy_policy_id', 'id');
    }
}
