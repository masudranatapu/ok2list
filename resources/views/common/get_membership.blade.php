@extends('layouts.app')

@section('content')
	<section id="main" class="clearfix ad-details-page">
		<div class="container">
			<div class="breadcrumb-section">
				<ol class="breadcrumb">
					<li><a href="{{url('/')}}">Home</a></li>
					<li>@lang('web.membership')</li>
				</ol>
			</div>
			@if(isset($data['membership_page1']) && ($data['membership_page1']) != null )
				<div class="">
					<div class="ads_banner text-center mb-4">
						<a href="{{ $data['membership_page1']->link }}" target="_blank" title="{{ $data['membership_page1']->name }}"><img src="{{ fileExit($data['membership_page1']->photo) }}" class="w-100" alt="{{ $data['membership_page1']->name }}" style="height: 96px;"></a>
					</div>
				</div>
			@endif
			<div class="ads-info">
				<div class="row">
					<div class="col-md-8">
						<div class="my-ads section">
							<h4>@lang('web.membership')</h4>
							<div id="page-content">
								@if($data['membership'])
									@if(app()->getLocale() == 'en')
										<p>{!! $data['membership']->description !!}</p>
									@else
										<p>{!! $data['membership']->description_sl !!}</p>
									@endif
								@endif
							</div>
						</div>
					</div>
					<div class="col-md-4 text-center">
						<div class="recommended-cta">
							<div class="cta">
								<!-- single-cta -->
								<div class="single-cta">
									<!-- cta-icon -->
									<div class="cta-icon icon-secure">
										<img src="{{asset('assets/images/icon/13.png')}}" alt="Icon" class="img-fluid">
									</div><!-- cta-icon -->

									<h4>@lang('web.secure_trading')</h4>
									@if($data['sidebar'])
										@if(app()->getLocale() == 'en')
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
										<img src="{{asset('assets/images/icon/14.png')}}" alt="Icon" class="img-fluid">
									</div><!-- cta-icon -->

									<h4>@lang('web.support')</h4>
									@if($data['sidebar'])
										@if(app()->getLocale() == 'en')
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
										<img src="{{asset('assets/images/icon/15.png')}}" alt="Icon" class="img-fluid">
									</div><!-- cta-icon -->

									<h4>@lang('web.easy_trading')</h4>
									@if($data['sidebar'])
										@if(app()->getLocale() == 'en')
											<p>{!! $data['sidebar']->easy_trading_en !!}</p>
										@else
											<p>{!! $data['sidebar']->easy_trading_sl !!}</p>
										@endif
									@endif
								</div><!-- single-cta -->

								<!-- single-cta -->
								<div class="single-cta">
									<h4>@lang('web.need_help')</h4>
									<p>info@ok2list.com</p>
								</div><!-- single-cta -->
							</div>
						</div>
					</div>
				</div>
			</div>
			@if(isset($data['membership_page2']) && ($data['membership_page2']) != null )
			
					<div class="ads_banner text-center mb-4">
						<a href="{{ $data['membership_page2']->link }}" target="_blank" title="{{ $data['membership_page2']->name }}"><img src="{{ fileExit($data['membership_page2']->photo) }}" class="w-100" alt="{{ $data['membership_page2']->name }}" style="height: 96px;"></a>
					</div>
				
			@endif
		</div>
	</section>
@endsection

@push('custom_footer_script')

@endpush