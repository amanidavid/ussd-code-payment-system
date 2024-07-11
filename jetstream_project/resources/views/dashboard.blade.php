
@extends('layouts.app') 
@section('content')
<div class="all-content-wrapper">
<div class="analytics-sparkle-area">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                <div class="analytics-sparkle-line reso-mg-b-30">
                    <div class="analytics-content">
                        <h5>Total Amount</h5>
                        <h2>$<span class="counter">{{(app(\App\Livewire\PaymentHandler::class)->totalAmounts()) }}</span> <span class="tuition-fees">Net Amount Fees</span></h2>
                        <span class="text-success"></span>
                        
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                <div class="analytics-sparkle-line reso-mg-b-30">
                    <div class="analytics-content">
                        <h5>Payment Gateway</h5>
                        <h2>$<span class="counter">{{(app(\App\Livewire\PaymentHandler::class)->paymentGateway()) }}</span> <span class="tuition-fees">Charges Fees</span></h2>
                        {{-- <span class="text-danger"></span> --}}
                        {{-- <div class="progress m-b-0">
                            <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width:30%;"> <span class="sr-only">230% Complete</span> </div>
                        </div> --}}
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                <div class="analytics-sparkle-line reso-mg-b-30 table-mg-t-pro dk-res-t-pro-30">
                    <div class="analytics-content">
                        <h5>Total users </h5>
                        <h2><span class="counter">{{$uniqueUsers}}</span> <span class="tuition-fees">Unique Users</span></h2>
                        <span class="text-info"></span>
                        {{-- <div class="progress m-b-0">
                            <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width:60%;"> <span class="sr-only">20% Complete</span> </div>
                        </div> --}}
                    </div>
                </div>
            </div>
 
        </div>
    </div>
</div>
</div>

<div class="pie-bar-line-area mg-t-30 mg-b-15">
@include('layouts.bar');
</div>



{{-- <div class="container">
    @livewire('payment-handler')
</div> --}}
@endsection 
