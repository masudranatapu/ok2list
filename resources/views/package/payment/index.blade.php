@extends('layouts.app')
@section('content')
<!-- main -->


@php
    $ss_packages = DB::table('ss_packages')->where('pk_no', request()->get('promid'))->first();
@endphp

<section id="main" class="clearfix contact-us">
    <div class="container">
        <div class="breadcrumb-section">
            <!-- breadcrumb -->
            <ol class="breadcrumb">
                <li><a href="{{url('/')}}">Home</a></li>
                <li>Payment Gateway</li>
            </ol>
        </div>
        <div class="ads-info payment_gateway_sec">
            <div class="row">
                <div class="col-lg-4">
                    <div class="card section mb-4">
                        <div class="card-body">
                            <h3 class="card-title">@lang('web.urp')</h3>
                            <div class="card-table table-responsive">
                                <table class="table table-vcenter">
                                    <thead>
                                        <tr>
                                            <th class="w-1">@lang('web.des')</th>
                                            <th class="w-1">@lang('web.price')</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <div>
                                                    {{$ss_packages->title ?? ''}} 
                                                </div>
                                            </td>
                                            <td class="text-bold">
                                                Rs. {{request()->get('price')}}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="h3"> @lang('web.t_pay') </td>
                                            <td class="h3"> 
                                                Rs. {{request()->get('price')}}
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="card section bank_info mb-4">
                        <div class="card-body">
                            <h3 class="card-title">@lang('web.bang_info')</h3>
                            <div class="card-table">
                                <p><strong> @lang('web.bank_name') :</strong> Commercial Bank</p>
                                <p><strong> @lang('web.acc') :</strong> THE Q S WEEK PVT LTD</p>
                                <p><strong> @lang('web.acc_num')  :</strong> 1000114100</p>
                                <p><strong> @lang('web.acc_type') :</strong> Current Account</p>
                                <p><strong> @lang('web.branch') :</strong> Mawanella</p>
                                <p><strong> @lang('web.currency') :</strong> Srilankan Rupees (SLRS)</p>
                                <p><strong> @lang('web.s_c') :</strong> CCEYLKLX</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8">
                    <form action="{{route('payment.create')}}" method="post">
                        @csrf
                        <div class="card section">
                            <div class="card-body">
                                <h3 class="card-title">@lang('web.b_d')</h3>
                                    <div class="row">
                                        <div class="form-group col-md-6">
                                            <label class="form-label">Name <span class="text-danger">*</span></label>
                                            <input type="text" name="name" id="name" class="form-control" placeholder="Enter Name" required>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label class="form-label">Email <span class="text-danger">*</span></label>
                                            <input type="text" name="email" id="email" class="form-control" placeholder="Enter Email Address" required>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label class="form-label">Phone <span class="text-danger">*</span></label>
                                            <input type="number" name="phone" id="phone" class="form-control" placeholder="Enter Phone" required>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label class="form-label">Billing City <span class="text-danger">*</span></label>
                                            <input type="text" name="billing_city" id="billing_city" class="form-control" placeholder="Billing City" required>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label class="form-label">Billing State/Provice <span class="text-danger">*</span></label>
                                            <input type="text" name="billing_state" id="billing_state" class="form-control" placeholder="Billing State/Province" required>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label class="form-label">Billing Zip Code <span class="text-danger">*</span></label>
                                            <input type="text" name="zip_code" id="zip_code" class="form-control" placeholder="Zip Code" required>
                                        </div>
                                        <div class="form-group col-12">
                                            <label class="form-label">Billing Address <span class="text-danger">*</span></label>
                                            <textarea name="address" id="address" cols="30" rows="3" class="form-control" required placeholder="Enter your address"></textarea>
                                        </div>
                                    </div>
                            </div>
                        </div>
                        <div class="card section">
                            <div class="card-body">
                                <h3 class="card-title">@lang('web.p_m')</h3>
                                 <div class="form-check">
                                  <input class="form-check-input" type="radio" name="payment_type" id="payment_type" value="offline_payment" checked>
                                  <label class="form-check-label" for="payment_type">
                                      <img src="{{asset('assets/images/offline.png')}}" width="80" alt="">
                                       Pay with Bank
                                  </label>
                                </div>
                                <div class="payment_btn mt-4">
                                    <button type="submit" class="btn btn-warning">Submit</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                </div><!-- row -->
            </div>



            <div class="pricing-section">
                <div class="row">
                    {{-- <form action="{{route('payment.create')}}" method="get">
                        <label>
                            <div class="col-md-4">
                                <button type="submit" class="btn">
                                <div class="pric" style="text-align: center;">
                                    <h2 style="padding: 16px">SSLCommerze</h2>
                                    <input type="hidden" value="ssl_commerze" name="payment_gateway">
                                    <img src="{{asset('assets/images/sslcommerz.png')}}" width="120px" alt="">
                                </div>
                                </button>
                            </div>
                        </label>
                    </form> --}}
                    {{-- <form action="{{route('payment.create')}}" method="get">
                        <label>
                            <div class="col-md-4">
                                <button type="submit" class="btn">
                                <div class="pric" style="text-align: center;">
                                    <h2 style="padding: 16px">Stripe</h2>
                                    <input type="hidden" value="stripe" name="payment_gateway">
                                    <img src="{{asset('assets/images/stripe.png')}}" width="120px" alt="">
                                </div>
                                </button>
                            </div>
                        </label>
                    </form>
                    <form action="{{route('payment.create')}}" method="get">
                        <label>
                            <div class="col-md-4">
                                <button type="submit" class="btn">
                                <div class="pric" style="text-align: center; height: 151px;">
                                    <h2 style="padding: 16px">Paypal</h2>
                                    <input type="hidden" value="paypal" name="payment_gateway">
                                    <img src="{{asset('assets/images/PayPal.png')}}" width="120px" alt="">
                                </div>
                                </button>
                            </div>
                        </label>
                    </form> --}}
                    {{--
                    <form action="{{route('payment.create')}}" method="get">
                        <label>
                            <div class="col-md-4">
                                <button type="submit" class="btn">
                                <div class="pric" style="text-align: center; height: 151px;">
                                    <h2 style="padding: 9px">Offline Payment</h2>
                                    <input type="hidden" value="offline_payment" name="payment_gateway">
                                    <img src="{{asset('assets/images/offline.png')}}" width="120px" alt="">
                                </div>
                                </button>
                            </div>
                        </label>
                    </form>
                    --}}
                    </div><!-- row -->
                    </div><!-- pricing section -->
                    </div><!-- container -->
                    </section><!-- main -->
@endsection
@push('custom_footer_script')
@endpush