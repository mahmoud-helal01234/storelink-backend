<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class TermAndCondition extends Model
{

    protected $table = "terms_and_conditions";
    use HasFactory;

    protected $fillable = [

        'id', 'title_ar', 'title_en', 'created_at', 'updated_at'
    ];
    
    function termAndConditionItems()
    {
        return $this->hasMany(TermAndConditionItem::class, 'term_and_condition_id', 'id');
    }
}
