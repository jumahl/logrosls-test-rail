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
        Schema::table('materias', function (Blueprint $table) {
            // Verificar si la columna existe antes de intentar eliminarla
            if (Schema::hasColumn('materias', 'grado_id')) {
                // Intentar eliminar la clave foránea de forma segura
                try {
                    $table->dropForeign(['grado_id']);
                } catch (\Exception $e) {
                    // Si la clave foránea no existe, continúa sin error
                }

                $table->dropColumn('grado_id');
            }
        });

        // Crear la tabla pivot grado_materia
        Schema::create('grado_materia', function (Blueprint $table) {
            $table->id();
            $table->foreignId('grado_id')->constrained('grados')->onDelete('cascade');
            $table->foreignId('materia_id')->constrained('materias')->onDelete('cascade');
            $table->timestamps();

            // Índice único para evitar duplicados
            $table->unique(['grado_id', 'materia_id']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        // Eliminar la tabla pivot
        Schema::dropIfExists('grado_materia');

        // Restaurar la columna grado_id en la tabla materias
        Schema::table('materias', function (Blueprint $table) {
            if (!Schema::hasColumn('materias', 'grado_id')) {
                $table->foreignId('grado_id')->constrained('grados')->after('codigo');
            }
        });
    }
};
