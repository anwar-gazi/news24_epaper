<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/

// artisan command
Route::get('/clear-all', function() {
	$exitCode = Artisan::call('view:clear');
	$exitCode = Artisan::call('route:clear');
    $exitCode = Artisan::call('cache:clear');
    $exitCode = Artisan::call('config:cache');
    return 'Clear and Config All';
});

Route::get('/', function () {
	if(Auth::user()){
		return redirect('/home');
	}else{
		return redirect('/login');
	}
});

// Route::auth();

##LogIn Routes
Route::get('/login', 'Auth\AuthController@showLoginForm');
Route::post('/login', 'Auth\AuthController@login');



Route::group(['middleware' => 'auth'], function() {

	#Logout
	Route::get('/logout', 'Auth\AuthController@logout');


	##########################
	## Dashboard Module
	##########################
	##Dashboard
	Route::get('/home', 'DashboardController@index')->name('Dashboard');
	##RemoveTempFolder
	Route::get('/home/remove-temp-folder/{folder_title}', 'DashboardController@removeTempFolder')->name('Remove Temp Folder');
	##Profile
	Route::get('/profile', 'DashboardController@profile')->name('Profile');
	##ProfileUpdate
	Route::post('/profile/update', 'DashboardController@profileUpdate')->name('Profile Update');


	##########################
	## Category Module
	##########################
	##ManageCategory
	Route::get('/manage-category', 'CategoryController@index')->name('Manage Category');
	##CreateCategory
	Route::post('/category/create', 'CategoryController@create')->name('Create Category');
	##UpdateCategory
	Route::post('/category/update', 'CategoryController@update')->name('Update Category');
	##DeleteCategory
	Route::get('/category/delete/{id}', 'CategoryController@delete')->name('Delete Category');
	##ChangeStatus
	Route::get('/ajax/category/change-status/{id}/{status}', 'CategoryController@changeStatus')->name('Change Status');
	##Details
	Route::get('/details', 'DashboardController@nd')->name('Information');
    ##UpdateDetails
    Route::post('/up_details', 'DashboardController@upnd')->name('Information Update');

	##########################
	## Edition Module
	##########################
	##ManageEdition
	Route::get('/manage-edition', 'EditionController@index')->name('Manage Edition');
	##CreateEdition
	Route::post('/edition/create', 'EditionController@create')->name('Create Edition');
	##UpdateEdition
	Route::post('/edition/update', 'EditionController@update')->name('Update Edition');
	##DeleteEdition
	Route::get('/edition/delete/{id}', 'EditionController@delete')->name('Delete Edition');
	##ChangeStatus
	Route::get('/ajax/edition/change-status/{id}/{status}', 'EditionController@changeStatus')->name('Change Status');


	##########################
	## Pages Module
	##########################
	##ManagePages
	Route::get('/manage-pages', 'PageController@index')->name('Manage Pages');
	##PublishPages
	Route::get('/publish-pages', 'PageController@publishPages');
	##publishDate
	Route::get('/publish-pages/{date}', 'PageController@publishDate');
	##UploadPage
	Route::post('/page/create', 'PageController@create')->name('Upload Page');
	##ajaxEditPage
	Route::get('/ajax-edit-page/{publish_date}/{page_id}', 'PageController@ajaxEditPage')->name('Edit Page Modal');
	##updatePage
	Route::post('/page/update/{page_id}', 'PageController@updatePage')->name('Update Page');
	##DeletePage
	Route::get('/page/delete/{page_id}/{page_name}/{publish_date}', 'PageController@deletePage')->name('Delete Page');


	##########################
	## Images Module
	##########################
	##MapImage
	Route::post('/{date}/set_featured_image', 'ImageController@set_featured_image');
	Route::get('/{date}/image-mapping-{page_id}', 'ImageController@index')->name('Image Mapping');
	##CropImage
	Route::post('/image-mapping/crop-image/{page_id}', 'ImageController@cropImage')->name('Crop Image');
	
	##AjaxImageRelationModal
	Route::get('/ajax-image-relation/edition/{edition_id}/{image_date}/{related_page}', 'ImageController@AjaxSelectImageRelationModal');

	##AjaxImageRelationUpdateModal
	Route::get('/ajax-image-relation-update/edition/{edition_id}/{image_id}/{related_image}/{image_date}/{related_page}/{relation_type}', 'ImageController@AjaxImageRelationUpdateModal');

	##imageRelationsSave
	Route::post('/manage-relations-save/{image_date}/{image_id}', 'ImageController@imageRelationsSave')->name('Image Relations Save');
	##DeleteImage
	Route::get('/image-mapping/delete/{image_id}/{image_name}/{publish_date}', 'ImageController@deleteImage')->name('Delete Image');



	##########################
	## Advertisement Module
	##########################
	##ManageAdvertisements
	Route::get('/manage-advertisements', 'AdvertisementController@index')->name('Manage Advertisements');
	##UpdateAdvertisements
	Route::post('/advertisement/update', 'AdvertisementController@update')->name('Update Advertisements');



	##########################
	## User Module
	##########################
	##ManageUsers
	Route::get('/manage-users', 'UserController@index')->name('Manage Users');
	##CreateUser
	Route::post('/user/create', 'UserController@create')->name('Create User');
	##UpdateUser
	Route::post('/user/update', 'UserController@update')->name('Update User');

});

// for updated php with lower laravel
if (version_compare(PHP_VERSION, '7.2.0', '>=')) {
	error_reporting(E_ALL ^ E_NOTICE ^ E_WARNING);
}
