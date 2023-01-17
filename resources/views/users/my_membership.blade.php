@extends('layouts.app')
@section('content')
    @php
        $package = App\Payments::where('f_customer_pk_no', Auth::user()->id)
            ->orderBy('pk_no', 'desc')
            ->first();
    @endphp
    <!-- myads-page -->
    <section id="main" class="clearfix myads-page">
        <div class="container">

            <div class="breadcrumb-section">
                <!-- breadcrumb -->
                <ol class="breadcrumb">
                    <li><a href="{{ url('/') }}">@lang('web.home')</a></li>
                    <li>@lang('web.ad_post')</li>
                </ol><!-- breadcrumb -->
            </div><!-- banner -->
            <div class="ads-info profile">
                <div class="row">
                    <div class="col-xl-3 text-center">
                        <!-- header -->
                        @include('users._user_dashboard_menu')
                        <!-- end header -->
                    </div>
                    <!-- recommended-cta-->
                    <div class="col-xl-9">
                        <div class="my-ads section">
                            <h3>
                                Plan Benefits
                                <a href="{{ route('packages') }}" class="btn-sm btn-site float-right" style="">Upgrade Plan</a>
                            </h3>
                            <hr>
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="col-md-6 col-lg-4">
                                        <div class="dashboard_wrap mb-4" style="background: #e4f9e0 !important;">
                                            <div class="media position-relative">
                                                <div class="content">
                                                    <h2>
                                                        {{ $package->add_limit }}
                                                    </h2>
                                                    <h6>@lang('web.total_ads')</h6>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-lg-4">
                                        <div class="dashboard_wrap mb-4" style="background: #ffe5e5 !important;">
                                            <div class="media position-relative">
                                                <div class="content">
                                                    <h2>
                                                        {{ $package->add_limit - $totalads->count() }}
                                                    </h2>
                                                    <h6>@lang('web.rem_ads')</h6>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-lg-4">
                                        <div class="dashboard_wrap mb-4" style="background: #e8f7ff !important;">
                                            <div class="media position-relative">


                                                <div class="content">
                                                    <h3> {{ date('d F, Y', strtotime($package->expired_on)) }}</h3>
                                                    <h6>@lang('web.Package_End_Date')</h6>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            {{-- <div class="row mt-4 text-center">
                                <div class="col-md-4">
                                    <div class="dashboard_wrap mb-4" style="background: #28a745 !important;">
                                        <div class="content">
                                            <h2 class="text-white">100</h2>
                                            <h6 class="text-white">Ads Remaining</h6>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="dashboard_wrap mb-4" style="background: #007bff !important;">
                                        <div class="content">
                                            <h2 class="text-white">100</h2>
                                            <h6 class="text-white">Featured Ads Remaining</h6>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- ad-item --> --}}
                        </div>
                    </div><!-- my-ads -->
                </div><!-- row -->
            </div><!-- row -->
        </div><!-- container -->
    </section><!-- myads-page -->
@endsection

@push('custom_footer_script')
@endpush
