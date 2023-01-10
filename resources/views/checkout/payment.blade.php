@extends('layouts.app')

@section('content')
    <section id="main" class="clearfix">
        <div class="container">

            <div class="breadcrumb-section">
                <ol class="breadcrumb">
                    <li><a href="{{ url('/') }}">Home</a></li>
                    <li>Checkout</li>
                </ol>
            </div>

            <div class="checkout_form">
                <div class="row">
                    <div class="col-lg-9">
                        <div class="tab_nav">
                            <div class="steps flex-sm-nowrap">
                                <a class="step active" href="{{ route('checkout.shipping') }}">
                                    <h4 class="step-title">1. Shipping Address:</h4>
                                </a>
                                <a class="step active" href="{{ route('checkout.billing') }}">
                                    <h4 class="step-title">2. Billing Address:</h4>
                                </a>

                                <a class="step active" href="{{ route('checkout.payment') }}">
                                    <h4 class="step-title">3. Review and pay</h4>
                                </a>
                            </div>
                        </div>
                        <!-- shipping address form -->
                        <div class="shipping_form">
                            <div class="title mb-3">
                                <h3>Review Your Order</h3>
                            </div>

                            <div class="customer_info mb-4">
                                <div class="row">
                                    <div class="col-md-6">
                                        <h3>Shipping address :</h3>
                                        <table class="table">
                                            <tr>
                                                <td>Full Name:</td>
                                                <td>{{ Session::get('shipping_address.fiRstname') }}
                                                    {{ Session::get('shipping_address.lastname') }}</td>
                                            </tr>
                                            <tr>
                                                <td>Address:</td>
                                                <td>{{ Session::get('shipping_address.address') }}</td>
                                            </tr>
                                            <tr>
                                                <td>Apartment#:</td>
                                                <td>{{ Session::get('shipping_address.appartment') ?? 'N/A' }}</td>
                                            </tr>
                                            <tr>
                                                <td>Phone:</td>
                                                <td>{{ Session::get('shipping_address.phone_number') }}</td>
                                            </tr>
                                            <tr>
                                                <td>City:</td>
                                                <td>{{ Session::get('shipping_address.city') }}</td>
                                            </tr>
                                            <tr>
                                                <td>State:</td>
                                                <td>{{ Session::get('shipping_address.state') }}</td>
                                            </tr>
                                            <tr>
                                                <td>Zip Code:</td>
                                                <td>{{ Session::get('shipping_address.zip_code') }}</td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-md-6">
                                        <h3>Invoice address :</h3>
                                        <table class="table">
                                            <tr>
                                                <td>Full Name:</td>
                                                <td>{{ Session::get('billing_address.bill_fiRst_name') }}
                                                    {{ Session::get('billing_address.bill_last_name') }}</td>
                                            </tr>
                                            <tr>
                                                <td>Address:</td>
                                                <td>{{ Session::get('billing_address.bill_address') }}</td>
                                            </tr>
                                            <tr>
                                                <td>Apartment#:</td>
                                                <td>{{ Session::get('billing_address.bill_appartment') ?? 'N/A' }}</td>
                                            </tr>
                                            <tr>
                                                <td>Phone:</td>
                                                <td>{{ Session::get('billing_address.bill_phone_number') }}</td>
                                            </tr>
                                            <tr>
                                                <td>City:</td>
                                                <td>{{ Session::get('billing_address.bill_city') }}</td>
                                            </tr>
                                            <tr>
                                                <td>State:</td>
                                                <td>{{ Session::get('billing_address.bill_state') }}</td>
                                            </tr>
                                            <tr>
                                                <td>Zip Code:</td>
                                                <td>{{ Session::get('billing_address.bill_zip_code') }}</td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>


                            <form id="paymentForm">
                                <input type="hidden" id="email-address"
                                    value="{{ Session::get('billing_address.bill_email') }}" />
                                <input type="hidden" id="amount" value="{{ Session::get('cart.price') }}" />
                                <input type="hidden" id="public_key" value="{{ $setting->paystack_public_key }}" />
                                <input type="hidden" id="paystack_curency" value="{{ $setting->paystack_curency }}" />
                                {{-- <div class="form-submit">
                                    <button type="submit" onclick="payWithPaystack()"> Pay </button>
                                </div> --}}
                                <div class="payment_method">
                                    <div class="mb-3">
                                        <h3>Pay with :</h3>
                                    </div>

                                    <div class="paystack_method">
                                        <button type="submit" onclick="payWithPaystack()" class="text-center"
                                            style="border: none;padding: 12px;">
                                            <img src="{{ asset('paystack.png') }}" width="150" alt="paystack"><br />
                                            <span>Paystack</span>
                                        </button>
                                    </div>

                                </div>
                            </form>



                        </div>
                    </div>

                    @include('checkout.sidebar')
                </div>
            </div>
        </div>

    </section>
@endsection

@push('custom_js')
    <script src="https://js.paystack.co/v1/inline.js"></script>
    <script>
        const paymentForm = document.getElementById('paymentForm');
        paymentForm.addEventListener("submit", payWithPaystack, false);

        function payWithPaystack(e) {
            e.preventDefault();
            let amount = document.getElementById("amount").value;
            let key = document.getElementById("public_key").value;
            let currency = document.getElementById("paystack_curency").value;
            let tax = document.getElementById("tax").innerHTML;
            // alert(tax);

            let handler = PaystackPop.setup({
                key: key, // Replace with your public key
                email: document.getElementById("email-address").value,
                amount: document.getElementById("amount").value * 100 ,
                currency: currency,
                ref: '' + Math.floor((Math.random() * 1000000000) +
                    1
                ), // generates a pseudo-unique reference. Please replace with a reference you generated. Or remove the line entirely so our API will generate one for you
                // label: "Optional string that replaces customer email"
                onClose: function() {
                    alert('Window closed.');
                },
                callback: function(response) {
                    // let message = response;
                    // alert(message);
                    $.ajax({
                        url: '{{ route('checkout.paystack.payment') }}',
                        method: 'get',
                        data: {
                            referance: response.reference,
                            message: response,
                            amount: amount,
                            currency: currency,
                            tax: tax,
                        },
                        success: function(data) {
                            // the transaction status is in response.data.status
                            // alert(response);
                            console.log(data.status);
                            if (data.status == 'failed') {
                                toastr.error("Something went wrong! Please try again.")
                            }
                        },
                        complete: function(data) {
                            toastr.success("The product is purchased successfully.")
                            window.location = '{{ route('home') }}';
                        }
                    });
                }
            });

            handler.openIframe();
        }
    </script>
@endpush
