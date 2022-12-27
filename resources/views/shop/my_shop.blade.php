@extends('layouts.app')

@push('custom_css')
<link rel="stylesheet" href="https://cdn.bootcss.com/toastr.js/latest/css/toastr.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">

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
            <div class="seller_profile product-show text-center">
                <h5 class="mb-3">@lang('web.ads_list') <span class="text-primary">{{$shop_info->name}}</span></h5>
                <ul class="nav nav-pills" id="pills-tab" role="tablist">
                  <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="pills-home-tab" data-toggle="pill" data-target="#pills-home" type="button" role="tab" aria-controls="pills-home" aria-selected="true">Recent Ads</button>
                  </li>
                  <li class="nav-item" role="presentation">
                        <button class="nav-link" id="pills-profile-tab" data-toggle="pill" data-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile" aria-selected="false">Seller Review</button>
                  </li>
                  <li class="nav-item" role="presentation">
                        <button class="nav-link" id="pills-review-tab" data-toggle="pill" data-target="#pills-review" type="button" role="tab" aria-controls="pills-review" aria-selected="false">Write Review</button>
                  </li>
                </ul>
            </div>
            
            <div class="tab-content" id="pills-tabContent">
              <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
                  <div class="row">
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
              <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
                  <div class="review_wrapper">
                      <div class="row d-flex justify-content-center">
                         <div class="col-lg-7">
                             <div class="review_list mb-4">
                            <div class="d-flex position-relative">
                                  <div class="user_profile">
                                       <img src="{{ asset('profile_img.jpg') }}" class="me-3" alt="user image">
                                  </div>
                                  <div class="content">
                                      <ul>
                                          <li><i class="fa fa-star"></i></li>
                                          <li><i class="fa fa-star"></i></li>
                                          <li><i class="fa fa-star"></i></li>
                                          <li><i class="fa fa-star"></i></li>
                                          <li><i class="fa fa-star"></i></li>
                                      </ul>
                                      <h3>John Doe</h3>
                                      <span>05 Feb, 2022</span>
                                      <p>Lorem, ipsum dolor sit amet consectetur, adipisicing elit. Blanditiis, enim perspiciatis voluptatibus ipsa quae, aperiam sequi! Eum ut tempora, totam impedit esse possimus, quam autem praesentium vero maiores odit velit.</p>
                                  </div>
                                </div>
                          </div>
                          <div class="review_list mb-4">
                               <div class="d-flex position-relative">
                                  <div class="user_profile">
                                       <img src="{{ asset('profile_img.jpg') }}" class="me-3" alt="user image">
                                  </div>
                                  <div class="content">
                                      <ul>
                                          <li><i class="fa fa-star"></i></li>
                                          <li><i class="fa fa-star"></i></li>
                                          <li><i class="fa fa-star"></i></li>
                                          <li><i class="fa fa-star"></i></li>
                                          <li><i class="fa fa-star"></i></li>
                                      </ul>
                                      <h3>John Doe</h3>
                                      <span>05 Feb, 2022</span>
                                      <p>Lorem, ipsum dolor sit amet consectetur, adipisicing elit. Blanditiis, enim perspiciatis voluptatibus ipsa quae, aperiam sequi! Eum ut tempora, totam impedit esse possimus, quam autem praesentium vero maiores odit velit.</p>
                                  </div>
                             </div>
                          </div>
                         </div>
                      </div>
                  </div>
              </div>
              <div class="tab-pane fade" id="pills-review" role="tabpanel" aria-labelledby="pills-review-tab">
                  <div class="review_form">
                      <div class="row d-flex justify-content-center">
                          <div class="col-lg-7">
                              <form action="#" method="post">
                                  <div class="mb-3">
                                      <div id="rateYo"></div>
                                  </div>
                                  <div class="mb-3">
                                      <textarea name="review" id="review" cols="30" rows="5" class="form-control" placeholder="Write your comment" required></textarea>
                                  </div>
                                  <button type="submit" class="btn btn-primary">Publish Review</button>
                              </form>
                          </div>
                      </div>
                  </div>
              </div>
            </div>
          <!--   <div class="product-show pb-1 col-12">
                <h5>@lang('web.shop_general')</h5>
            </div> -->
            <!-- featured -->
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>

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
<!-- start icon -->
<script>
    $(document).ready(function() {
        $("#rateYo").rateYo({
            starWidth: '30px',
            fullStar: true,
            mormalFill: 'yellow',
            ratedFill: 'orange',
            onSet: function(rating, rateYoInstance) {
                $('#rating').val(rating);
            }
        });
    });
</script>
@endpush
