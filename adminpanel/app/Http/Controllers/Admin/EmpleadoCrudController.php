<?php

namespace App\Http\Controllers\Admin;
use Illuminate\Http\Request; // Se añade el controlador de métodos HTTP
use Backpack\CRUD\app\Http\Controllers\CrudController;
use App\Imports\EmpleadosImport; // Se añade el modelo de importación creado anteriormente al controlador
use Maatwebsite\Excel\Facades\Excel; // Se añade la librería de procesamiento de archivos excel
use App\Http\Requests\EmpleadoRequest as StoreRequest;
use App\Http\Requests\EmpleadoRequest as UpdateRequest;
use Backpack\CRUD\CrudPanel;

/**
 * Class EmpleadoCrudController
 * @package App\Http\Controllers\Admin
 * @property-read CrudPanel $crud
 */
class EmpleadoCrudController extends CrudController
{
    public function setup()
    {
        /*
        |--------------------------------------------------------------------------
        | CrudPanel Basic Information
        |--------------------------------------------------------------------------
        */
        $this->crud->setModel('App\Models\Empleado');
        $this->crud->setRoute(config('backpack.base.route_prefix') . '/empleado');
        $this->crud->setEntityNameStrings('empleado', 'empleados');

	// Habilitando la función de descarga de CSV
	$this->crud->enableExportButtons();

	// Habilitando la persistencia de filtrado y vista de la tabla mientras la sesión permanezca activa
	$this->crud->enablePersistentTable();
	/*
        |--------------------------------------------------------------------------
        | CrudPanel Configuration
        |--------------------------------------------------------------------------
        */

        // Define en la vista las columnas que serán vistas y los campos a rellenar
        //$this->crud->setFromDb(); // Lo define automáticamente con las etiquetas y los campos de su respectiva tabla en la BD

	$this->crud->addColumn([ // Este método añade manualmente una columna de la tabla de datos en la BD de este controlador
        	'name' => 'nombres', // nombre de la columna en la tabla
         	'label' => "Nombres", // etiqueta que aparecerá en la vista
         	'type' => 'string' // tipo de dato de la respectiva columna
         ]);
	$this->crud->addColumn([
         	'name' => 'apellido1',
         	'label' => "P. Apellido",
         	'type' => 'string'
         ]);
        $this->crud->addColumn([
                'name' => 'apellido2', 
                'label' => "S. Apellido", 
                'type' => 'string'
         ]);
        $this->crud->addColumn([
                'name' => 'cedula', 
                'label' => "Cédula", 
                'type' => 'string'
         ]);
        $this->crud->addColumn([
                'name' => 'fechanac', 
                'label' => "Fecha Nac.", 
                'type' => 'date'
         ]);
        $this->crud->addColumn([
                'name' => 'genero', 
                'label' => "Género", 
                'type' => 'char'
         ]);
        $this->crud->addColumn([
                'name' => 'fechaing', 
                'label' => "Fecha Ingreso", 
                'type' => 'date'
         ]);
        $this->crud->addColumn([
                'name' => 'numempleado', 
                'label' => "N° Empleado", 
                'type' => 'bigInteger'
         ]);
        $this->crud->addColumn([
                'name' => 'cargo', 
                'label' => "Cargo", 
                'type' => 'string'
         ]);
        $this->crud->addColumn([
                'name' => 'jefe', 
                'label' => "Jefe", 
                'type' => 'bigInteger'
         ]);
        $this->crud->addColumn([
                'name' => 'zona', 
                'label' => "Zona", 
                'type' => 'string'
         ]);
        $this->crud->addColumn([
                'name' => 'municipio', 
                'label' => "Municipio", 
                'type' => 'string'
         ]);
        $this->crud->addColumn([
                'name' => 'departamento', 
                'label' => "Departamento", 
                'type' => 'string'
         ]);
        $this->crud->addColumn([
                'name' => 'ventas', 
                'label' => "Ventas 2019", 
                'type' => 'decimal, 9, 2'
         ]);
        $this->crud->addColumn([
                'name' => 'email', 
                'label' => "E-Mail", 
                'type' => 'string'
         ]);
        $this->crud->addColumn([
                'name' => 'contrasena', 
                'label' => "Contraseña", 
                'type' => 'string'
         ]);
        $this->crud->addColumn([
                'name' => 'imgperfil', 
                'label' => "Imagen de perfil", 
                'type' => 'string'
         ]);
        $this->crud->addColumn([
                'name' => 'celular', 
                'label' => "Celular", 
                'type' => 'string'
         ]);

        $this->crud->addField([ // Este método añade manualmente un campo para llenar, en el formulario de la tabla de datos en la BD de este controlador
                'name' => 'nombres', // nombre de la columna en la tabla
                'label' => "Nombres", // etiqueta que aparecerá en la vista para el campo
                'type' => 'text' // tipo de campo a utilizar en el formulario
         ]);
        $this->crud->addField([
                'name' => 'apellido1',
                'label' => "Primer Apellido",
                'type' => 'text'
         ]);
        $this->crud->addField([
                'name' => 'apellido2', 
                'label' => "Segundo Apellido", 
                'type' => 'text'
         ]);
        $this->crud->addField([
                'name' => 'cedula', 
                'label' => "Cédula", 
                'type' => 'text'
         ]);
        $this->crud->addField([
                'name' => 'fechanac', 
                'label' => "Fecha de nacimiento", 
                'type' => 'date_picker'
         ]);
        $this->crud->addField([
                'name' => 'genero', 
                'label' => "Género", 
                'type' => 'text'
         ]);
        $this->crud->addField([
                'name' => 'fechaing', 
                'label' => "Fecha Ingreso", 
                'type' => 'date_picker'
         ]);
        $this->crud->addField([
                'name' => 'numempleado', 
                'label' => "N° Empleado", 
                'type' => 'number',
                'attributes' => ["step" => "any"],
                'prefix' => "Introduzca el N° empleado",
         ]);
        $this->crud->addField([
                'name' => 'cargo', 
                'label' => "Cargo", 
                'type' => 'text'
         ]);
        $this->crud->addField([
                'name' => 'jefe', 
                'label' => "Jefe", 
                'type' => 'number',
                'attributes' => ["step" => "any"],
                'prefix' => "Introduzca el N° empleado del jefe"
         ]);
        $this->crud->addField([
                'name' => 'zona', 
                'label' => "Zona", 
                'type' => 'text'
         ]);
        $this->crud->addField([
                'name' => 'municipio', 
                'label' => "Municipio", 
                'type' => 'text'
         ]);
        $this->crud->addField([
                'name' => 'departamento', 
                'label' => "Departamento", 
                'type' => 'text'
         ]);
        $this->crud->addField([
                'name' => 'ventas', 
                'label' => "Ventas 2019", 
                'type' => 'number',
		'attributes' => ["step" => "any"],
		'prefix' => "$ (COP)",
		'suffix' => ".00"
         ]);
        $this->crud->addField([
                'name' => 'email', 
                'label' => "E-Mail", 
                'type' => 'email'
         ]);
        $this->crud->addField([
                'name' => 'contrasena', 
                'label' => "Contraseña", 
                'type' => 'password'
         ]);
        $this->crud->addField([
                'name' => 'imgperfil', 
                'label' => "Imagen de perfil", 
                'type' => 'url'
         ]);
        $this->crud->addField([
                'name' => 'celular', 
                'label' => "Celular", 
                'type' => 'text'
         ]);

        // add asterisk for fields that are required in EmpleadoRequest
        $this->crud->setRequiredFields(StoreRequest::class, 'create');
        $this->crud->setRequiredFields(UpdateRequest::class, 'edit');
    }

    public function store(StoreRequest $request)
    {
        // your additional operations before save here
        $redirect_location = parent::storeCrud($request);
        // your additional operations after save here
        // use $this->data['entry'] or $this->crud->entry
        return $redirect_location;
    }

    public function update(UpdateRequest $request)
    {
        // your additional operations before save here
        $redirect_location = parent::updateCrud($request);
        // your additional operations after save here
        // use $this->data['entry'] or $this->crud->entry
        return $redirect_location;
    }

    public function import() // Método que ejecuta la importación de archivos
    {
        Excel::import(new EmpleadosImport, request()->file('file'));

        return redirect('/admin')->with('success', 'All good!');
    }

    public function importExportView() // Método que crea la vista de importación

    {

       return view('import');

    }

}
