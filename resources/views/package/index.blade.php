@extends('layouts.app')
@section('content')


	<!-- main -->
	<section id="main" class="clearfix contact-us">
		<div class="container">
			<ol class="breadcrumb">
				<li><a href="{{url('/')}}">Home</a></li>
				<li>Our Packages</li>
			</ol>						
			<div class="pricing-section">
				<div class="row">
					@if($data['rows'] && count($data['rows']) > 0 )
					@foreach($data['rows'] as $key => $row )
					<div class="col-md-4">
						<div class="pric">
							<h2>{{ $row->title }}</h2>
							<h3><sup>Rs</sup>{{ number_format($row->price_per_month)}}<span>/Per Month</span></h3>
							<div class="pric-menu">
								<ul>
									<li><i class="fa fa-check" aria-hidden="true"></i>{{ $row->ad_limit_in_montrh }} Ads Monthly</li>
									<li><i class="fa fa-check" aria-hidden="true"></i>{{ $row->support_duration }}</li>
									<li><i class="fa fa-check" aria-hidden="true"></i>{{ $row->discount_on_promotion }} Discount on Promotion</li>
									@if($row->sms_feature == 1)
										<li>
											<i class="fa fa-check" aria-hidden="true"></i>
											SMS Features
										</li>
									@else
										<li class="disiable_item">
											<i class="fa fa-times" aria-hidden="true"></i>
											SMS Features
										</li>
									@endif


									@if($row->email_feature == 1)
										<li>
											<i class="fa fa-check" aria-hidden="true"></i>
											Email Features
										</li>
									@else
										<li class="disiable_item">
											<i class="fa fa-times" aria-hidden="true"></i>
											Email Features
										</li>
									@endif

									@if($row->shop_page == 1)
										<li>
											<i class="fa fa-check" aria-hidden="true"></i>
											Shop Page
										</li>
									@else
										<li class="disiable_item">
											<i class="fa fa-times" aria-hidden="true"></i>
											Shop Page
										</li>
									@endif

									@if($row->analytics == 1)
										<li>
											<i class="fa fa-check" aria-hidden="true"></i>
											Product Analytics
										</li>
									@else
										<li class="disiable_item">
											<i class="fa fa-times" aria-hidden="true"></i>
											Product Analytics
										</li>
									@endif
								</ul>
								<a href="{{ route('payment.gateway',['price' => $row->price_per_month, 'pakid' => $row->pk_no  ]) }}" class="btn btn-primary">Buy Now</a>
								{{--@if($key == 0)
									<a href="{{ route('package.free',['price' => $row->price_per_month, 'pakid' => $row->pk_no  ]) }}" class="btn btn-warning">Trail Now</a>
								@else
									<a href="{{ route('payment.gateway',['price' => $row->price_per_month, 'pakid' => $row->pk_no  ]) }}" class="btn btn-primary">Buy Now</a>
								@endif--}}
							</div>
						</div>
					</div>
					@endforeach
					@endif
					

				</div><!-- row -->
			</div><!-- pricing section -->
		</div><!-- container -->
	</section><!-- main -->
@endsection

@push('custom_footer_script')
   
@endpush