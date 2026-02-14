<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TermAndConditionItem extends Model
{

    protected $table = "terms_and_conditions_items";
    use HasFactory;

    protected $fillable = [

        'id', 'content_ar', 'content_en', 'term_and_condition_id'
    ];

    public $timestamps = false;

    function termAndCondition()
    {
        return $this->belongsTo(TermAndCondition::class, 'term_and_condition_id', 'id');
    }
}
