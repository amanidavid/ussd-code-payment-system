<?php
namespace App\Services;
use AfricasTalking\SDK\AfricasTalking;
use Illuminate\Support\Facades\Log;


class PaymentGateway
{
    protected $africasTalking;

    public function __construct(AfricasTalking $africasTalking)
    {
        $this->africasTalking = $africasTalking;
    }

    public function processPayment($phoneNumber, $amount, $currencyCode)
    {
        try {
            $payments = $this->africasTalking->payments();

            $response = $payments->mobileCheckout([
                'productName' => 'your_product_name',
                'phoneNumber' => $phoneNumber,
                'currencyCode' => $currencyCode,
                'amount' => $amount,
                'metadata' => [
                    'description' => 'Payment for order donate ifm charity',
                    'reference' => 'order-1234',
                ],
            ]);

            return $response['status'] === 'Success';
        } catch (\Exception $e) {
            \Log::error('Africa\'s Talking payment failed', ['error' => $e->getMessage()]);
            return false;
        }
    }
}
