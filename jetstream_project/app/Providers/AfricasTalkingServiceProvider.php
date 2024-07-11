<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use AfricasTalking\SDK\AfricasTalking;

class AfricasTalkingServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     */
    public function register(): void
    {
        //
        $this->app->singleton(AfricasTalking::class, function ($app) {
            $username = env('AFRICAS_TALKING_USERNAME');
            $apiKey = env('AFRICAS_TALKING_API_KEY');

            return new AfricasTalking($username, $apiKey);
        });
    }

    /**
     * Bootstrap services.
     */
    public function boot(): void
    {
        //
    }
}
