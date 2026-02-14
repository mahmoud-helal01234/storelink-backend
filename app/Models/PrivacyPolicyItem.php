<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PrivacyPolicyItem extends Model
{

    protected $table = "privacy_policies_items";
    use HasFactory;

    protected $fillable = [

        'id', 'content_ar', 'content_en', 'privacy_policy_id'
    ];

    public $timestamps = false;

    function privacyPolicy()
    {
        return $this->belongsTo(PrivacyPolicy::class, 'privacy_policy_id', 'id');
    }
}
