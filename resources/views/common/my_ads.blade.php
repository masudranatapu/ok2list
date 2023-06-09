@extends('layouts.app')
@section('content')
<!-- myads-page -->
<section id="main" class="clearfix myads-page">
    <div class="container">

        <div class="breadcrumb-section">
            <!-- breadcrumb -->
            <ol class="breadcrumb">
                <li><a href="{{ url('/') }}">Home</a></li>
                <li>Ad Post</li>
            </ol><!-- breadcrumb -->
        </div><!-- banner -->
        <div class="ads-info profile">
            <div class="row">
                <div class="col-xl-3 text-center">
                    <div class="recommended-cta">
                        <div class="cta">
                            <div class="ad-profile section">
                                <div class="user-profile">
                                    <div class="user">
                                        <h2>Hello, <a href="#">Jhon Doe</a></h2>
                                        <h5>ronymia111@gmail.com</h5>
                                        <hr>
                                    </div>
                                    <div class="favorites-user">
                                        <div class="my-ads">
                                            <a href="my-ads.html">23<small>My ADS</small></a>
                                        </div>
                                        <div class="favorites">
                                            <a href="#">18<small>Favorites</small></a>
                                        </div>
                                    </div>
                                </div><!-- user-profile -->

                                <ul class="user-menu">
                                    <li><a href="my-profile.html"><i class="fa fa-chevron-right"></i> My Profile</a>
                                    </li>
                                    <li class="active"><a href="my-ads.html"><i class="fa fa-chevron-right"></i> My
                                            ads</a></li>
                                    <li><a href="favourite-ads.html"><i class="fa fa-chevron-right"></i> Favourite
                                            ads</a></li>
                                    <li><a href="promoted-ads.html"><i class="fa fa-chevron-right"></i> Promoted Ads</a>
                                    </li>
                                    <li><a href="promotion.html"><i class="fa fa-chevron-right"></i> Promotions</a></li>
                                    <li><a href="membership.html"><i class="fa fa-chevron-right"></i> Membership</a>
                                    </li>
                                    <li><a href="pending-ads.html"><i class="fa fa-chevron-right"></i> Pending
                                            approval</a></li>
                                    <li><a href="{{ route('my-profile') }}"><i class="fa fa-chevron-right"></i> My
                                            Profile</a></li>
                                    <li class="active"><a href="{{ route('my-ads') }}"><i
                                                class="fa fa-chevron-right"></i> My ads</a></li>
                                    <li><a href="{{ route('favorite-ads') }}"><i class="fa fa-chevron-right"></i>
                                            Favourite ads</a></li>
                                    <li><a href="{{ route('promoted-ads') }}"><i class="fa fa-chevron-right"></i>
                                            Promoted Ads</a></li>
                                    <li><a href="{{ route('ads-promotion') }}"><i class="fa fa-chevron-right"></i>
                                            Promotions</a></li>
                                    <li><a href="{{ route('membership-ads') }}"><i class="fa fa-chevron-right"></i>
                                            Membership</a></li>
                                    <li><a href="{{ route('pending-ads') }}"><i class="fa fa-chevron-right"></i> Pending
                                            approval</a></li>
                                </ul>
                            </div><!-- ad-profile -->
                        </div>
                    </div><!-- cta -->
                </div><!-- recommended-cta-->
                <div class="col-xl-9">
                    <div class="my-ads section">
                        <h2>My ads</h2>
                        <!-- ad-item -->
                        <div class="ad-item row">
                            <!-- item-image -->
                            <div class="item-image-box col-lg-4">
                                <div class="item-image">
                                    <a href="details.html"><img src="images/trending/1.jpg" alt="Image"
                                            class="img-fluid"></a>
                                </div><!-- item-image -->
                            </div>

                            <!-- rending-text -->
                            <div class="item-info col-lg-8">
                                <!-- ad-info -->
                                <div class="ad-info">
                                    <h3 class="item-price">$800.00</h3>
                                    <h4 class="item-title"><a href="#">Apple TV - Everything you need to know!</a>
                                    </h4>
                                    <a href="promotion.html" class="btn btn-danger"
                                        style="background: #ffc800;border: #ffc800; color: #673500;font-weight: bold;"><i
                                            class="fa fa-arrow-up"></i> Promote this ad</a>
                                    <div class="item-cat">
                                        <span><a href="#">Electronics & Gedgets</a></span> /
                                        <span><a href="#">Tv & Video</a></span>
                                    </div>
                                </div><!-- ad-info -->

                                <!-- ad-meta -->
                                <div class="ad-meta">
                                    <div class="meta-content">
                                        <span class="dated">Posted On: <a href="#">7 Jan, 16 10:10 pm </a></span>
                                        <span class="visitors">Visitors: 221</span>
                                    </div>
                                    <!-- item-info-right -->
                                    <div class="user-option pull-right">
                                        <a class="edit-item" href="#" data-toggle="tooltip" data-placement="top"
                                            title="Edit this ad"><i class="fa fa-pencil"></i></a>
                                        <a class="delete-item" href="#" data-toggle="tooltip" data-placement="top"
                                            title="Delete this ad"><i class="fa fa-times"></i></a>
                                    </div><!-- item-info-right -->
                                </div><!-- ad-meta -->
                            </div><!-- item-info -->
                        </div><!-- ad-item -->

                        <!-- ad-item -->
                        <div class="ad-item row">
                            <div class="item-image-box col-lg-4">
                                <!-- item-image -->
                                <div class="item-image">
                                    <a href="details.html"><img src="images/trending/2.jpg" alt="Image"
                                            class="img-fluid"></a>
                                </div><!-- item-image -->
                            </div><!-- item-image-box -->

                            <!-- rending-text -->
                            <div class="item-info col-lg-8">
                                <!-- ad-info -->
                                <div class="ad-info">
                                    <h3 class="item-price">$250.00 <span>(Negotiable)</span></h3>
                                    <h4 class="item-title"><a href="#">Bark Furniture, Handmade Bespoke
                                            Furniture</a></h4>
                                    <div class="item-cat">
                                        <span><a href="#">Home Appliances</a></span> /
                                        <span><a href="#">Sofa</a></span>
                                    </div>
                                </div><!-- ad-info -->

                                <!-- ad-meta -->
                                <div class="ad-meta">
                                    <div class="meta-content">
                                        <span class="dated">Posted On: <a href="#">7 Jan, 16 10:10 pm
                                            </a></span>
                                        <span class="visitors">Visitors: 221</span>
                                    </div>
                                    <!-- item-info-right -->
                                    <div class="user-option pull-right">
                                        <a class="edit-item" href="#" data-toggle="tooltip" data-placement="top"
                                            title="Edit this ad"><i class="fa fa-pencil"></i></a>
                                        <a class="delete-item" href="#" data-toggle="tooltip" data-placement="top"
                                            title="Delete this ad"><i class="fa fa-times"></i></a>
                                    </div><!-- item-info-right -->
                                </div><!-- ad-meta -->
                            </div><!-- item-info -->
                        </div><!-- ad-item -->

                        <!-- ad-item -->
                        <div class="ad-item row">
                            <div class="item-image-box col-lg-4">
                                <!-- item-image -->
                                <div class="item-image">
                                    <a href="details.html"><img src="images/trending/3.jpg" alt="Image"
                                            class="img-fluid"></a>
                                </div><!-- item-image -->
                            </div><!-- item-image-box -->

                            <!-- rending-text -->
                            <div class="item-info col-lg-8">
                                <!-- ad-info -->
                                <div class="ad-info">
                                    <h3 class="item-price">$890.00 <span>(Negotiable)</span></h3>
                                    <h4 class="item-title"><a href="#">Samsung Galaxy S6 Edge</a></h4>
                                    <div class="item-cat">
                                        <span><a href="#">Electronics & Gedgets</a></span> /
                                        <span><a href="#">Mobile Phone</a></span>
                                    </div>
                                </div><!-- ad-info -->

                                <!-- ad-meta -->
                                <div class="ad-meta">
                                    <div class="meta-content">
                                        <span class="dated">Posted On: <a href="#">7 Jan, 16 10:10 pm
                                            </a></span>
                                        <span class="visitors">Visitors: 221</span>
                                    </div>
                                    <!-- item-info-right -->
                                    <div class="user-option pull-right">
                                        <a class="edit-item" href="#" data-toggle="tooltip" data-placement="top"
                                            title="Edit this ad"><i class="fa fa-pencil"></i></a>
                                        <a class="delete-item" href="#" data-toggle="tooltip" data-placement="top"
                                            title="Delete this ad"><i class="fa fa-times"></i></a>
                                    </div><!-- item-info-right -->
                                </div><!-- ad-meta -->
                            </div><!-- item-info -->
                        </div><!-- ad-item -->

                        <!-- ad-item -->
                        <div class="ad-item row">
                            <div class="item-image-box col-lg-4">
                                <!-- item-image -->
                                <div class="item-image">
                                    <a href="details.html"><img src="images/trending/4.jpg" alt="Image"
                                            class="img-fluid"></a>
                                </div><!-- item-image -->
                            </div><!-- item-image-box -->

                            <!-- rending-text -->
                            <div class="item-info col-lg-8">
                                <!-- ad-info -->
                                <div class="ad-info">
                                    <h3 class="item-price">$800.00</h3>
                                    <h4 class="item-title"><a href="#">Rick Morton- Magicius Chase</a></h4>
                                    <div class="item-cat">
                                        <span><a href="#">Books & Magazines</a></span> /
                                        <span><a href="#">Story book</a></span>
                                    </div>
                                </div><!-- ad-info -->

                                <!-- ad-meta -->
                                <div class="ad-meta">
                                    <div class="meta-content">
                                        <span class="dated">Posted On: <a href="#">7 Jan, 16 10:10 pm
                                            </a></span>
                                        <span class="visitors">Visitors: 221</span>
                                    </div>
                                    <!-- item-info-right -->
                                    <div class="user-option pull-right">
                                        <a class="edit-item" href="#" data-toggle="tooltip" data-placement="top"
                                            title="Edit this ad"><i class="fa fa-pencil"></i></a>
                                        <a class="delete-item" href="#" data-toggle="tooltip" data-placement="top"
                                            title="Delete this ad"><i class="fa fa-times"></i></a>
                                    </div><!-- item-info-right -->
                                </div><!-- ad-meta -->
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