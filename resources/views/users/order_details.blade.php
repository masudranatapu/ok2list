@extends('layouts.app')

@push('custom_css')
    <script src="{{ asset('js/html2pdf.bundle.min.js') }}"></script>
    <script>
        function generatePDF() {
            const element = document.getElementById('invoice');
            html2pdf()
                .set({
                    html2canvas: {
                        scale: 4
                    }
                })
                .from(element)
                .save();
        }
    </script>
@endpush

@section('content')
    @php
        $site_settings = DB::table('site_settings')
            ->latest()
            ->fiRst();
    @endphp
    <!-- myads-page -->
    <section id="main" class="clearfix myads-page">
        <div class="container">
            <div class="breadcrumb-section">
                <!-- breadcrumb -->
                <ol class="breadcrumb">
                    <li><a href="{{ url('/') }}">@lang('web.home')</a></li>
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
                            <div class="row ">
                                <div class="col-4">
                                    <div class="invoice_info">
                                        <p class="h3">Coustomer Info</p>
                                        <address>
                                            <strong>Coustomer Name:</strong> {{ $order->user->name }}
                                            <br>
                                            <strong>Coustomer Email:</strong> {{ $order->user->email }}
                                            <br>
                                            <strong>Coustomer Phone:</strong> {{ $order->user->mobile1 }}
                                            <br>
                                        </address>
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="invoice_info">
                                        <img src="{{ asset($setting->logo ?? 'uploads/2022/12/1671873605-logo2.png') }}" alt=""
                                            class="text-center" width="200px">
                                        <address>
                                            {{ $site_settings->website_title }}<br>
                                            {{ $site_settings->address }}
                                            <br>
                                            {{ $site_settings->website_email }}
                                            <br>
                                            {{ $site_settings->phone }}
                                        </address>
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="invoice_info">
                                        <p class="h3">Seller Info</p>
                                        <address>
                                            <strong>Seller Name:</strong> {{ $order->seller->name }}
                                            <br>
                                            <strong>Seller Email:</strong> {{ $order->seller->email }}
                                            <br>
                                            <strong>Seller Phone:</strong> {{ $order->seller->mobile1 }}
                                        </address>
                                    </div>
                                </div>
                            </div>
                            <div class="row ">
                                <div class="col-4">
                                    <div class="invoice_info">
                                        <p class="h3">Order Info</p>
                                        <address>
                                            <strong>Order ID:</strong> #{{ $order->id }}
                                            <br>
                                            <strong>Transaction No:</strong> {{ $order->transaction_number }}
                                            <br>
                                            <strong>Referance No:</strong> {{ $order->referance }}
                                            <br>
                                            <strong>Order Status:</strong> {{ ucfiRst($order->order_status) }}
                                            <br>
                                            <strong>Payment Status:</strong> {{ ucfiRst($order->payment_status) }}
                                        </address>
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="invoice_info">
                                        <p class="h3">Shipping Address</p>
                                        <address>
                                            <strong>Name:</strong> {{ $shipping['fiRstname'] }}
                                            {{ $shipping['lastname'] }}<br>
                                            <strong>Email:</strong> {{ $shipping['email'] }}<br>
                                            <strong>Phone:</strong> {{ $shipping['phone_number'] }}<br>
                                            <strong>Address:</strong> {{ $shipping['address'] }}<br>
                                            <strong>Apartment:</strong> {{ $shipping['apartment'] ?? '' }}<br>
                                            <strong>City:</strong> {{ $shipping['city'] }}<br>
                                            <strong>State:</strong> {{ $shipping['state'] }}<br>
                                            <strong>Post Code:</strong> {{ $shipping['zip_code'] }}<br>
                                            <strong>Country:</strong> {{ $shipping['country'] }}<br>
                                            <strong>Order Note:</strong> {{ $shipping['order_note'] ?? '' }}<br>
                                        </address>
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="invoice_info">
                                        <p class="h3">billing Address</p>
                                        <address>
                                            <strong>Name:</strong> {{ $billing['bill_fiRst_name'] }}
                                            {{ $billing['bill_last_name'] }}<br>
                                            <strong>Email:</strong> {{ $billing['bill_email'] }}<br>
                                            <strong>Phone:</strong> {{ $billing['bill_phone_number'] }}<br>
                                            <strong>Address:</strong> {{ $billing['bill_address'] }}<br>
                                            <strong>Apartment:</strong> {{ $billing['bill_apartment'] ?? '' }}<br>
                                            <strong>City:</strong> {{ $billing['bill_city'] }}<br>
                                            <strong>State:</strong> {{ $billing['bill_state'] }}<br>
                                            <strong>Post Code:</strong> {{ $billing['bill_zip_code'] }}<br>
                                            <strong>Country:</strong> {{ $billing['bill_country'] }}<br>
                                        </address>
                                    </div>
                                </div>
                            </div>
                            <table class="table p-4 table-transparent table-responsive">
                                <thead>
                                    <tr>
                                        <th class="text-center" style="width: 1%"></th>
                                        <th>Item</th>
                                        <th class="text-center"> Description</th>
                                        <th class="text-end" style="width: 10%"></th>
                                        <th class="text-end" style="width: 10%">Amount</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="text-center"></td>
                                        <td>
                                            <img src="{{ asset($order->product->photo ?? 'assets/img/default_thumb.png') }}" alt="product" width="150ppx">
                                        </td>
                                        <td class="text-center">
                                            {{ $order->product->ad_title }}
                                        </td>
                                        <td class="text-end"></td>
                                        <td class="text-right">
                                             {{ $order->product->price ?? '' }}
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td class="text-center">Tax</td>
                                        <td></td>
                                        <td class="text-right">
                                             {{ $order->tax ?? '0' }}
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td class="text-center">Shipping Charge</td>
                                        <td></td>
                                        <td class="text-right">
                                             {{ $order->amount - ($order->product->price + $order->tax) ?? '0' }}
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" class="font-weight-bold text-right">Subtotal</td>
                                        <td class="text-right">
                                             {{ $order->amount ?? '' }}
                                        </td>
                                    </tr>

                                    <tr>
                                        <td colspan="4" class="font-weight-bold text-uppercase text-right">Total</td>
                                        <td class="font-weight-bold text-right">
                                             {{ $order->amount ?? '' }}
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" class="font-weight-bold text-uppercase text-right">Paid</td>
                                        <td class="font-weight-bold text-right">
                                            @if ($order->payment_status == 'paid')
                                                 {{ $order->amount ?? '' }}
                                            @else
                                                 0
                                            @endif
                                        </td>
                                    </tr>
                                    <hr>
                                    <tr>
                                        <td colspan="4" class="font-weight-bold text-uppercase text-right">Due</td>
                                        <td class="font-weight-bold text-right">
                                            @if ($order->payment_status == 'unpaid')
                                                 {{ $order->amount ?? '' }}
                                            @else
                                                 0
                                            @endif
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="thank_msg text-center">
                                <p>Thank you very much for doing business with us. We look forward to working with you
                                    again!</p>
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
        function printDiv() {
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
