
        if ($text == "") {
            // This is the first request. Note how we start the response with CON
            $response  = "CON Welcome to Ifm charity \n";
            $response .= "1. My Account \n";
            $response .= "2. My phone number";

        } else if ($text == "1") {
            // Business logic for first level response
            $response = "CON Choose account information you want to view \n";
            $response .= "1. Send Money \n";

        } else if ($text == "2") {
            // Business logic for first level response
            // This is a terminal request. Note how we start the response with END
            $response = "END Your phone number is ".$phoneNumber;

        } else if($text == "1*1") { 
            // This is a second level response where the user selected 1 in the first instance
            $response = "CON Enter the amount you want to pay (TZS)";

        } else if (isset($textArray[0]) && $textArray[0] == "1" && isset($textArray[1]) && $textArray[1] == "1" && count($textArray) == 3) {
            // This is the third level response where the user entered the amount
            $amount = $textArray[2];
            $response = "CON Confirm payment of TZS $amount to $phoneNumber \n";
            $response .= "1. Confirm \n";
            $response .= "2. Cancel";

        } else if (isset($textArray[0]) && $textArray[0] == "1" && isset($textArray[1]) && $textArray[1] == "1" && isset($textArray[2]) && is_numeric($textArray[2]) && isset($textArray[3])) {
            // This is the fourth level response where the user confirms or cancels the payment
            $amount = $textArray[2];
            $confirmation = $textArray[3];
            
            if ($confirmation == "1") {

                // Call the PaymentController to process the payment
            
             $response = $this->initiatePayment($request, $amount);
                // if ($paymentResponse->json()['success']) {
                    $response = "END Payment of TZS $amount to $phoneNumber was successful.";
                // } else {
                //     $response = "END Payment failed. Please try again.";
                // }

            } else if ($confirmation == "2") {
                $response = "END Payment cancelled.";
            } else {
                $response = "END Invalid choice.";
            }
        } else {
            $response = "END Invalid choice.";
        }

        return response($response)->header('Content-Type', 'text/plain');