<?php

// --------------------------
// Custom Backpack Routes
// --------------------------
// This route file is loaded automatically by Backpack\Base.
// Routes you generate using Backpack\Generators will be placed here.

Route::get('importExportView', 'App\Http\Controllers\Admin\EmpleadoCrudController@importExportView')->name('ieview');
Route::post('import', 'App\Http\Controllers\Admin\EmpleadoCrudController@import')->name('import');
Route::group([
    'prefix'     => config('backpack.base.route_prefix', 'admin'),
    'middleware' => ['web', config('backpack.base.middleware_key', 'admin')],
    'namespace'  => 'App\Http\Controllers\Admin',
], function () { // custom admin routes
    CRUD::resource('empleado', 'EmpleadoCrudController');
}); // this should be the absolute last line of this file
