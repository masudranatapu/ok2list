@extends('layouts.app')
@section('content')

<!-- myads-page -->
<section id="main" class="clearfix myads-page">
	<div class="container">

		<div class="breadcrumb-section">
			<!-- breadcrumb -->
			<ol class="breadcrumb">
				<li><a href="{{url('/')}}">@lang('web.home')</a></li>
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
							<h3> @lang('web.membership')</h3>
							<hr>
							<div class="ad-item row mt-4 text-center">
								<div class="item-info col-12">
									<!-- ad-info -->
									<div class="ad-info" style="padding: 0px 25px;">
										<h3 class="item-price">@lang('web.no_member')</h3>
										<p>
											@lang('web.visite') <br> @lang('web.today')
										</p>									
									</div><!-- ad-info -->
									<a href="{{route('packages')}}" class="btn-primary btn">@lang('web.view')</a>
									<a href="{{route('get-membership')}}" class="btn-primary btn">@lang('web.why_mem')</a>
								</div><!-- item-info -->
							</div><!-- ad-item -->
						</div>
					</div><!-- my-ads -->
			</div><!-- row -->
		</div><!-- row -->
	</div><!-- container -->
</section><!-- myads-page -->


@endsection

@push('custom_footer_script')
   
@endpush