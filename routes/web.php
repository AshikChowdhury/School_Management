<?php

use App\Http\Controllers\AdminController;
use App\Http\Controllers\Backend\ProfileController;
use App\Http\Controllers\Backend\Setup\StudentClassController;
use App\Http\Controllers\Backend\UserController;
use App\Http\Controllers\Backend\Setup\StudentYearController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

//Route::get('/', function () {
//    return view('auth.login');
//});

Route::middleware(['auth:sanctum', 'verified'])->get('/', function () {
    return view('admin.index');
})->name('dashboard');

Route::group(['middleware' => 'auth'], function () {
    Route::get('admin/logout', [AdminController::class, 'Logout'])->name('admin.logout');

//user management all route
    Route::prefix('users')->group(function () {
        Route::get('/view', [UserController::class, 'UserView'])->name('user.view');
        Route::get('/add', [UserController::class, 'UserAdd'])->name('user.add');
        Route::post('/store', [UserController::class, 'UserStore'])->name('user.store');
        Route::get('/edit/{id}', [UserController::class, 'UserEdit'])->name('user.edit');
        Route::post('/update/{id}', [UserController::class, 'UserUpdate'])->name('user.update');
        Route::get('/delete/{id}', [UserController::class, 'UserDelete'])->name('user.delete');
    });

//user profile and password change
    Route::prefix('profile')->group(function () {
        Route::get('/view', [ProfileController::class, 'ProfileView'])->name('profile.view');
        Route::get('/edit', [ProfileController::class, 'ProfileEdit'])->name('profile.edit');
        Route::post('/update', [ProfileController::class, 'ProfileUpdate'])->name('profile.update');
        Route::get('/password/change', [ProfileController::class, 'PasswordChange'])->name('password.change');
        Route::post('/password/update', [ProfileController::class, 'PasswordUpdate'])->name('password.update');
    });

    Route::prefix('setups')->group(function () {
        //Student Class
        Route::get('student/class/add', [StudentClassController::class, 'StudentClassAdd'])->name('student.class.add');
        Route::post('student/class/store', [StudentClassController::class, 'StudentClassStore'])->name('student.class.store');
        Route::get('student/class/view', [StudentClassController::class, 'StudentClassView'])->name('student.class.view');
        Route::get('student/class/edit/{id}', [StudentClassController::class, 'StudentClassEdit'])->name('student.class.edit');
        Route::post('student/class/update/{id}', [StudentClassController::class, 'StudentClassUpdate'])->name('student.class.update');
        Route::get('student/class/delete/{id}', [StudentClassController::class, 'StudentClassDelete'])->name('student.class.delete');

        //Student Year
        Route::get('student/year/add', [StudentYearController::class, 'StudentYearAdd'])->name('student.year.add');
        Route::post('student/year/store', [StudentYearController::class, 'StudentYearStore'])->name('student.year.store');
        Route::get('student/year/view', [StudentYearController::class, 'StudentYearView'])->name('student.year.view');
        Route::get('student/year/edit/{id}', [StudentYearController::class, 'StudentYearEdit'])->name('student.year.edit');
        Route::post('student/year/update/{id}', [StudentYearController::class, 'StudentYearUpdate'])->name('student.year.update');
        Route::get('student/year/delete/{id}', [StudentYearController::class, 'StudentYearDelete'])->name('student.year.delete');
    });
});

