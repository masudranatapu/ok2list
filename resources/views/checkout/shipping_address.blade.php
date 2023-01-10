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
                                <a class="step" href="{{ route('checkout.billing') }}">
                                    <h4 class="step-title">2. Billing Address:</h4>
                                </a>

                                <a class="step" href="{{ route('checkout.payment') }}">
                                    <h4 class="step-title">3. Review and pay</h4>
                                </a>
                            </div>
                        </div>
                        <!-- shipping address form -->
                        <div class="shipping_form">
                            <div class="title mb-3">
                                <h3>Shipping Address</h3>
                                @if ($erroRs->any())
                                    <div class="alert alert-danger">
                                        <ul>
                                            @foreach ($erroRs->all() as $error)
                                                <li>{{ $error }}</li>
                                            @endforeach
                                        </ul>
                                    </div>
                                @endif
                            </div>
                            <form class="row" action="{{ route('checkout.shipping.store') }}" method="post">
                                @csrf
                                <div class="form-group col-md-6">
                                    <label for="fiRstname">FiRst Name</label>
                                    <input type="text" name="fiRstname" id="fiRstname" value="{{ old('fiRstname') ?? Session::get('shipping_address.fiRstname') }}"
                                        class="form-control" required>
                                    @error('fiRstname')
                                        <p class="text-danger">{{ $message }}</p>
                                    @enderror
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="lastname">Last Name</label>
                                    <input type="text" name="lastname" id="lastname" value="{{ old('lastname')?? Session::get('shipping_address.lastname') }}"
                                        class="form-control" required>
                                    @error('lastname')
                                        <p class="text-danger">{{ $message }}</p>
                                    @enderror
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="email">Email Address</label>
                                    <input type="text" name="email" id="email" value="{{ old('email') ?? Session::get('shipping_address.email') }}"
                                        class="form-control" required>
                                    @error('email')
                                        <p class="text-danger">{{ $message }}</p>
                                    @enderror
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="phone_number">Phone Number</label>
                                    <input type="text" name="phone_number" id="phone_number"
                                        value="{{ old('phone_number') ?? Session::get('shipping_address.phone_number') }}" class="form-control" required>
                                    @error('phone_number')
                                        <p class="text-danger">{{ $message }}</p>
                                    @enderror
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="address">Address</label>
                                    <input type="text" name="address" id="address" value="{{ old('address') ?? Session::get('shipping_address.address') }}"
                                        class="form-control" required>
                                    @error('address')
                                        <p class="text-danger">{{ $message }}</p>
                                    @enderror
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="apartment">Apartment (optional)</label>
                                    <input type="text" name="apartment" id="apartment" value="{{ old('apartment') ?? Session::get('shipping_address.apartment') }}"
                                        class="form-control">
                                    @error('apartment')
                                        <p class="text-danger">{{ $message }}</p>
                                    @enderror
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="city">City</label>
                                    <input type="text" name="city" id="city" value="{{ old('city') ?? Session::get('shipping_address.city') }}"
                                        class="form-control" required>
                                    @error('city')
                                        <p class="text-danger">{{ $message }}</p>
                                    @enderror
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="state">State</label>
                                    <input type="text" name="state" id="state" value="{{ old('state') ?? Session::get('shipping_address.state') }}"
                                        class="form-control" required>
                                    @error('state')
                                        <p class="text-danger">{{ $message }}</p>
                                    @enderror
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="zip_code">Zip Code</label>
                                    <input type="text" name="zip_code" id="zip_code" value="{{ old('zip_code') ?? Session::get('shipping_address.zip_code') }}"
                                        class="form-control" required>
                                    @error('zip_code')
                                        <p class="text-danger">{{ $message }}</p>
                                    @enderror
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="country">Country</label>
                                    <select name="country" id="country" class="form-control">
                                        <option value="" disabled="">Choose Country</option>
                                        @foreach ($countries as $item)
                                            <option value="{{ $item->name }}"
                                                {{ ($item->name == Session::get('shipping_address.country')) ? 'selected' : '' }}>{{ $item->name }}
                                            </option>
                                        @endforeach
                                    </select>
                                    @error('country')
                                        <p class="text-danger">{{ $message }}</p>
                                    @enderror
                                </div>
                                <div class="form-group col-12">
                                    <label for="order_note">Order notes</label>
                                    <textarea name="order_note" id="order_note" cols="30" rows="5" class="form-control">{{ old('order_note') ?? Session::get('shipping_address.order_note') }}</textarea>
                                    @error('order_note')
                                        <p class="text-danger">{{ $message }}</p>
                                    @enderror
                                </div>
                                <div class="form-group col-12">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="same_bill_address" value="1"
                                            id="shippingAddress">
                                        <label class="form-check-label" for="shippingAddress">
                                            Same as shipping address
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group col-12">
                                    <div class="form-check">
                                        <input class="form-check-input" name="trams_condition" type="checkbox"
                                            value="1" id="trams_condition">
                                        <label class="form-check-label" for="trams_condition">
                                            I agree to the <a href="#">Trams of Condition & Privacy Policy</a>.
                                        </label>
                                        @error('trams_condition')
                                            <p class="text-danger">{{ $message }}</p>
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group col-12">
                                    <div class="float-right">
                                        <button class="btn btn-primary">Continue</button>
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
