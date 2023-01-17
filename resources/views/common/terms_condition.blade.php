@extends('layouts.app')
@section('content')
    <!-- main -->
    <section id="main" class="clearfix ad-details-page">
        <div class="container">
            <div class="breadcrumb-section">
                <!-- breadcrumb -->
                <ol class="breadcrumb">
                    <li><a href="{{ url('/') }}">Home</a></li>
                    <li>{{ __('t_conditions') }}</li>
                </ol>
            </div>
            <!-- @if (isset($data['tc_page1']) && $data['tc_page1'] != null)
    <div class="ads_banner text-center mb-4">
                                     <a href="{{ $data['tc_page1']->link }}" target="_blank" title="{{ $data['tc_page1']->name }}"><img src="{{ fileExit($data['tc_page1']->photo) }}" class="w-100" alt="{{ $data['tc_page1']->name }}" style="height: 96px;"></a>
                                    </div>
    @endif -->
            <div class="adpost-details">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="section postdetails terms_info">
                            <h4>{{ __('t_conditions') }}</h4>
                            <div id="page-content">
                                @if ($data['terms'])
                                    @if (app()->getLocale() == 'en')
                                        <p>{!! $data['terms']->details_en !!}</p>
                                    @else
                                        <p>{!! $data['terms']->details_sl !!}</p>
                                    @endif
                                @endif
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="section quick-rules">
                            <h4>{{ __('quick_rules') }}</h4>
                            @if ($data['terms'])
                                @if (app()->getLocale() == 'en')
                                    <p>{!! $data['terms']->rules_en !!}</p>
                                @else
                                    <p>{!! $data['terms']->rules_sl !!}</p>
                                @endif
                            @endif
                        </div>
                    </div>
                </div>
            </div>
            <!-- @if (isset($data['tc_page2']) && $data['tc_page2'] != null)
    <div class="ads_banner text-center mb-4">
                                      <a href="{{ $data['tc_page2']->link }}" target="_blank" title="{{ $data['tc_page2']->name }}"><img src="{{ fileExit($data['tc_page2']->photo) }}" class="w-100" alt="{{ $data['tc_page2']->name }}" style="height: 96px;"></a>
                                     </div>
    @endif -->
        </div>
    </section>
@endsection
@push('custom_footer_script')
@endpush
