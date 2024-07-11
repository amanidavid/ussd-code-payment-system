<?php

namespace App\Livewire;

use Livewire\Component;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

use App\Models\Payment;
use App\Models\Taxcharge;



class PaymentHandler extends Component
{

    public function render()
    {
        $payments = DB::table('payment_details_view')->get();
        return view('livewire.payment-handler',compact('payments'));
    }

    public function totalAmounts(){

        return Payment::sum('amount');


    }

    public function paymentGateway(){

        return Taxcharge::sum('tax_charges');


    }

    // public function uniqueUsers(){

    //     $result = Payment::count(DB::raw(DISTINCT('phoneNUmber')));
   
    //    }


  
}
