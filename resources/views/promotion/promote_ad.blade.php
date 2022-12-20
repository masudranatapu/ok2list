@extends('layouts.app')

<?php
$row = $data['row'];

?>
@section('content')
<!-- myads-page -->
<section id="main" class="clearfix myads-page">
	<div class="container">
		<div class="breadcrumb-section">
			<ol class="breadcrumb">
				<li><a href="{{url('/')}}">@lang('web.home')</a></li>
				<li>@lang('web.ad_post')</li>
			</ol>
		</div>

		<div class="ads-info profile">
			<div class="row">
				<div class="col-md-4 text-center">
					<!-- header -->
					@include('users._user_dashboard_menu')
					<!-- end header -->
				</div><!-- recommended-cta-->
				<div class="col-md-8">
					<div class="user-pro-section">
						<div class="profile-details section">
							<h2 style="padding: 0px; margin: 0px;">Promote your Ad </h2>
							<hr>
							<div class="removepromo">
								<div class="promote">
									<p><img src="{{asset('assets/images/promo.jpg')}}">Promote your ads to get more visibility.</p>

								</div>
							</div>
							<form action="javascript:void(0)" id="promotions">
								<div class="promo">
									<h4><img width="50" src="{{ $row->img_path_thumb }}" alt="Image" class="img-fluid"> {{ $row->ad_title }} </h4>
									<hr>
									<div class="accordion" id="accordionExample">
										@if(isset($data['promotions']) && count($data['promotions']) > 0 )
										@foreach($data['promotions'] as $k => $promo )
									  <div class="card">
									    <div class="card-header" id="headingOne">
									      <h2 class="mb-0 btn btn-block clktop">
									        <span data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">{{ $promo->name }} <br> <span class="promo-hints">{{ $promo->description }}</span></span>
									      </h2>
										  <input type="hidden" value="{{$promo->pk_no}}" name="promoId" id="promoId">
									    </div>
									    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
									      <div class="card-body">
									       <table class="promotable">
									       		@if(isset($promo->allPromotions) && count($promo->allPromotions) > 0 )
									       		@foreach($promo->allPromotions as $ck => $cprom)
												   @php
													     $price = $cprom->price;
														 $discount = ($price*Auth::user()->package->discount_on_promotion)/100;
														 $discounted = $price-$discount;
													  @endphp
											    <tr class="clktop7" for="cprom_{{ $cprom->pk_no }}">
											      <td scope="col">
											      	<input type="radio" name="promotion_id" value="{{ $cprom->pk_no }}" id="cprom_{{ $cprom->pk_no }}" data-price="{{ $discounted }}" {{ ($ck == 0 && $k == 0 ) ? 'checked' : '' }} >
											      </td>
											      <td scope="col">For {{ $cprom->day_limit }} Days</td>
											      <td scope="col" style="text-align:center">
													  Rs {{number_format($discounted,2)}}
													   <sub><del>Rs {{ number_format($cprom->price,2) }}</del></sub> {{Auth::user()->package->discount_on_promotion}}% discount</td>
											    </tr>
											    @endforeach
											    @endif

											</table>
									      </div>
									    </div>
									  </div>
									  @endforeach
									  @endif

									</div>
									<div class="totalprice">
										<div class="section agreement">
											<label for="send" style="width: 100%">
												<!-- <input type="checkbox" name="" class="checkbox-privacy"> -->
												<!-- <p class="terms-condition">I have read and agree to the website <a href="">Terms & Conditions, Return Refund Policy, Privacy Policy.</a></p> -->
											</label>
											@if(isset($data['day_diff_with_regi']) && ($data['day_diff_with_regi'] < 60 ))
											{{--<a href="{{ route('payment.free_promtion',['price' => 700, 'adid' => $row->pk_no, 'promid' => 1 ]) }}" class="btn btn-default" id="free_promtion" onclick="return confirm('Are you sure !')">Free for (60 days)</a>--}}
											@endif
											<a href="{{ route('promotion.payment.gateway',['price' => $discounted, 'adid' => $row->pk_no, 'promid' => 1 ]) }}" class="btn btn-danger float-right" id="pay_btn" onclick="return confirm('Are you sure !')" >Pay Now</a>
											{{-- <a href="{{ route('payment.create',['price' => $discounted, 'adid' => $row->pk_no, 'promid' => 1 ]) }}" class="btn btn-danger float-right" id="pay_btn" onclick="return confirm('Are you sure !')" >Pay Now</a> --}}
											<!-- <button type="submit" onclick="return confirm('coming...')" class="btn btn-danger float-right"></button> -->
										</div>
										<!-- section -->
									</div>
								</div>
							  </form>
							</div><!-- profile-details -->
						</div><!-- user-pro-edit -->
					</div><!-- profile -->
			</div><!-- row -->
		</div><!-- row -->
	</div><!-- container -->
</section><!-- myads-page -->


@endsection

@push('custom_js')
<script type="text/javascript">
	$(document).on('change', 'form#promotions input[type=radio]:checked', function(e){
		var element = $(this);
		var promotion_val = element.val();
		var promotion_price  = element.data('price');
		var new_url = $('#pay_btn').attr('href');
		var free_url = $('#free_promtion').attr('href');

	new_url = makeUrl(new_url, 'price' , promotion_price);
	new_url = makeUrl(new_url, 'promid' , promotion_val);
	$('#pay_btn').attr('href',new_url);

	free_url = makeUrl(free_url, 'price' , promotion_price);
	free_url = makeUrl(free_url, 'promid' , promotion_val);
	$('#free_promtion').attr('href',free_url);

	})

	function makeUrl(old_url,param,val)
	{
		var url 					= new URL(old_url);
		var search_params = url.searchParams;
		search_params.set(param, val);
		url.search 				= search_params.toString();
		return url.toString();
	}

</script>

@endpush
