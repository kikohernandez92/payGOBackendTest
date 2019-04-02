<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateEmpleadosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up() // Esta función crea el esquema necesario para que la migración genere la tabla "Empleados" en la base de datos
    {
        Schema::create('empleados', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nombres');
            $table->string('apellido1');
            $table->string('apellido2');
            $table->string('cedula')->unique();
            $table->date('fechanac');
            $table->char('genero', 1);
            $table->date('fechaing');
            $table->bigInteger('numempleado');
            $table->string('cargo');
            $table->bigInteger('jefe')->nullable();
            $table->string('zona');
            $table->string('municipio');
            $table->string('departamento');
            $table->decimal('ventas', 13, 2)->nullable();
            $table->string('email');
            $table->string('contrasena');
            $table->text('imgperfil');
            $table->string('celular');
            $table->timestamps(); // Este tipo de columna crea en la tabla las columnas para identificar la fecha de creación o modificación del registro.
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('empleados');
    }
}
