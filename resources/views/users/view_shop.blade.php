@extends('layouts.app')
@section('content')

<!-- myads-page -->
<section id="main" class="clearfix myads-page">
	<div class="container">

		<div class="breadcrumb-section">
			<!-- breadcrumb -->
			<ol class="breadcrumb">
				<li><a href="{{url('/')}}">@lang('web.home')</a></li>
				<li>@lang('web.c_shop')</li>
			</ol><!-- breadcrumb -->						
		</div><!-- banner -->
		<div class="ads-info profile">
			<div class="row">
				<div class="col-xl-3 text-center">
					<!-- header -->
					@include('useRs._user_dashboard_menu')
					<!-- end header -->
				</div>
				<!-- recommended-cta-->
				<div class="col-xl-9">
						<div class="my-ads section">
							<h3>Your Shop</h3>
							<hr>
							<div class="ad-item row mt-4 text-center">
								<div class="item-info col-12">
									<!-- ad-info -->
									<div class="ad-info" style="padding: 0px 25px;">
										<h3 class="item-price">You don't have any shop page yet !</h3>
										<p>
											Kindy hit the Create Your Shop button and create now. It's won't take more than 2 minutes !
										</p>									
									</div><!-- ad-info -->
								@if(DB::table('ss_shop')->where('created_by',Auth::user()->id)->count() >0)
									<a href="{{route('my-shop')}}" class="btn-primary btn">Let's go to your Shop</a> 
									<a href="{{route('modify-shop')}}" class="btn-primary btn">Update Your Shop</a>
									@else
									<a href="{{route('create-shop')}}" class="btn-primary btn">Create Your Shop</a>
									@endif
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