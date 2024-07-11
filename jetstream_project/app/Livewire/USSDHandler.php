<?php

namespace App\Livewire;

use Livewire\Component;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Http;

use AfricasTalking\SDK\AfricasTalking;
use App\Livewire\PaymentHandler;
use Illuminate\Support\Facades\Log;


use App\Models\User;
use App\Models\Payment;


class USSDHandler extends Component
{ 
   

    public function render()
    {
        return view('livewire.u-s-s-d-handler');
    }

    public function ussdHandler(Request $request){
        //Api parameters from Africas Talks

        $sessionId   = $request->input("sessionId");
        $serviceCode = $request->input("serviceCode");
        $phoneNumber = $request->input("phoneNumber");
        $text        = $request->input("text");
        $response="";
        $textArray = explode('*', $text);
        $userResponse = trim(end($textArray));
                
        
        if ($text == "") {
            $response  = "CON Welcome to Ifm Charity Donations \n";
            $response .= "1. Donatation \n";
            $response .= "2. My phone number";

        } else if ($text == "1") {
            $response = "CON Choose account information you want to view \n";
            $response .= "1. Send Money \n";
 
        } else if ($text == "2") {
            $response = "END Your phone number is ".$phoneNumber;

        } else if($text == "1*1") { 
            $response = "CON Enter the amount you want to donate ($)";

        } else if (isset($textArray[0]) && $textArray[0] == "1" && isset($textArray[1]) && $textArray[1] == "1" && count($textArray) == 3) {
            $amount = $textArray[2];
            if($amount >= 10){
                $amount = $textArray[2];
                $response = "CON Please confirm the payment  from $phoneNumber of  $ $amount  \n";
                $response .= "1. Confirm \n";
                $response .= "2. Cancel";
            }else{
                $response = "END Payment cancelled.";
            }
          

        } else if (isset($textArray[0]) && $textArray[0] == "1" && isset($textArray[1]) && $textArray[1] == "1" && isset($textArray[2]) && is_numeric($textArray[2]) && isset($textArray[3])) {
            $amount = $textArray[2];
            $confirmation = $textArray[3];
            
            if ($confirmation == "1") {

                $responses = $this->initiatePayment(  $phoneNumber,$amount);

                 $response = "END Payment of $responses was successful.";
              

            } else if ($confirmation == "2") {
                $response = "END You have insufficient balance.";
            } else {
                $response = "END Invalid choice.";
            }
        } else {
            $response = "END Invalid choice.";
        }

        return response($response)->header('Content-Type', 'text/plain');
    }
    
    private function initiatePayment($phoneNumber,$amount){

        try {
            $createPayment = new Payment();
            $createPayment->status = 'paid';
            $createPayment->phoneNumber = $phoneNumber;
            $createPayment->amount = $amount;
            $createPayment->transaction_id =$this->transactionID();
            $createPayment->created_at = now();
            $createPayment->updated_at = now();
            if ($createPayment->save()){
                $response= 'Ifm Charity ';
            }else{
                $response= 'failed to create payment';

            }
        
        } catch (\Exception $e) {
            $response= 'failed to update databse'.$e->getMessage();
        }

        return $response;
    }

    private function transactionID($length = 16){

    return bin2hex(random_bytes($length / 2));
    
    }

  

}
