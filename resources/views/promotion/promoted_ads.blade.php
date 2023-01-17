@extends('layouts.app')

@push('custom_css')
    <style type="text/css">
        .c-btn {
            color: #ee1d23;
            font-weight: bold;
            font-weight: 400;
            font-size: 14px;
            background: #b9e2e8;
            padding: 0px 10px;
        }

        .ad-info .item-price {
            margin-bottom: 8px;
        }

        .c-btn {
            color: #fff;
            font-weight: 400;
            font-size: 14px;
            background: #ee1d23;
            padding: 4px 10px;
            border-radius: 2px;
        }

        .c-btn:hover {
            color: #000;
        }
    </style>
@endpush

@section('content')

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
                    <div class="col-xl-9">
                        <div class="my-ads section">
                            <h2> @lang('web.promotedads')</h2>
                            @if (isset($data['promoted_ads']) && count($data['promoted_ads']) > 0)
                                @foreach ($data['promoted_ads'] as $key => $row)
                                    <div class="ad-item row">
                                        <div class="item-image-box col-lg-4">
                                            <div class="item-image">
                                                <a href="{{ route('ad.details', ['pk_no' => $row->pk_no, 'url_slug' => $row->url_slug]) }}"
                                                    title="{{ $row->ad_title }}"><img
                                                        src="{{ asset($row->img_path_thumb) }}" alt="Image"
                                                        class="img-fluid"></a>
                                            </div>
                                        </div>
                                        <div class="item-info col-lg-8">
                                            <div class="ad-info">
                                                <h3 class="item-price">₦ {{ number_format($row->price, 2) }} <a
                                                        href="javascript:void(0)"
                                                        class="pull-right c-btn">{{ $row->promotion }}</a></h3>
                                                <h4 class="item-title"><a
                                                        href="{{ route('ad.details', ['pk_no' => $row->pk_no, 'url_slug' => $row->url_slug]) }}"
                                                        title="{{ $row->ad_title }}">{{ $row->ad_title }}</a></h4>
                                                <div class="item-cat">
                                                    <span><a
                                                            href="javascript:void(0)">{{ $row->category->name ?? '' }}</a></span>
                                                    /
                                                    <span><a
                                                            href="javascript:void(0)">{{ $row->subcategory->name ?? '' }}</a>&nbsp;&nbsp;
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="ad-meta">
                                                <div class="meta-content">
                                                    <span
                                                        class="dated">{{ date('d M, Y H:i A', strtotime($row->created_at)) }}</span>
                                                    @php
                                                        $ss_packages = DB::table('ss_packages')
                                                            ->where('pk_no', Auth::user()->package_id)
                                                            ->first();
                                                    @endphp
                                                    {{-- @if ($ss_packages->analytics == 1)
											<span class="visitors">Visitors: {{ $row->total_view ?? '0' }}</span>
											<span class="visitors">Likes: {{ $row->total_like ?? '0' }}</span>
										    @endif --}}
                                                    @if ($row->useing_codition)
                                                        <a href="javascript:void(0)" class="tag"><i
                                                                class="fa fa-tags"></i> {{ $row->using_condition }}</a>
                                                    @endif
                                                </div>
                                                <div class="user-option pull-right">
                                                    <a href="#" class=".c-btn" data-toggle="tooltip"
                                                        data-placement="top"
                                                        title="{{ $row->area->name ?? '' }}, {{ $row->area->city->name ?? '' }} {{ $row->area->division->name ?? '' }}"><i
                                                            class="fa fa-map-marker-alt"></i> </a>
                                                    <a class="online" href="#" data-toggle="tooltip"
                                                        data-placement="top" title="{{ $row->user->seller_type ?? '' }}"><i
                                                            class="fa fa-user"></i> </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                @endforeach
                            @else
                                <div class="ad-item row">
                                    <div class="col-md-12">
                                        @lang('web.no_post')
                                    </div>
                                </div>
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>


@endsection

@push('custom_footer_script')
@endpush
