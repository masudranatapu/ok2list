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

                                <a class="step" href="{{ route('checkout.payment') }}">
                                    <h4 class="step-title">3. Review and pay</h4>
                                </a>
                            </div>
                        </div>
                        <!-- Billing form -->
                        <div class="shipping_form">
                            <div class="title mb-3">
                                <h3>Billing Address</h3>
                            </div>
                            <form class="row" action="{{ route('checkout.billing.store') }}" method="post">
                                @csrf
                                <div class="form-group col-md-6">
                                    <label for="fi₦tname">Fi₦t Name</label>
                                    <input type="text" name="bill_fi₦t_name" id="fi₦tname"
                                        value="{{ old('bill_fi₦t_name') ?? Session::get('billing_address.bill_fi₦t_name') }}"
                                        class="form-control" required>
                                    @error('bill_fi₦t_name')
                                        <p class="text-danger">{{ $message }}</p>
                                    @enderror
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="lastname">Last Name</label>
                                    <input type="text" name="bill_last_name" id="lastname"
                                        value="{{ old('bill_last_name') ?? Session::get('billing_address.bill_last_name') }}"
                                        class="form-control" required>
                                    @error('bill_last_name')
                                        <p class="text-danger">{{ $message }}</p>
                                    @enderror
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="email">Email Address</label>
                                    <input type="text" name="bill_email" id="email"
                                        value="{{ old('bill_email') ?? Session::get('billing_address.bill_email') }}"
                                        class="form-control" required>
                                    @error('bill_email')
                                        <p class="text-danger">{{ $message }}</p>
                                    @enderror
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="phone_number">Phone Number</label>
                                    <input type="text" name="bill_phone_number" id="phone_number"
                                        value="{{ old('bill_phone_number') ?? Session::get('billing_address.bill_phone_number') }}"
                                        class="form-control" required>
                                    @error('bill_phone_number')
                                        <p class="text-danger">{{ $message }}</p>
                                    @enderror
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="address">Address</label>
                                    <input type="text" name="bill_address" id="address"
                                        value="{{ old('bill_address') ?? Session::get('billing_address.bill_address') }}"
                                        class="form-control" required>
                                    @error('bill_address')
                                        <p class="text-danger">{{ $message }}</p>
                                    @enderror
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="apartment">Apartment (optional)</label>
                                    <input type="text" name="bill_apartment" id="apartment"
                                        value="{{ old('bill_apartment') ?? Session::get('billing_address.bill_apartment') }}"
                                        class="form-control">
                                    @error('bill_apartment')
                                        <p class="text-danger">{{ $message }}</p>
                                    @enderror
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="city">City</label>
                                    <input type="text" name="bill_city" id="city"
                                        value="{{ old('bill_city') ?? Session::get('billing_address.bill_city') }}"
                                        class="form-control" required>
                                    @error('bill_city')
                                        <p class="text-danger">{{ $message }}</p>
                                    @enderror
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="state">State</label>
                                    <input type="text" name="bill_state" id="state"
                                        value="{{ old('bill_state') ?? Session::get('billing_address.bill_state') }}"
                                        class="form-control" required>
                                    @error('bill_state')
                                        <p class="text-danger">{{ $message }}</p>
                                    @enderror
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="zip_code">Zip Code</label>
                                    <input type="text" name="bill_zip_code" id="zip_code"
                                        value="{{ old('bill_zip_code') ?? Session::get('billing_address.bill_zip_code') }}"
                                        class="form-control" required>
                                    @error('bill_zip_code')
                                        <p class="text-danger">{{ $message }}</p>
                                    @enderror
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="country">Country</label>
                                    <select name="bill_country" id="country" class="form-control">
                                        <option value="" disabled="">Choose Country</option>
                                        @foreach ($countries as $item)
                                            <option value="{{ $item->name }}"
                                                {{ $item->name == Session::get('billing_address.bill_country') ? 'selected' : '' }}>
                                                {{ $item->name }}
                                            </option>
                                        @endforeach
                                    </select>
                                    @error('bill_country')
                                        <p class="text-danger">{{ $message }}</p>
                                    @enderror
                                </div>
                                <div class="form-group col-12">
                                    <div class="row align-items-center">
                                        <div class="col-6">
                                            <a href="{{ route('checkout.shipping') }}" class="text-danger mr-3"><i class="fa fa-angle-left"></i> Back to Shipping Address</a>
                                        </div>
                                        <div class="col-6">
                                            <div class="float-right">
                                                <button class="btn btn-primary">Continue</button>
                                             </div>
                                        </div>
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
