<?php

namespace App\Imports;

use App\Models\Empleado;
use Illuminate\Support\Facades\Hash;
use Maatwebsite\Excel\Concerns\ToModel;

class EmpleadosImport implements ToModel
{

    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row) // modela los datos del archivo excel o CSV según el formato especificado para la tabla de empleados en la BD
    {
	return new Empleado([
           'nombres'      => $row[0],
           'apellido1'    => $row[1],
           'apellido2'    => $row[2],
           'cedula'       => $row[3],
           'fechanac'     => \PhpOffice\PhpSpreadsheet\Shared\Date::excelToDateTimeObject($row[4]),
           'genero'       => $row[5],
           'fechaing'     => \PhpOffice\PhpSpreadsheet\Shared\Date::excelToDateTimeObject($row[6]),
           'numempleado'  => $row[7],
           'cargo'        => $row[8],
           'jefe'         => $row[9],
           'zona'         => $row[10],
           'municipio'    => $row[11],
           'departamento' => $row[12],
           'ventas'       => $row[13],
           'email'        => $row[14],
           'contrasena'   => Hash::make($row[15]),
           'imgperfil'    => $row[16],
           'celular'      => $row[17],
        ]);
    }
}
