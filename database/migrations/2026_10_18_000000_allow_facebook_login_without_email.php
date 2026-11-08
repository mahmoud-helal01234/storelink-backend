<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        // MySQL ALTER avoids requiring doctrine/dbal for a nullable change.
        DB::statement('ALTER TABLE users MODIFY email VARCHAR(255) NULL');
        Schema::table('users', function (Blueprint $table) {
            $table->string('facebook_id')->nullable()->unique();
        });
    }

    public function down()
    {
        // Refuse to discard identities or invalidate accounts created without email.
        if (DB::table('users')->whereNull('email')->exists()
            || DB::table('users')->whereNotNull('facebook_id')->exists()) {
            throw new RuntimeException('Migrate Facebook identities and fill missing emails before rolling back.');
        }
        Schema::table('users', function (Blueprint $table) {
            $table->dropUnique(['facebook_id']);
            $table->dropColumn('facebook_id');
        });
        DB::statement('ALTER TABLE users MODIFY email VARCHAR(255) NOT NULL');
    }
};
