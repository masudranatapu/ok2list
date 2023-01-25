@extends('layouts.app')

@section('content')
    <section id="main" class="clearfix ad-details-page promotion">
        <div class="container">
            <div class="breadcrumb-section">
                <ol class="breadcrumb">
                    <li><a href="{{ url('/') }}">Home</a></li>
                    <li>{{ __('promotions') }}</li>
                </ol>
            </div>
            <!-- @if (isset($data['promotions_page1']) && $data['promotions_page1'] != null)
    <div class="ads_banner text-center mb-4">
                                                  <a href="{{ $data['promotions_page1']->link }}" target="_blank" title="{{ $data['promotions_page1']->name }}"><img src="{{ fileExit($data['promotions_page1']->photo) }}" class="w-100" alt="{{ $data['promotions_page1']->name }}" style="height: 96px;"></a>
                                                 </div>
    @endif -->
            <div class="ads-info">
                <div class="row">
                    <div class="col-md-8">
                        <div class="my-ads section">
                            <div class="card-body form-layout item-detail post-ad-page">
                                <h4>{{ __('promotions') }}</h4>
                                <div id="page-content">
                                    @if ($data['promotions'])
                                        @if (app()->getLocale() == 'en')
                                            <p>{!! $data['promotions']->description !!}</p>
                                        @else
                                            <p>{!! $data['promotions']->description_sl !!}</p>
                                        @endif
                                    @endif
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 text-center">
                        <div class="recommended-cta">
                            <div class="cta">
                                <div class="single-cta">
                                    <div class="cta-icon icon-secure">
                                        <img src="{{ asset('assets/images/icon/13.png') }}" alt="Icon"
                                            class="img-fluid">
                                    </div>
                                    <h4>{{ __('secure_trading') }}</h4>
                                    @if ($data['sidebar'])
                                        @if (app()->getLocale() == 'en')
                                            <p>{!! $data['sidebar']->secure_trading_en !!}</p>
                                        @else
                                            <p>{!! $data['sidebar']->secure_trading_sl !!}</p>
                                        @endif
                                    @endif
                                </div>
                                <div class="single-cta">
                                    <div class="cta-icon icon-support">
                                        <img src="{{ asset('assets/images/icon/14.png') }}" alt="Icon"
                                            class="img-fluid">
                                    </div>
                                    <h4>{{ __('support') }}</h4>
                                    @if ($data['sidebar'])
                                        @if (app()->getLocale() == 'en')
                                            <p>{!! $data['sidebar']->support_en !!}</p>
                                        @else
                                            <p>{!! $data['sidebar']->support_sl !!}</p>
                                        @endif
                                    @endif
                                </div>
                                <div class="single-cta">
                                    <div class="cta-icon icon-trading">
                                        <img src="{{ asset('assets/images/icon/15.png') }}" alt="Icon"
                                            class="img-fluid">
                                    </div>
                                    <h4>{{ __('easy_trading') }}</h4>
                                    @if ($data['sidebar'])
                                        @if (app()->getLocale() == 'en')
                                            <p>{!! $data['sidebar']->easy_trading_en !!}</p>
                                        @else
                                            <p>{!! $data['sidebar']->easy_trading_sl !!}</p>
                                        @endif
                                    @endif
                                </div>
                                <div class="single-cta">
                                    <h4>{{ __('need_help') }}</h4>
                                    <p>info@listorbuy.org</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- @if (isset($data['promotions_page2']) && $data['promotions_page2'] != null)
    <div class="ads_banner text-center mb-4">
                                                  <a href="{{ $data['promotions_page2']->link }}" target="_blank" title="{{ $data['promotions_page2']->name }}"><img src="{{ fileExit($data['promotions_page2']->photo) }}" class="w-100" alt="{{ $data['promotions_page2']->name }}" style="height: 96px;"></a>
                                                 </div>
    @endif -->
        </div>
    </section>
@endsection

@push('custom_footer_script')
@endpush
