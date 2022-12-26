@extends('layouts.app')

@push('custom_css')
<link rel="stylesheet" href="https://cdn.bootcss.com/toastr.js/latest/css/toastr.min.css">
<style type="text/css">
.read-more-show,.read-more-hide{cursor:pointer;color: #00a651;font-weight: bold;}.hide_content{display: none;}
</style>
@endpush
@section('content')
<?php 
	$rows = $data['my_ads'] ?? null;
    $shop_info  = $data['shop_data'] ?? null ;
    $banner_path = asset('/uploads/shop/banner/'.$shop_info->customer_pk_no.'/'.$shop_info->banner);
?>

<!-- shop-product  -->
<div class="shop-product">
    <div class="container">
        <div class="shop-product-details pt-3 pb-4">
            <div class="shop-bx">
                @if($shop_info->name !=null)
                <img src="{{$banner_path}}" alt="">
                @else
                <img src="{{asset('assets/images/shop-default.jpg')}}" alt="">
                @endif
                <div class="prdut-name">
                    <h3>{{$shop_info->name}}</h3>
                </div>
            </div>
        </div>
        <div class="row mb-5 shop-description">
            <div class="col-lg-8">
                <div class="product-content pb-4">
                    <h2>{{$shop_info->name}}</h2>
                    @if(strlen($shop_info->description) > 500)
                    {{substr($shop_info->description,0,500)}}
                    <span class="read-more-show hide_content">More<i class="fa fa-angle-down"></i></span>
                    <span class="read-more-content"> {{substr($shop_info->description,500,strlen($shop_info->description))}} 
                    <span class="read-more-hide hide_content">Less <i class="fa fa-angle-up"></i></span> </span>
                    @else
                    {{$shop_info->description}}
                    @endif
                </div>
            </div>
            <div class="col-lg-4">
                <div class="info-contact">
                    <div class="info-list">
                        <div class="info-icon">
                            <i class="fa fa-shopping-cart"></i>
                        </div>
                        <div class="info-artile">
                            <p>{{$shop_info->open_time}}</p>
                        </div>
                    </div>
                    <div class="info-list">
                        <div class="info-icon">
                            <i class="fa fa-map-marker-alt"></i>
                        </div>
                        <div class="info-artile">
                            <p>{{$shop_info->address}}</p>
                        </div>
                    </div>
                    <div class="info-list">
                        <div class="info-icon">
                            <i class="fa fa-phone"></i>
                        </div>
                        <div class="info-artile">
                            <p>{{$shop_info->contact}}</p>
                        </div>
                    </div>
                    <div class="info-list">
                        <div class="info-icon">
                            <i class="fa fa-envelope"></i>
                        </div>
                        <div class="info-artile">
                            <p>{{ $shop_info->shopOwner->email ?? '' }}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="shop-gallery mb-3">
            <div class="product-show text-center">
                <h5>@lang('web.ads_list') {{$shop_info->name}}</h5>
            </div>
            <hr>
            <div class="row">
                <div class="product-show pb-1 col-12">
                <h5>@lang('web.shop_general')</h5>
              </div>
                <!-- featured -->
                @if($rows)
                @foreach($rows as $row)
                <div class="col-md-6 col-lg-3">
                    <!-- featured -->
                    <div class="featured">
                        <div class="featured-image">
                            <a href="{{ route('ad.details',['pk_no' => $row->pk_no,'url_slug' => $row->url_slug]) }}"><img src="{{asset('assets/images/default-load.png')}}"  data-src="{{asset($row->img_path_thumb) }}" alt="{{ $row->ad_title }}" class="img-fluid" ></a>
                            <a href="#" class="verified" data-toggle="tooltip" data-placement="top" title="Verified"><i class="fa fa-check-square-o"></i></a>
                        </div>
                        
                        <!-- ad-info -->
                        <div class="ad-info">
                            <h3 class="item-price">Rs {{number_format($row->price,2)}}</h3>
                            <h4 class="item-title"><a href="{{ route('ad.details',['pk_no' => $row->pk_no,'url_slug' => $row->url_slug]) }}">{{$row->ad_title}}</a></h4>
                            <div class="item-cat">
                                <span><a href="#">{{$row->main_category}}</a></span> 
                            </div>
                        </div><!-- ad-info -->
                        
                        <!-- ad-meta -->
                        <div class="ad-meta">
                            <div class="meta-content">
                                <span class="dated"><a href="#">{{ date('d M, Y H:i A',strtotime($row->created_at)) }}</a></span>
                            </div>                                  
                            <!-- item-info-right -->
                            <div class="user-option pull-right">
                                <a href="#" data-toggle="tooltip" data-placement="top" title="{{ $row->area->name ?? '' }}, {{ $row->area->city->name ?? '' }} {{ $row->area->division->name ?? '' }}"><i class="fa fa-map-marker-alt"></i> </a>
                                <a class="online" href="#" data-toggle="tooltip" data-placement="top" title="{{ $row->user->seller_type ?? '' }}"><i class="fa fa-user"></i> </a>                                              
                            </div><!-- item-info-right -->
                        </div><!-- ad-meta -->
                    </div><!-- featured -->
                </div><!-- featured -->
                @endforeach
                @endif
            </div>
        </div>
        <!-- pagination  -->
			<!-- <div class="text-center pb-5">
				<ul class="pagination ">
					<li><a href="#"><i class="fa fa-chevron-left"></i></a></li>
					<li><a href="#">1</a></li>
					<li class="active"><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a>...</a></li>
					<li><a href="#">10</a></li>
					<li><a href="#">20</a></li>
					<li><a href="#">30</a></li>
					<li><a href="#"><i class="fa fa-chevron-right"></i></a></li>
				</ul>
			</div> --><!-- pagination  -->	
		</div><!-- featureds -->
    </div>



@endsection

@push('custom_js')

<script src="https://cdn.bootcss.com/toastr.js/latest/js/toastr.min.js"></script>
{!! Toastr::message() !!}
<script type="text/javascript">
// Hide the extra content initially, using JS so that if JS is disabled, no problemo:
    $('.read-more-content').addClass('hide_content')
    $('.read-more-show, .read-more-hide').removeClass('hide_content')

    // Set up the toggle effect:
    $('.read-more-show').on('click', function(e) {
      $(this).next('.read-more-content').removeClass('hide_content');
      $(this).addClass('hide_content');
      e.preventDefault();
    });

    // Changes contributed by @diego-rzg
    $('.read-more-hide').on('click', function(e) {
      var p = $(this).parent('.read-more-content');
      p.addClass('hide_content');
      p.prev('.read-more-show').removeClass('hide_content'); // Hide only the preceding "Read More"
      e.preventDefault();
    });
</script>
<script src="{{asset('/assets/js/imagelazy.js')}}"></script>
    <script type="text/javascript">
    jQuery(function($) {
        $.imgLazy({ effect: 'fadeIn', viewport: true, timeout: 20 });
    });
</script>
@endpush
