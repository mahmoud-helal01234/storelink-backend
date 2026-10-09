<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::table('promo_codes', function (Blueprint $table) {
            $table->dropUnique('promo_codes_code_unique');
            $table->unique(['code', 'store_id'], 'promo_codes_code_store_id_unique');
        });
    }

    public function down()
    {
        // Rollback fails if different stores still share a code.
        Schema::table('promo_codes', function (Blueprint $table) {
            $table->unique('code', 'promo_codes_code_unique');
            $table->dropUnique('promo_codes_code_store_id_unique');
        });
    }
};
