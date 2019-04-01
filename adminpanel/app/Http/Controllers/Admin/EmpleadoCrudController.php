<?php

namespace App\Http\Controllers\Admin;

use Backpack\CRUD\app\Http\Controllers\CrudController;

// VALIDATION: change the requests to match your own file names if you need form validation
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

	// Habilitando los detalles de cada empleado
        $this->crud->enableDetailsRow();

	// Permitiendo a los administradores ver los detalles
	$this->crud->allowAccess('details_row');

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
        $this->crud->setFromDb(); // Lo define automáticamente con las etiquetas y los campos de su respectiva tabla en la BD

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
}
