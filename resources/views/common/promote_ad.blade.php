@extends('layouts.app')
@section('content')
    <section id="main" class="clearfix ad-details-page">
        <div class="container">
            <div class="breadcrumb-section">
                <ol class="breadcrumb">
                    <li><a href="{{ url('/') }}">Home</a></li>
                    <li>{{ __('promote_ad') }}</li>
                </ol>
            </div>
            <!-- 	@if (isset($data['promote_your_ad_page1']) && $data['promote_your_ad_page1'] != null)
    <div class="container">
                                <div class="ads_banner text-center mb-4">
                                 <a href="{{ $data['promote_your_ad_page1']->link }}" target="_blank" title="{{ $data['promote_your_ad_page1']->name }}"><img src="{{ fileExit($data['promote_your_ad_page1']->photo) }}" class="w-100" alt="{{ $data['promote_your_ad_page1']->name }}" style="height: 96px;"></a>
                                </div>
                               </div>
    @endif -->
            <div class="adpost-details privacy-policy">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="section postdetails terms_info">
                            <h4>{{ __('promote_your_ad') }}</h4>
                            <div id="page-content" class="terms_info">
                                @if ($data['promote'])
                                    @if (app()->getLocale() == 'en')
                                        <p>{!! $data['promote']->description !!}</p>
                                    @else
                                        <p>{!! $data['promote']->description_sl !!}</p>
                                    @endif
                                @endif
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="section quick-rules">
                            <h4>{{ __('quick_rules') }}</h4>
                            <p class="lead">Posting an ad on <a href="#">listorbuy.org</a> is free! However, all ads
                                must follow our rules:</p>
                            <ul>
                                <li>Make sure you post in the correct category.</li>
                                <li>Do not post the same ad more than once or repost an ad within 48 hours.</li>
                                <li>Do not upload pictures with watermarks.</li>
                                <li>Do not post ads containing multiple items unless it's a package deal.</li>
                                <li>Do not put your email or phone numbers in the title or description.</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- @if (isset($data['promote_your_ad_page2']) && $data['promote_your_ad_page2'] != null)
    <div class="ads_banner text-center mb-4">
                                  <a href="{{ $data['promote_your_ad_page2']->link }}" target="_blank" title="{{ $data['promote_your_ad_page2']->name }}"><img src="{{ fileExit($data['promote_your_ad_page2']->photo) }}" class="w-100" alt="{{ $data['promote_your_ad_page2']->name }}" style="height: 96px;"></a>
                                 </div>
    @endif -->
        </div>
    </section>
@endsection

@push('custom_footer_script')
@endpush
