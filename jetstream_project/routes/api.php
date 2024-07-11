<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Livewire\USSDHandler;
use App\Http\Livewire\PaymentHandler;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});



// // Route::post('/ussd', [USSDHandler::class, 'ussdHandler']);
// Route::post('/initiate-payment', [PaymentHandler::class, 'initiatePayment']);
// Route::post('/payment-handler', [PaymentHandler::class, 'handlePaymentCallback']);
