@extends('layouts.app') 
@section('content')



    <div class="all-content-wrapper">
 
        <!-- Static Table Start -->
        <div class="data-table-area mg-b-15">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="sparkline13-list">
                            <div class="sparkline13-hd">
                                <div class="main-sparkline13-hd">
                                    <h1>Projects <span class="table-project-n">Data</span> Table</h1>
                                </div>
                            </div>
                            <div class="sparkline13-graph">
                                <div class="datatable-dashv1-list custom-datatable-overright">
                                    <div id="toolbar">
                                        <select class="form-control dt-tb">
											<option value="">Export Basic</option>
											<option value="all">Export All</option>
											<option value="selected">Export Selected</option>
										</select>
                                    </div>
                                    <table id="table" data-toggle="table" data-pagination="true" data-search="true" data-show-columns="true" data-show-pagination-switch="true" data-show-refresh="true" data-key-events="true" data-show-toggle="true" data-resizable="true" data-cookie="true"
                                        data-cookie-id-table="saveId" data-show-export="true" data-click-to-select="true" data-toolbar="#toolbar">
                                        <thead>
                                            <tr>
                                                <th data-field="state" data-checkbox="false"></th>
                                                <th data-field="id">No</th>
                                                <th data-field="amount">Amount</th>
                                                <th data-field="Transaction" data-editable="false">Trasaction ID</th>
                                                <th data-field="date" data-editable="false">Date</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($payments as $index => $payment)
                                            <tr>
                                                <td></td>
                                                <td>{{$index+1}}</td>
                                                <td>{{ $payment->amount }} </td>
                                                <td>{{ $payment->transaction_id  }}</td>
                                                <td>{{ $payment->created_at  }}</td>
                                          
                                                </td>
                                            </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Static Table End -->
        <div class="footer-copyright-area">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="footer-copy-right">
                            <p>Copyright © 2018. All rights reserved. Template by Colorlib</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

@endsection
