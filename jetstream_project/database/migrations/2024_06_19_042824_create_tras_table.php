<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('tras', function (Blueprint $table) {
            $table->id();
            $table->float('tax_charges');
            $table->unsignedBigInteger('payment_id');
            $table->timestamps();

            $table->foreign('payment_id')->references('id')->on('payments');
       
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tras');
    }
};
