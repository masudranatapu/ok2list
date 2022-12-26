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
							<h3>
								Plan Benefits
								<a href="#" class="btn-sm btn-primary float-right">Upgrade Plan</a>
							</h3>
							<hr>
							<div class="row mt-4 text-center">
								<div class="col-md-4">
									<div class="dashboard_wrap mb-4" style="background: #28a745 !important;">
									   <div class="content">
										   <h2 class="text-white">100</h2>
										   <h6 class="text-white">Ads Remaining</h6>
									   </div>
									</div>
								</div>
								<div class="col-md-4">
									<div class="dashboard_wrap mb-4" style="background: #007bff !important;">
									   <div class="content">
										   <h2 class="text-white">100</h2>
										   <h6 class="text-white">Featured Ads Remaining</h6>
									   </div>
									</div>
								</div>				
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