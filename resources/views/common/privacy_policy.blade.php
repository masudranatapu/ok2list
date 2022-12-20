@extends('layouts.app') @section('content')
  <section id="main" class="clearfix ad-details-page">
    <div class="container">
      <div class="breadcrumb-section">
        <ol class="breadcrumb">
          <li><a href="{{url('/')}}">Home</a></li>
          <li>@lang('web.privacy_policy')</li>
        </ol>
      </div>
      @if(isset($data['privacy_policy_page1']) && ($data['privacy_policy_page1']) != null )
        <div class="container">
            <div class="ads_banner text-center mb-4">
                <a href="{{ $data['privacy_policy_page1']->link }}" target="_blank" title="{{ $data['privacy_policy_page1']->name }}"><img src="{{ fileExit($data['privacy_policy_page1']->photo) }}" class="w-100" alt="{{ $data['privacy_policy_page1']->name }}" style="height: 96px;"></a>
            </div>
        </div>
      @endif
      <div class="adpost-details privacy-policy">
        <div class="row">
          <div class="col-lg-8">
            <div class="section postdetails terms_info">
              <h4>@lang('web.privacy_policy')</h4>
              <div id="page-content">
                @if($data['privacy'])
                  @if(app()->getLocale() == 'en')
                    <p>{!! $data['privacy']->details_en !!}</p>
                  @else
                    <p>{!! $data['privacy']->details_sl !!}</p>
                  @endif
								@endif
              </div>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="section quick-rules">
							<h4>@lang('web.quick_rules')</h4>
              @if($data['privacy'])
                @if(app()->getLocale() == 'en')
                  <p>{!! $data['privacy']->rules_en !!}</p>
                @else
                  <p>{!! $data['privacy']->rules_sl !!}</p>
                @endif
							@endif
            </div>
          </div>
        </div>
      </div>
      @if(isset($data['privacy_policy_page2']) && ($data['privacy_policy_page2']) != null )
        <div class="container">
            <div class="ads_banner text-center mb-4">
                <a href="{{ $data['privacy_policy_page2']->link }}" target="_blank" title="{{ $data['privacy_policy_page2']->name }}"><img src="{{ fileExit($data['privacy_policy_page2']->photo) }}" class="w-100" alt="{{ $data['privacy_policy_page2']->name }}" style="height: 96px;"></a>
            </div>
        </div>
      @endif
    </div>
  </section>
@endsection @push('custom_footer_script') @endpush