<?php

namespace App\Observers;
use App\Models\Payment;
use Emanate\BeemSms\Facades\BeemSms;

class paymentObserver
{
    //
    public function created(Payment $payment): void
    {

        BeemSms::content(" $payment->transaction_id Confirmed $ $payment->amount sent to Ifm Charity")
        ->unpackRecipients($payment->phoneNumber)
        ->send();
    }
}
    