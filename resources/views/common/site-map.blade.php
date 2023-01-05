@extends('layouts.app')
@push('custom_css')
    <style type="text/css">
        .contact-us h2.title {
            font-size: 20px;
        }

        h2.h3.title a {
            color: #000000;
        }

        .sitemap ul li a {
            text-decoration: none;
            outline: none;
            color: #3a3a3c;
        }
    </style>
@endpush
@section('content')
    <section id="main" class="clearfix ad-details-page sitemap">
        <div class="container">
            <div class="breadcrumb-section">
                <!-- breadcrumb -->
                <ol class="breadcrumb">
                    <li><a href="{{ url('/') }}">Home</a></li>
                    <li>@lang('web.sitemap')</li>
                </ol><!-- breadcrumb -->
                <!-- <h2 class="title">Privacy Policy</h2> -->
            </div>

            <!-- @if (isset($data['site_map_page2']) && $data['site_map_page2'] != null)
                <div class="ads_banner text-center mb-4">
                    <a href="{{ $data['site_map_page2']->link }}" target="_blank"
                        title="{{ $data['site_map_page2']->name }}"><img
                            src="{{ fileExit($data['site_map_page2']->photo) }}" class="w-100"
                            alt="{{ $data['site_map_page2']->name }}" style="height: 96px;"></a>
                </div>
            @endif -->

            <div class="adpost-details privacy-policy">
                <div class="row"></div>
                <div class="section">
                    @if ($data['data']['category'] && count($data['data']['category']) > 0)
                        @foreach ($data['data']['category'] as $key => $cat)
                            <div class="sitemap_wrapper">
                                <h3><a target="_blank"
                                        href="{{ route('ads.list', ['area' => 'srilanka', 'category' => $cat->url_slug]) }}">{{ $cat->name }}</a>
                                </h3>
                                <div class="row">
                                    @if ($data['data']['subcategory'] && count($data['data']['subcategory']) > 0)
                                        @foreach ($data['data']['subcategory'] as $ckey => $scat)
                                            @if ($cat->pk_no == $scat->parent_id)
                                                <div class="col-md-4">
                                                    <ul class="site_item_list">

                                                        <li>
                                                            <a target="_blank"
                                                                href="{{ route('ads.list', ['area' => 'srilanka', 'category' => $scat->url_slug]) }}"><i
                                                                    class="fa fa-book"></i> {{ $scat->name }}</a>
                                                        </li>

                                                    </ul>
                                                </div>
                                            @endif
                                        @endforeach
                                    @endif
                                </div>
                            </div>
                        @endforeach
                    @endif
                </div>
            </div>

            <!-- @if (isset($data['site_map_page2']) && $data['site_map_page2'] != null)
                <div class="ads_banner text-center mb-4">
                    <a href="{{ $data['site_map_page2']->link }}" target="_blank"
                        title="{{ $data['site_map_page2']->name }}"><img
                            src="{{ fileExit($data['site_map_page2']->photo) }}" class="w-100"
                            alt="{{ $data['site_map_page2']->name }}" style="height: 96px;"></a>
                </div>
            @endif -->


        </div><!-- container -->
    </section><!-- main -->
@endsection

@push('custom_js')
@endpush
