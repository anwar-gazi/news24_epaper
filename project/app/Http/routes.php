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
    $exitCode = Artisan::call('news:categories');
    return 'Clear and Config All';
});

Route::get('/sync', function() {
    $exitCode = Artisan::call('news:categories');
    return 'Sync Categories';
});


##########################
## Epaper Module
##########################

##Home
Route::get('/', 'EpaperController@index')->name('Home');
##SharedItem
Route::get('/uploads/epaper/{year_month}/{month}/{day}/images/shared/{mainImg}/{reatedImg?}', 'EpaperController@SharedItem')->name('Shared');
##getItem
Route::get('/getpath', 'EpaperController@getPath')->name('getPath');
##ByEdition
Route::get('/{edition}/{date}/{page_no}', 'EpaperController@byEdition')->name('By Edition');
##AllPage
Route::get('/all/pages/{edition}/{date}', 'EpaperController@allPages')->name('All Pages');
