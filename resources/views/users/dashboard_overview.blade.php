@extends('layouts.app')

@push('custom_css')
    <link rel="stylesheet" href="https://cdn.bootcss.com/toastr.js/latest/css/toastr.min.css">
    <style type="text/css">
        .c-btn {
            color: #fff;
            font-weight: 400;
            font-size: 14px;
            background: #ee1d23;
            padding: 0px 10px;
            border-radius: 4px;
        }

        .c-btn:hover {
            color: #000;
        }

        .ad-info .item-price {
            display: inline-block;
            margin-bottom: 8px;
        }

        .promote {
            text-align: left;
        }
    </style>
@endpush

@section('content')
    <section id="main" class="clearfix myads-page">
        <div class="container">
            <div class="breadcrumb-section">
                <ol class="breadcrumb">
                    <li><a href="{{ url('/') }}">@lang('web.home')</a></li>
                    <li>@lang('web.ad_post')</li>
                </ol>
            </div>
            <div class="ads-info profile">
                <div class="row g-3">
                    <div class="col-xl-3 text-center">
                        @include('use₦._user_dashboard_menu')
                    </div>
                    <div class="col-xl-9">
                        <div class="my-ads section">
                            <h2>@lang('web.overview')</h2>
                            <div class="row">
                                <div class="col-md-6 col-lg-4">
                                    <div class="dashboard_wrap mb-4">
                                        <div class="media position-relative">
                                            <div class="content">
                                                <h2>{{ $postedads->count() }}</h2>
                                                <h6>@lang('web.posted_ads')</h6>
                                            </div>
                                            <div class="media-body">
                                                <span class="icon">
                                                    <svg width="40" height="40" viewBox="0 0 40 40" fill="none"
                                                        xmlns="http://www.w3.org/2000/svg">
                                                        <path d="M15 23.75H25" stroke="#3db83a" stroke-width="2.5"
                                                            stroke-linecap="round" stroke-linejoin="round"></path>
                                                        <path d="M15 18.75H25" stroke="#3db83a" stroke-width="2.5"
                                                            stroke-linecap="round" stroke-linejoin="round"></path>
                                                        <path
                                                            d="M25.0003 6.25H31.25C31.5815 6.25 31.8995 6.3817 32.1339 6.61612C32.3683 6.85054 32.5 7.16848 32.5 7.5V33.75C32.5 34.0815 32.3683 34.3995 32.1339 34.6339C31.8995 34.8683 31.5815 35 31.25 35H8.75C8.41848 35 8.10054 34.8683 7.86612 34.6339C7.6317 34.3995 7.5 34.0815 7.5 33.75V7.5C7.5 7.16848 7.6317 6.85054 7.86612 6.61612C8.10054 6.3817 8.41848 6.25 8.75 6.25H14.9997"
                                                            stroke="#3db83a" stroke-width="2.5" stroke-linecap="round"
                                                            stroke-linejoin="round"></path>
                                                        <path
                                                            d="M13.75 11.25V10C13.75 8.3424 14.4085 6.75269 15.5806 5.58058C16.7527 4.40848 18.3424 3.75 20 3.75C21.6576 3.75 23.2473 4.40848 24.4194 5.58058C25.5915 6.75269 26.25 8.3424 26.25 10V11.25H13.75Z"
                                                            stroke="#3db83a" stroke-width="2.5" stroke-linecap="round"
                                                            stroke-linejoin="round"></path>
                                                    </svg>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-lg-4">
                                    <div class="dashboard_wrap mb-4" style="background: #e4f9e0 !important;">
                                        <div class="media position-relative">
                                            <div class="content">
                                                <h2>{{ count($data['rows']) }}</h2>
                                                <h6>@lang('web.favorites')</h6>
                                            </div>
                                            <div class="media-body">
                                                <span class="icon">
                                                    <svg width="40" height="40" viewBox="0 0 40 40" fill="none"
                                                        xmlns="http://www.w3.org/2000/svg">
                                                        <path d="M5 20H11.25L13.75 16.25L18.75 23.75L21.25 20H25"
                                                            stroke="#27C200" stroke-width="2.5" stroke-linecap="round"
                                                            stroke-linejoin="round"></path>
                                                        <path
                                                            d="M4.39285 14.999C4.38103 14.7918 4.37508 14.5838 4.375 14.375C4.37532 12.4971 5.02602 10.6773 6.21648 9.22488C7.40693 7.77251 9.06366 6.77727 10.905 6.40836C12.7463 6.03945 14.6586 6.31965 16.3166 7.20131C17.9747 8.08298 19.2763 9.51169 20 11.2445L20 11.2446C20.7237 9.5117 22.0253 8.08299 23.6833 7.20132C25.3414 6.31965 27.2537 6.03945 29.095 6.40836C30.9363 6.77727 32.5931 7.77251 33.7835 9.22488C34.974 10.6772 35.6247 12.4971 35.625 14.375C35.625 25 20 33.75 20 33.75C20 33.75 13.7586 30.2549 9.16523 25.0002"
                                                            stroke="#27C200" stroke-width="2.5" stroke-linecap="round"
                                                            stroke-linejoin="round"></path>
                                                    </svg>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-lg-4">
                                    <div class="dashboard_wrap mb-4" style="background: #ffe5e5 !important;">
                                        <div class="media position-relative">
                                            <div class="content">
                                                <h2>{{ $expireads->count() }}</h2>
                                                <h6>@lang('web.Expire_Ads')</h6>
                                            </div>
                                            <div class="media-body">
                                                <span class="icon">
                                                    <svg width="40" height="40" viewBox="0 0 40 40" fill="none"
                                                        xmlns="http://www.w3.org/2000/svg">
                                                        <path
                                                            d="M35 27.7068V12.2939C35 12.0721 34.941 11.8543 34.829 11.6629C34.717 11.4714 34.5561 11.3132 34.3628 11.2045L20.6128 3.4701C20.4257 3.36486 20.2147 3.30957 20 3.30957C19.7853 3.30957 19.5743 3.36486 19.3872 3.4701L5.63717 11.2045C5.44386 11.3132 5.28296 11.4714 5.17099 11.6629C5.05902 11.8543 5 12.0721 5 12.2939V27.7068C5 27.9286 5.05902 28.1464 5.17099 28.3379C5.28296 28.5293 5.44386 28.6876 5.63717 28.7963L19.3872 36.5307C19.5743 36.6359 19.7853 36.6912 20 36.6912C20.2147 36.6912 20.4257 36.6359 20.6128 36.5307L34.3628 28.7963C34.5561 28.6876 34.717 28.5293 34.829 28.3379C34.941 28.1464 35 27.9286 35 27.7068Z"
                                                            stroke="#FF4F4F" stroke-width="2.5" stroke-linecap="round"
                                                            stroke-linejoin="round"></path>
                                                        <path d="M27.6597 23.8298V15.7048L12.5 7.34375" stroke="#FF4F4F"
                                                            stroke-width="2.5" stroke-linecap="round"
                                                            stroke-linejoin="round"></path>
                                                        <path d="M34.8279 11.6607L20.1485 20.0003L5.17334 11.6592"
                                                            stroke="#FF4F4F" stroke-width="2.5" stroke-linecap="round"
                                                            stroke-linejoin="round"></path>
                                                        <path d="M20.1481 20L20.0015 36.6908" stroke="#FF4F4F"
                                                            stroke-width="2.5" stroke-linecap="round"
                                                            stroke-linejoin="round"></path>
                                                    </svg>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="mb-3 plan_title">
                                        <p>@lang('web.panl_benifits')</p>
                                    </div>
                                </div>
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

                                            @php
                                                $package = App\Payments::where('f_customer_pk_no', Auth::user()->id)
                                                    ->orderBy('pk_no', 'desc')
                                                    ->fi₦t();
                                            @endphp
                                            <div class="content">
                                                <h3> {{ date('d F, Y', strtotime($package->expired_on)) }}</h3>
                                                <h6>@lang('web.Package_End_Date')</h6>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection

@push('custom_js')
    <script src="https://cdn.bootcss.com/toastr.js/latest/js/toastr.min.js"></script>
    {!! Toastr::message() !!}
@endpush
