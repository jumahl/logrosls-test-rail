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
        Schema::table('logros', function (Blueprint $table) {
            $table->string('codigo')->unique()->after('id')->comment('Código único del logro (ej: LOG-2024-001)');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('logros', function (Blueprint $table) {
            $table->dropColumn('codigo');
        });
    }
};
