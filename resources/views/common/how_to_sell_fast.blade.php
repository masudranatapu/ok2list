@extends('layouts.app')

@section('content')
    <section id="main" class="clearfix ad-details-page">
        <div class="container">
            <div class="breadcrumb-section">
                <ol class="breadcrumb">
                    <li><a href="{{ url('/') }}">Home</a></li>
                    <li>{{ __('how_to_sell_fast') }}</li>
                </ol>
            </div>
            <!-- @if (isset($data['how_to_sell_fast_page1']) && $data['how_to_sell_fast_page1'] != null)
    <div class="ads_banner text-center mb-4">
                                                      <a href="{{ $data['how_to_sell_fast_page1']->link }}" target="_blank" title="{{ $data['how_to_sell_fast_page1']->name }}"><img src="{{ fileExit($data['how_to_sell_fast_page1']->photo) }}" class="w-100" alt="{{ $data['how_to_sell_fast_page1']->name }}" style="height: 96px;"></a>
                                                     </div>
    @endif -->
            <div class="ads-info">
                <div class="row">
                    <div class="col-md-8">
                        <div class="my-ads section">
                            <h3 class="title">{{ __('how_to_sell_fast') }}</h3>
                            <section>
                                @if ($data['how_to_sell'])
                                    @if (app()->getLocale() == 'en')
                                        <p>{!! $data['how_to_sell']->description !!}</p>
                                    @else
                                        <p>{!! $data['how_to_sell']->description_sl !!}</p>
                                    @endif
                                @endif
                            </section>
                        </div>
                    </div>
                    <div class="col-md-4 text-center">
                        <!-- recommended-cta -->
                        <div class="recommended-cta">
                            <div class="cta">
                                <!-- single-cta -->
                                <div class="single-cta">
                                    <!-- cta-icon -->
                                    <div class="cta-icon icon-secure">
                                        <img src="{{ asset('assets/images/icon/13.png') }}" alt="Icon"
                                            class="img-fluid">
                                    </div><!-- cta-icon -->

                                    <h4>{{ __('secure_trading') }}</h4>
                                    @if ($data['sidebar'])
                                        @if (app()->getLocale() == 'en')
                                            <p>{!! $data['sidebar']->secure_trading_en !!}</p>
                                        @else
                                            <p>{!! $data['sidebar']->secure_trading_sl !!}</p>
                                        @endif
                                    @endif
                                </div><!-- single-cta -->
                                <!-- single-cta -->
                                <div class="single-cta">
                                    <!-- cta-icon -->
                                    <div class="cta-icon icon-support">
                                        <img src="{{ asset('assets/images/icon/14.png') }}" alt="Icon"
                                            class="img-fluid">
                                    </div><!-- cta-icon -->

                                    <h4>{{ __('support') }}</h4>
                                    @if ($data['sidebar'])
                                        @if (app()->getLocale() == 'en')
                                            <p>{!! $data['sidebar']->support_en !!}</p>
                                        @else
                                            <p>{!! $data['sidebar']->support_sl !!}</p>
                                        @endif
                                    @endif
                                </div><!-- single-cta -->


                                <!-- single-cta -->
                                <div class="single-cta">
                                    <!-- cta-icon -->
                                    <div class="cta-icon icon-trading">
                                        <img src="{{ asset('assets/images/icon/15.png') }}" alt="Icon"
                                            class="img-fluid">
                                    </div><!-- cta-icon -->

                                    <h4>{{ __('easy_trading') }}</h4>
                                    @if ($data['sidebar'])
                                        @if (app()->getLocale() == 'en')
                                            <p>{!! $data['sidebar']->easy_trading_en !!}</p>
                                        @else
                                            <p>{!! $data['sidebar']->easy_trading_sl !!}</p>
                                        @endif
                                    @endif
                                </div><!-- single-cta -->

                                <!-- single-cta -->
                                <div class="single-cta">
                                    <h4>{{ __('need_help') }}</h4>
                                    <p>info@listorbuy.org</p>
                                </div><!-- single-cta -->
                            </div>
                        </div><!-- cta -->
                    </div><!-- recommended-cta-->

                </div>
            </div>
            <!-- @if (isset($data['how_to_sell_fast_page2']) && $data['how_to_sell_fast_page2'] != null)
    <div class="ads_banner text-center mb-4">
                                                      <a href="{{ $data['how_to_sell_fast_page2']->link }}" target="_blank" title="{{ $data['how_to_sell_fast_page2']->name }}"><img src="{{ fileExit($data['how_to_sell_fast_page2']->photo) }}" class="w-100" alt="{{ $data['how_to_sell_fast_page2']->name }}" style="height: 96px;"></a>
                                                     </div>
    @endif -->
        </div>
    </section>
@endsection

@push('custom_footer_script')
@endpush
