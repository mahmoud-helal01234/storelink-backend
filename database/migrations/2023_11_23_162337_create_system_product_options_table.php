<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('system_product_options', function (Blueprint $table) {
            $table->id();
            //$table->unsignedInteger('system_product_id');
            $table->foreignId('system_product_id')->constrained('system_products')->onUpdate('cascade')->onDelete('cascade');
            $table->string('name_ar', 50);
            $table->string('name_en', 50);
            $table->boolean('active')->default(1);
            $table->softDeletes();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('system_product_options');
    }
};
