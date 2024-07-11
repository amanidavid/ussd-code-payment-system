<?php

use Illuminate\Support\Facades\Route;
use App\Livewire\USSDHandler;
use App\Livewire\PaymentHandler;
use App\Livewire\PdfDocument;


/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('auth/login');
});

Route::middleware([
    'auth:sanctum',
    config('jetstream.auth_session'),
    'verified',
])->group(function () {
    Route::get('/livewire.payment-handler', [PaymentHandler::class, 'render'])->name('payment.render');

    Route::get('/pdf/report', [PdfDocument::class, 'generateReport'])->name('generate-report');

    Route::get('/dashboard', function () {
    //     return view('dashboard');
    // })->name('dashboard');
    $uniqueUsers = DB::table('payments')
    ->select(DB::raw('COUNT(DISTINCT(phoneNumber)) as unique_users'))
    ->first()->unique_users;

    $dailyPayments = DB::table('payments')
    ->select(DB::raw('DATE(created_at) as date'), DB::raw('SUM(amount) as total_amount'))
    ->groupBy(DB::raw('DATE(created_at)'))
    ->get();

    $dailyCharges = DB::table('taxcharges')
    ->select(DB::raw('DATE(created_at) as date'), DB::raw('SUM(tax_charges) as total_amount'))
    ->groupBy(DB::raw('DATE(created_at)'))
    ->get();

return view('dashboard', compact('uniqueUsers','dailyPayments','dailyCharges'));
})->name('dashboard');
});

Route::post('/ussd', [USSDHandler::class, 'ussdHandler']);




