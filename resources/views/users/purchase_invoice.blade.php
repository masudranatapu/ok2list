@extends('layouts.app')

@push('custom_css')
    <script src="{{ asset('js/html2pdf.bundle.min.js')}}"></script>
    <script>
        function generatePDF() {
            const element = document.getElementById('invoice');
            html2pdf()
            .set({ html2canvas: { scale: 4 } })
            .from(element)
            .save();
        }
    </script>
@endpush

@section('content')
    @php
        $site_settings = DB::table('site_settings')->latest()->first();
    @endphp
<!-- myads-page -->
<section id="main" class="clearfix myads-page">
    <div class="container">
        <div class="breadcrumb-section">
            <!-- breadcrumb -->
            <ol class="breadcrumb">
				<li><a href="{{url('/')}}">@lang('web.home')</a></li>
                <li>Purchase Invoice</li>
            </ol><!-- breadcrumb -->
        </div><!-- banner -->
                <div class="purchase_invoice">
                    <div class="mb-3">
                        <button class="btn btn-danger" onclick="generatePDF()">
                            <i class="fa fa-download"></i>
                         Download
                        </button>
                        <button class="btn btn-secondary" onclick="printDiv()">
                            <i class="fa fa-print"></i>
                            Print
                        </button>
                    </div>
                    <div class="row" id="invoice">
                        <div class="col-12" id="printInvoice">
                            <div class="section">
                                <div class="row">
                                    <div class="col-6">
                                        <div class="invoice_info">
                                            <p class="h3">Ok2list</p>
                                            <address>
                                                {{$site_settings->website_title}}<br>
                                                {{$site_settings->address}}
                                                <br>
                                                {{$site_settings->website_email}}
                                                <br>
                                                {{$site_settings->phone}}
                                                <br>
                                                <p class="tex_number">Transaction Number:
                                                {{$payment->transaction_id}}</p>
                                            </address>
                                         </div>   
                                    </div>
                                    <div class="col-6">
                                        <div class="invoice_info" style="text-align: right;">
                                            <p class="h3">User Info</p>
                                            <address>
                                                {{$payment->name}}
                                                <br>
                                                {{$payment->address}}<br>{{$payment->billing_state}}-{{$payment->zip_code}}<br>
                                                {{$payment->email}}
                                                <br>
                                                {{$payment->phone}}
                                                <br>
                                            </address>
                                            <h3>INVOICE DATE :
                                                {{$payment->created_at}}</h3>
                                         </div>
                                    </div>
                                    <table class="table p-4 table-transparent table-responsive">
                                        <thead>
                                            <tr>
                                                <th class="text-center" style="width: 1%"></th>
                                                <th>Description</th>
                                                <th class="text-center"> Payment Status</th>
                                                <th class="text-end" style="width: 1%"></th>
                                                <th class="text-end" style="width: 1%">Amount</th>
                                            </tr>
                                        </thead>
                                        <tbody><tr>
                                            <td class="text-center">1</td>
                                            <td>
                                                <p class="strong mb-1">Extended : {{$payment->package->title ?? ''}}</p>
                                                {{-- <div class="text-muted">Via :
                                                    {{$payment->package->title}}</div> --}}
                                            </td>
                                            <td class="text-center">
                                                @if($payment->status == "VALID")
                                                    Paid
                                                @endif
                                                @if($payment->status == "Due")
                                                    Due
                                                @endif
                                                @if($payment->status == "Free")
                                                    Free
                                                @endif
                                            </td>
                                            <td class="text-end"></td>
                                            <td class="text-end">
                                               ₦{{$payment->amount ?? ''}}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="4" class="strong text-end">Subtotal</td>
                                            <td class="text-end">
                                               ₦{{$payment->amount ?? ''}}
                                            </td>
                                        </tr>
                                        
                                        <tr>
                                            <td colspan="4" class="font-weight-bold text-uppercase text-end">Total</td>
                                            <td class="font-weight-bold text-end">
                                               ₦{{$payment->amount ?? ''}}
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                </div>
                                <div class="thank_msg text-center">
                                    <p>Thank you very much for doing business with us. We look forward to working with you again!</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div><!-- profile -->
            </div><!-- row -->
        </div><!-- row -->
    </div><!-- container -->
</section><!-- myads-page -->
<script>
    function printDiv(){
        var printContents = document.getElementById("printInvoice").innerHTML;
        var originalContents = document.body.innerHTML;
        document.body.innerHTML = printContents;
        window.print();
        document.body.innerHTML = originalContents;
        $("div").removeClass("show");
        location.reload();
    }
</script>
@endsection