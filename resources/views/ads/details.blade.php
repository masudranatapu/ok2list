@extends('layouts.app')
@push('custom_css')
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.min.css">
    <link rel="stylesheet" href="https://cdn.bootcss.com/toastr.js/latest/css/toastr.min.css">
    <!-- social css -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/solid.css"
        integrity="sha384-+0VIRx+yz1WBcCTXBkVQYIBVNEFH1eP6Zknm16roZCyeNg2maWEpk/l/KsyFKs7G" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/brands.css"
        integrity="sha384-1KLgFVb/gHrlDGLFPgMbeedi6tQBLcWvyNUN+YKXbD7ZFbjX6BLpMDf0PJ32XJfX" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/fontawesome.css"
        integrity="sha384-jLuaxTTBR42U2qJ/pm4JRouHkEDHkVqH0T1nyQXn1mZ7Snycpf6Rl25VBNthU4z0" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightgallery/2.7.0/css/lightgallery-bundle.min.css">
@endpush
<?php
$row = $data['row'];
$reject_reason = Config::get('static_arrays.reject_reason') ?? [];
$cate = DB::table('prd_category')
    ->where('pk_no', $row->f_cat_pk_no)
    ->first();
?>
@section('content')
    <!-- main -->
    <section id="main" class="clearfix details-page">
        <div class="container">
            {{-- @include('ads._topbar',$data) --}}
            <div class="breadcrumb-section">
                <ol class="breadcrumb">
                    <li><a href="{{ route('home') }}">{{ __('home') }}</a></li>
                    <li><a href="javascript:;">{{ $cate->name ?? '' }}</a></li>
                    <li><a href="javascript:;">{{ $row->ad_title }}</a></li>
                </ol>
            </div>

            <!--  @if (isset($data['detail_page1']) && $data['detail_page1'] != null)
    <div class="ads_banner text-center mb-4">
                                                                                                                                                                                                                                                                                                                                                        <a href="{{ $data['detail_page1']->link }}" target="_blank"
                                                                                                                                                                                                                                                                                                                                                            title="{{ $data['detail_page1']->name }}"><img src="{{ fileExit($data['detail_page1']->photo) }}"
                                                                                                                                                                                                                                                                                                                                                                class="w-100" alt="{{ $data['detail_page1']->name }}" style="height: 96px;"></a>
                                                                                                                                                                                                                                                                                                                                                    </div>
    @endif -->

            <div class="mb-5">
                <div class="row">
                    <!-- carousel -->
                    <div class="col-lg-8">
                        <div id="product-carousel" class="singel_gallery carousel slide" data-ride="carousel">
                            <div class="slider-text">
                                <h3 class="title">
                                    {{ $row->ad_title }}
                                </h3>

                            </div>

                            <!-- Indicators -->
                            <ol class="carousel-indicators">
                                @if ($data['photos'] && count($data['photos']) > 0)
                                    @foreach ($data['photos'] as $key => $photo)
                                        <li data-target="#product-carousel" data-slide-to="{{ $key }}"
                                            class="active">
                                            <img src="{{ asset('uploads/product/' . $row->pk_no . '/' . $photo->img_name) }}"
                                                alt="{{ $row->ad_title }}" class="img-fluid">
                                        </li>
                                    @endforeach
                                @endif
                            </ol>
                            <!-- Wrapper for slides -->
                            <div class="carousel-inner" role="listbox" id="lightgallery">
                                @if ($data['photos'] && count($data['photos']) > 0)
                                    @foreach ($data['photos'] as $key => $photo)
                                        {{-- <div class="item carousel-item {{ $key == 0 ? 'active' : '' }} ">
                                            <div class="carousel-image" > --}}
                                        <a class="item carousel-item carousel-image {{ $key == 0 ? 'active' : '' }} "
                                            href="{{ asset('uploads/product/' . $row->pk_no . '/' . $photo->img_name) }}"><img
                                                src="{{ asset('uploads/product/' . $row->pk_no . '/' . $photo->img_name) }}"
                                                alt="{{ $row->ad_title }}" alt="Featured Image" class="img-fluid"></a>
                                        {{-- </div>
                                        </div> --}}
                                    @endforeach
                                @endif
                            </div><!-- carousel-inner -->
                            <!-- Controls -->
                            <a class="left carousel-control" href="#product-carousel" role="button" data-slide="prev">
                                <i class="fa fa-chevron-left"></i>
                            </a>
                            <a class="right carousel-control" href="#product-carousel" role="button" data-slide="next">
                                <i class="fa fa-chevron-right"></i>
                            </a><!-- Controls -->
                        </div>
                    </div><!-- Controls -->
                    <!-- slider-text -->
                    <div class="col-lg-4">
                        @if ($row->doorstep_delivery == 1)
                            <div class="doorstep_item text-center">
                                <span>Doorstep Delivery</span>
                            </div>
                        @endif
                        <div class="single_content slider-text pt-3">
                            <h2>
                                ₦ {{ number_format($row->price, 2) }}
                                <div class="float-right">
                                    @if ($row->is_like == '1')
                                        <a href="{{ route('ad-post-dislike', $row->pk_no) }}" class="like_ads btn-sm"
                                            title="Like"><i class="fa fa-thumbs-up"></i>
                                            {{ $data['like_count'] ?? '0' }}
                                        </a>
                                    @else
                                        <a href="{{ route('ad-post-like', $row->pk_no) }}" class="like_ads btn-sm"
                                            title="Like"><i class="fa fa-thumbs-up"></i>
                                            {{ $data['like_count'] ?? '0' }}
                                        </a>
                                    @endif
                                </div>
                            </h2>

                            <!-- short-info -->
                            <div class="short-info">
                                <h4>{{ __('sort_info') }}</h4>
                                @if ($row->using_condition)
                                    <p><strong> {{ __('con') }}: </strong><a
                                            href="#">{{ $row->using_condition }}</a> </p>
                                @endif
                                @if ($row->brand_name)
                                    <p><strong> {{ __('bra') }}: </strong><a href="#">{{ $row->brand_name }}</a>
                                    </p>
                                @endif
                                @if ($row->prod_feature)
                                    <p><strong>{{ __('fea') }} : </strong> {{ $row->prod_feature }}
                                    </p>
                                @endif
                                @if ($row->model_name)
                                    <p><strong> {{ __('mod') }}: </strong><a href="#">{{ $row->model_name }}</a>
                                    </p>
                                @endif
                            </div><!-- short-info -->


                            <!-- buy product -->
                            @if ($row->doorstep_delivery == 1)
                                <div class="buy_product contact-with">
                                    <a href="{{ route('checkout.shipping') }}" onclick="addToCart({{ $row->pk_no }})"
                                        class="btn btn-red w-100">Order Online</a>
                                </div>
                            @endif
                            <!-- buy product -->


                            <!-- contact-with -->
                            <div class="contact-with">
                                <h4>{{ __('contact') }} </h4>
                                <span class="btn btn-red show-number">
                                    <i class="fa fa-phone-square"></i>
                                    <span class="hide-text">{{ __('click') }}</span>
                                    @if ($row->mobile1)
                                        <span class="hide-number"><a
                                                href="tel:{{ $row->mobile1 }}">{{ $row->mobile1 }}</a></span>
                                    @endif
                                    @if ($row->mobile2)
                                        <span class="hide-number"><a
                                                href="tel:{{ $row->mobile2 }}">{{ $row->mobile2 }}</a></span>
                                    @endif
                                </span>

                                @if (Auth::user())
                                    @if (Auth::user()->id != $row->customer_pk_no)
                                        <a href="javascript:void(0)" id="chat_dalal" class="btn" data-toggle="modal"
                                            data-target="#chatModal" data-pid="{{ $row->pk_no }}"
                                            data-toid="{{ Auth::user()->id }}"><i
                                                class="fa fa-comments"></i>{{ __('chat') }}</a>
                                    @endif
                                @else
                                    <a href="{{ route('login') }}?referer={{ request()->fullUrl() }}" class="btn"><i
                                            class="fa fa-comments"></i>{{ __('chat') }}</a>
                                @endif

                            </div>
                            <div class="my-3">
                                <h4 style="margin-bottom: 2px;">{{ __('offer_by') }}</h4>
                                <p><span>{{ __('name') }} : <a
                                            href="javascript:void(0)">{{ $row->user->name ?? '' }}</a></span>
                                    <span>
                                        {{ __('ad_id') }} :<a href="javascript:void(0)" class="time">
                                            {{ $row->code }}</a></span>
                                </p>
                                @if ($row->user->package != null && !empty($row->user->shop))
                                    @php
                                        $payment = App\Payments::where('f_customer_pk_no', $row->customer_pk_no)
                                            ->where('status', 'VALID')
                                            ->orderBy('pk_no', 'desc')
                                            ->first();
                                    @endphp
                                    @if ($payment)
                                        <div class="">
                                            <div class="premier_ads">
                                                <span class="member">
                                                    <i class="fa fa-star"></i>
                                                    {{ __('mem') }}
                                                </span>
                                                <span class="verified">
                                                    <i class="fa fa-check"></i>
                                                    {{ __('veri') }}
                                                </span>
                                                <strong>
                                                    <a
                                                        href="{{ route('shop_page_details', ['id' => $row->user->shop->pk_no, 'url_slug' => $row->user->shop->url_slug]) }}">(
                                                        {{ __('visi') }}</a>
                                                </strong>
                                            </div>
                                        </div>
                                    @endif
                                @else
                                    <span class="icon"><i class="fa fa-suitcase online"></i><a
                                            href="javascript:void(0)">{{ $row->user->seller_type }}</a></span>
                                @endif
                                <span class="icon"><i class="fa fa-clock-o"></i><a href="javascript:void(0)">
                                        {{ date('d M, y h:i A', strtotime($row->created_at)) }}</a></span>
                                <span class="icon"><i class="fa fa-map-marker-alt"></i><a
                                        href="javascript:void(0)">{{ $row->area->name ?? '' }},
                                        {{ $row->area->city->name ?? '' }}{{ $row->division->name ?? '' }}</a></span>
                            </div>


                            <!-- social-links -->
                            <div class="social-links">
                                <h4 style="margin-bottom: 0px;">{{ __('share') }}</h4>
                                <div id="shareBlock"></div>
                            </div><!-- social-links -->
                        </div>
                    </div><!-- slider-text -->
                </div>
            </div>

            <!-- slider -->
            <div class="description-info">
                <div class="row">
                    <!-- description -->
                    <div class="col-md-8">
                        <div class="row">
                            <div class="col-12">
                                <div class="description">
                                    <h4>{{ __('des') }}</h4>
                                    <div class="aaa">
                                        <p><?php echo $row->description; ?></p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="section recommended-ads">
                                    <div class="featured-top">
                                        <h4>{{ __('recom') }}</h4>
                                    </div>
                                    @if (isset($data['similar_ads']) && count($data['similar_ads']) > 0)
                                        @foreach ($data['similar_ads'] as $i => $srow)
                                            <div class="ad-item row col-12">
                                                <div class="item-image-box col-lg-4">
                                                    <div class="item-image">
                                                        <a href="{{ route('ad.details', ['pk_no' => $srow->pk_no, 'url_slug' => $srow->url_slug]) }}"
                                                            title="{{ $srow->ad_title }}"><img
                                                                src="{{ asset($srow->img_path_thumb) }}" alt="Image"
                                                                class="img-fluid"></a>
                                                    </div>
                                                </div>
                                                <div class="item-info col-lg-8">
                                                    <div class="ad-info">
                                                        <h3 class="item-price">
                                                            ₦{{ number_format($srow->price, 2) }}
                                                            <div class="float-right">

                                                                @if ($row->is_like == '1')
                                                                    <a href="{{ route('ad-post-dislike', $row->pk_no) }}"
                                                                        class="like_ads btn-sm" title="Like"><i
                                                                            class="fa fa-thumbs-up"></i>
                                                                        {{ $data['like_count'] ?? '0' }}
                                                                    </a>
                                                                @else
                                                                    <a href="{{ route('ad-post-like', $row->pk_no) }}"
                                                                        class="like_ads btn-sm" title="Like"><i
                                                                            class="fa fa-thumbs-up"></i>
                                                                        {{ $data['like_count'] ?? '0' }}
                                                                    </a>
                                                                @endif

                                                            </div>
                                                        </h3>
                                                        <h4 class="item-title"><a
                                                                href="{{ route('ad.details', ['pk_no' => $srow->pk_no, 'url_slug' => $srow->url_slug]) }}"
                                                                title="{{ $srow->ad_title }}">{{ $srow->ad_title }}</a>
                                                        </h4>
                                                        <div class="item-cat">
                                                            <span><a
                                                                    href="javascript:void(0)">{{ $srow->category->name ?? '' }}</a></span>
                                                            /
                                                            <span><a
                                                                    href="javascript:void(0)">{{ $srow->subcategory->name ?? '' }}</a>&nbsp;&nbsp;
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <div class="ad-meta">
                                                        <div class="meta-content">
                                                            <span
                                                                class="dated">{{ date('d M, Y H:i A', strtotime($srow->created_at)) }}</span>
                                                            @if ($srow->useing_codition)
                                                                <a href="javascript:void(0)" class="tag"><i
                                                                        class="fa fa-tags"></i>
                                                                    {{ $srow->using_condition }}</a>
                                                            @endif
                                                        </div>
                                                        <div class="user-option pull-right">
                                                            <a href="#" data-toggle="tooltip" data-placement="top"
                                                                title="{{ $srow->area->name ?? '' }}, {{ $srow->area->city->name ?? '' }} {{ $srow->area->division->name ?? '' }}"><i
                                                                    class="fa fa-map-marker-alt"></i> </a>
                                                            <a class="online" href="#" data-toggle="tooltip"
                                                                data-placement="top"
                                                                title="{{ $srow->user->seller_type ?? '' }}"><i
                                                                    class="fa fa-user"></i> </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        @endforeach
                                    @endif
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="row">
                            <div class="col-12">
                                @if ($data['row']->ad_type == 'jobs')
                                    @php
                                        $jobInfo = App\JobPreference::where('prod_pk_no', $data['row']->pk_no)->first();
                                    @endphp
                                    @if ($jobInfo)
                                        <div class="short-info" style="margin-top: 0px;">
                                            <h4>Jobs Info</h4>
                                            <ul>
                                                @php
                                                    $mini_qualification_combo = Config::get('static_arrays.edu_qulafication') ?? [];
                                                @endphp
                                                @if ($jobInfo->mini_qualification)
                                                    <li class="d-flex justify-content-between align-items-center">
                                                        Min. Qualification :
                                                        <span>
                                                            @if ($jobInfo->mini_qualification == 'primary_school')
                                                                Primary School
                                                            @endif
                                                            @if ($jobInfo->mini_qualification == 'high_school')
                                                                High School
                                                            @endif
                                                            @if ($jobInfo->mini_qualification == 'ssc')
                                                                SSC / O Level
                                                            @endif
                                                            @if ($jobInfo->mini_qualification == 'hsc')
                                                                HSC / A Level
                                                            @endif
                                                            @if ($jobInfo->mini_qualification == 'diploma')
                                                                Diploma
                                                            @endif
                                                            @if ($jobInfo->mini_qualification == 'graduate')
                                                                Bachelor / Honors
                                                            @endif
                                                            @if ($jobInfo->mini_qualification == 'post_graduate')
                                                                Masters
                                                            @endif
                                                            @if ($jobInfo->mini_qualification == 'doctorate')
                                                                PhD / Doctorate
                                                            @endif
                                                        </span>
                                                    </li>
                                                @endif
                                                @if ($jobInfo->req_expriance)
                                                    <li class="d-flex justify-content-between align-items-center">
                                                        Req. Expriance :
                                                        <span>{{ $jobInfo->req_expriance }} Years</span>
                                                    </li>
                                                @endif
                                                @if ($jobInfo->edu_specialization)
                                                    <li class="d-flex justify-content-between align-items-center">
                                                        Edu. Specialization :
                                                        <span>

                                                            @if ($jobInfo->edu_specialization == 'art_humanities')
                                                                Art and Humanities
                                                            @endif
                                                            @if ($jobInfo->edu_specialization == 'business_management')
                                                                Business and Management
                                                            @endif
                                                            @if ($jobInfo->edu_specialization == 'accounting')
                                                                Accounting
                                                            @endif
                                                            @if ($jobInfo->edu_specialization == 'design_fashion')
                                                                Design and Fashion
                                                            @endif
                                                            @if ($jobInfo->edu_specialization == 'engineering')
                                                                Engineering
                                                            @endif
                                                            @if ($jobInfo->edu_specialization == 'events_hospitality')
                                                                Events and Hospitality
                                                            @endif
                                                            @if ($jobInfo->edu_specialization == 'finance_commerce')
                                                                Finance and Commerce
                                                            @endif
                                                            @if ($jobInfo->edu_specialization == 'human_resources')
                                                                Resources
                                                            @endif
                                                            @if ($jobInfo->edu_specialization == 'info_technology')
                                                                Information Technology
                                                            @endif
                                                            @if ($jobInfo->edu_specialization == 'law')
                                                                Law
                                                            @endif
                                                            @if ($jobInfo->edu_specialization == 'marketing_sales')
                                                                Marketing and Sales
                                                            @endif
                                                            @if ($jobInfo->edu_specialization == 'mass_comm')
                                                                Mass Communication
                                                            @endif
                                                            @if ($jobInfo->edu_specialization == 'medicine')
                                                                Medicine
                                                            @endif
                                                            @if ($jobInfo->edu_specialization == 'sciences')
                                                                Sciences
                                                            @endif
                                                            @if ($jobInfo->edu_specialization == 'vocational')
                                                                Vocational and Technical
                                                            @endif
                                                            @if ($jobInfo->edu_specialization == 'others')
                                                                Others
                                                            @endif
                                                        </span>
                                                    </li>
                                                @endif
                                                @if ($data['row']->company_name)
                                                    <li class="d-flex justify-content-between align-items-center">
                                                        Company Name :
                                                        <span>{{ $data['row']->company_name }}</span>
                                                    </li>
                                                @endif
                                                @if ($jobInfo->receive_applications_via)
                                                    <li class="d-flex justify-content-between align-items-center">
                                                        Receive Applications Via :
                                                        <span>
                                                            @if ($jobInfo->receive_applications_via == 'dashboard')
                                                                Company Employee
                                                            @else
                                                                Phone
                                                            @endif
                                                        </span>
                                                    </li>
                                                @endif
                                                @if ($jobInfo->skill)
                                                    <li class="d-flex justify-content-between align-items-center">
                                                        Skill :
                                                        <span>{{ $jobInfo->skill }}</span>
                                                    </li>
                                                @endif
                                                @if ($jobInfo->max_age)
                                                    <li class="d-flex justify-content-between align-items-center">
                                                        Max Age :
                                                        <span>{{ $jobInfo->max_age }} Years</span>
                                                    </li>
                                                @endif
                                                @if ($jobInfo->pref_gender)
                                                    <li class="d-flex justify-content-between align-items-center">
                                                        Gender :
                                                        <span>
                                                            @if ($jobInfo->pref_gender == 'any')
                                                                Any
                                                            @endif
                                                            @if ($jobInfo->pref_gender == 'female')
                                                                Female
                                                            @endif
                                                            @if ($jobInfo->pref_gender == 'others')
                                                                Other
                                                            @endif
                                                            @if ($jobInfo->pref_gender == 'male')
                                                                Male
                                                            @endif
                                                        </span>
                                                    </li>
                                                @endif
                                                @if ($jobInfo->application_requirements)
                                                    <li class="d-flex justify-content-between align-items-center">
                                                        Application Requirements :
                                                        <span>
                                                            {{ $jobInfo->application_requirements }}
                                                        </span>
                                                    </li>
                                                @endif
                                                @if ($jobInfo->role_designation)
                                                    <li class="d-flex justify-content-between align-items-center">
                                                        Role Designation :
                                                        <span>{{ $jobInfo->role_designation }}</span>
                                                    </li>
                                                @endif
                                                @if ($jobInfo->total_vacancies)
                                                    <li class="d-flex justify-content-between align-items-center">
                                                        Total Vacancies :
                                                        <span>{{ $jobInfo->total_vacancies }}</span>
                                                    </li>
                                                @endif
                                                @if ($jobInfo->deadline)
                                                    <li class="d-flex justify-content-between align-items-center">
                                                        Deadline :
                                                        <span>{{ date('d M Y', strtotime($jobInfo->deadline)) }}</span>
                                                    </li>
                                                @endif
                                                @if ($jobInfo->business_function)
                                                    <li class="d-flex justify-content-between align-items-center">
                                                        Business Function :
                                                        <span>
                                                            @if ($jobInfo->business_function == 'administration')
                                                                Administration
                                                            @endif
                                                            @if ($jobInfo->business_function == 'accounting_finance')
                                                                Accounting and Finance
                                                            @endif
                                                            @if ($jobInfo->business_function == 'contractual')
                                                                Contractual
                                                            @endif
                                                            @if ($jobInfo->business_function == 'customer_support')
                                                                Customer Support
                                                            @endif
                                                            @if ($jobInfo->business_function == 'data_entry_analysis')
                                                                Data Entry and Analysis
                                                            @endif
                                                            @if ($jobInfo->business_function == 'creative_design_architecture')
                                                                Creative, Design and Architecture
                                                            @endif
                                                            @if ($jobInfo->business_function == 'education_training')
                                                                Education and Training
                                                            @endif
                                                            @if ($jobInfo->business_function == 'hospitality')
                                                                Hospitality
                                                            @endif
                                                            @if ($jobInfo->business_function == 'human_resources')
                                                                Human Resources
                                                            @endif
                                                            @if ($jobInfo->business_function == 'it_telecom')
                                                                IT and Telecom
                                                            @endif
                                                            @if ($jobInfo->business_function == 'legel')
                                                                Legal
                                                            @endif
                                                            @if ($jobInfo->business_function == 'logistics')
                                                                Logistics
                                                            @endif
                                                            @if ($jobInfo->business_function == 'management')
                                                                Management
                                                            @endif
                                                            @if ($jobInfo->business_function == 'manufacturing')
                                                                Manufacturing
                                                            @endif
                                                            @if ($jobInfo->business_function == 'marketing_salse')
                                                                Marketing and Sales
                                                            @endif
                                                            @if ($jobInfo->business_function == 'operations')
                                                                Operations
                                                            @endif
                                                            @if ($jobInfo->business_function == 'quality_assurance')
                                                                Quality Assurance
                                                            @endif
                                                            @if ($jobInfo->business_function == 'research_technical')
                                                                Research and Technical
                                                            @endif
                                                            @if ($jobInfo->business_function == 'security')
                                                                Security
                                                            @endif
                                                            @if ($jobInfo->business_function == 'others')
                                                                Others
                                                            @endif
                                                        </span>
                                                    </li>
                                                @endif
                                            </ul>
                                        </div>
                                    @endif
                                @endif
                            </div>
                            @if (Auth::user() && Auth::user()->id == $row->customer_pk_no)
                                <!-- NO  -->
                            @else
                                <div class="col-12">
                                    <div class="short-info" style="margin-top: 0px;">
                                        <ul>
                                            @if (Auth::user())
                                                @if ($row->is_favorite == 1)
                                                    <li><i class="fa fa-heart"></i><a
                                                            href="javascript:void(0)">{{ __('added') }}</a>
                                                    </li>
                                                @else
                                                    <li><i class="fa fa-heart"></i><a href="javascript:void(0)"
                                                            id="save_as_fav" data-adid="{{ $row->pk_no }}"
                                                            data-uid="{{ Auth::user()->id ?? '' }}">{{ __('save') }}</a>
                                                    </li>
                                                @endif
                                            @else
                                                <li><i class="fa fa-heart"></i><a href="javascript:void(0)"
                                                        onclick="return confirm('Please login first!');">{{ __('save') }}</a>
                                                </li>
                                            @endif
                                            <li><i class="fa fa-exclamation-triangle"></i><a data-toggle="modal"
                                                    data-target="#reportad"
                                                    href="javascript:void(0)">{{ __('report') }}</a>
                                            </li>
                                        </ul><!-- social-icon -->
                                    </div>
                                </div>
                                @if (isset($data['detail_page3']) && $data['detail_page3'] != null)
                                    <div class="col-12">
                                        <div class="banner_ads short-info">
                                            <a href="{{ $data['detail_page3']->link }}" target="_blank"
                                                title="{{ $data['detail_page3']->name }}"><img
                                                    src="{{ fileExit($data['detail_page3']->photo) }}" class="w-100"
                                                    alt="{{ $data['detail_page3']->name }}" style="height: 480px;"></a>
                                        </div>
                                    </div>
                                @endif
                            @endif
                        </div>
                    </div>
                </div>
            </div>
            <div class="recommended-info">
                <div class="row">

                </div>
            </div>
        </div>
    </section>

    <section id="something-sell" class="clearfix parallax-section"
        style="background-image: url('{{ asset('post-bg.jpg') }}');">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-sm-8">
                    <h2 class="title">{{ __('something_to_sel') }}</h2>
                    <h4>{{ __('free_on_ok2list') }}</h4>
                </div>
                <div class="col-sm-4">
                    <div class="free_post_btn float-sm-right">
                        @if (!empty($payments))
                            @if ($payments->status != 'Due')
                                <a href="javascript:;" data-toggle="modal" data-target="#staticBackdrop"
                                    class="btn btn-primary">'{{ __('post_free_ad') }})</a>
                            @else
                                <a href="javascript:;" class="btn btn-primary">{{ __('pending') }}</a>
                            @endif
                        @else
                            @if (Auth::user())
                                @if (Auth::user()->is_verified == 1)
                                    <a href="javascript:;" data-toggle="modal" data-target="#staticBackdrop"
                                        class="btn btn-primary">{{ __('post_free_ad') }}</a>
                                @endif
                            @else
                                <a href="{{ route('login') }}" class="btn btn-primary">{{ __('post_free_ad') }}</a>
                            @endif
                        @endif
                    </div>
                </div>
            </div>
        </div><!-- contaioner -->
    </section><!-- download -->
    <!-- Modal Report ads-->
    <div class="modal fade categoryselectmodal" id="reportad" data-backdrop="static" data-keyboard="false"
        tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <p class="modal-title" id="staticBackdropLabel">
                        <strong>{{ __('report_title') }}</strong>
                    </p>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>
                        {{ __('r_details') }}
                    </p>
                    <hr>
                    <div class="user-account" style="padding: 20px;">
                        {!! Form::open([
                            'route' => ['ad.report', $row->pk_no],
                            'method' => 'post',
                            'class' => 'form-horizontal',
                            'files' => true,
                            'novalidate',
                            'autocomplete' => 'off',
                        ]) !!}
                        <div class="form-group {!! $errors->has('reject_reason') ? 'error' : '' !!}">
                            <label for="reason">{{ __('reason') }}</label>
                            <div class="controls">
                                {!! Form::select('reject_reason', $reject_reason, old('reject_reason'), [
                                    'class' => 'form-control select2',
                                    'id' => 'reject_reason',
                                    'data-validation-required-message' => 'This field is required',
                                    'placeholder' => 'Select reason',
                                    'tabindex' => 2,
                                ]) !!}
                                {!! $errors->first('reject_reason', '<label class="help-block text-danger">:message</label>') !!}
                            </div>
                        </div>
                        <div class="form-group {!! $errors->has('email') ? 'error' : '' !!}">
                            <label for="exampleFormControlSelect1">{{ __('email') }}</label>
                            <div class="controls">
                                {!! Form::email('email', null, [
                                    'class' => 'form-control',
                                    'data-validation-required-message' => 'This field is required',
                                    'maxlength' => '50',
                                    'data-validation-maxlength-message' => 'Maxlength 50 characters',
                                    'placeholder' => 'Enter email',
                                    'tabindex' => 2,
                                ]) !!}
                                {!! $errors->first('email', '<label class="help-block text-danger">:message</label>') !!}
                            </div>
                        </div>
                        <div class="form-group {!! $errors->has('message') ? 'error' : '' !!}">
                            <div class="controls">
                                {!! Form::textarea('message', null, [
                                    'class' => 'form-control ctext',
                                    'maxlength' => '50',
                                    'data-validation-maxlength-message' => 'Maxlength 50 characters',
                                    'placeholder' => 'Enter message',
                                    'tabindex' => 3,
                                    'rows' => 3,
                                ]) !!}
                                {!! $errors->first('message', '<label class="help-block text-danger">:message</label>') !!}
                            </div>
                        </div>
                        <button type="submit" class="btn" style="width: 100%;">{{ __('submit') }}</button>
                        {!! Form::close() !!}
                    </div>
                </div>
            </div>
        </div>
    </div>
    @if (Auth::user())
        <!-- Modal Report ads-->
        <div class="modal fade" id="chatModal" data-backdrop="static" data-keyboard="false" tabindex="-1"
            aria-labelledby="staticchatLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <p class="modal-title" id="staticchatLabel"> {{ __('c_w') }}{{ $row->user->name ?? '' }}
                        </p>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row justify-content-center chatinterface  mt-15">
                            <div class="col-md-12 chat">
                                <div class="card">
                                    <div class="card-header msg_head">
                                        <div class="d-flex bd-highlight">
                                            <div class="media p-1">
                                                <img src="{{ asset('uploads/product/' . $row->pk_no . '/thumb/' . $row->thumb) }}"
                                                    alt="{{ $row->user->name ?? '' }}" class="mr-3"
                                                    style="height:60px;">
                                                <div class="media-body">
                                                    <h5
                                                        style="font-size: 16px; color: #000; margin-bottom: 2px; margin-top: 3px;">
                                                        {{ $row->ad_title }}</h5>
                                                    <p class="mb-0">{{ $row->area->name ?? '' }},
                                                        {{ $row->area->city->name ?? '' }}{{ $row->division->name ?? '' }}
                                                    </p>
                                                    <p class="mb-0 text-success">₦ {{ number_format($row->price, 2) }}
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-body msg_card_body" id="msg_card_body">
                                        @if ($data['all_text'] && count($data['all_text']) > 0)
                                            @foreach ($data['all_text'] as $key => $txt)
                                                @if ($txt->customer_pk_no == $row->customer_pk_no)
                                                    <div class="d-flex justify-content-start mb-4">
                                                        <div class="msg_cotainer">
                                                            {{ $txt->message }}
                                                            <span
                                                                class="msg_time_send">{{ date('d M, y, h:i A', strtotime($txt->created_at)) }}</span>
                                                        </div>
                                                    </div>
                                                @endif
                                                @if ($txt->customer_pk_no == Auth::user()->id)
                                                    <div class="d-flex justify-content-end mb-4">
                                                        <div class="msg_cotainer_send">
                                                            {{ $txt->message }}
                                                            <span
                                                                class="msg_time_send">{{ date('d M, y, h:i A', strtotime($txt->created_at)) }}</span>
                                                        </div>
                                                    </div>
                                                @endif
                                            @endforeach
                                        @endif
                                    </div>
                                    <div class="card-footer">
                                        {!! Form::open([
                                            'route' => 'chat.store',
                                            'method' => 'post',
                                            'class' => 'form-horizontal',
                                            'id' => 'frmSmg',
                                            'files' => true,
                                            'novalidate',
                                            'autocomplete' => 'off',
                                        ]) !!}
                                        <input type="hidden" name="postid" value="{{ $row->pk_no }}"
                                            id="postid" />
                                        <input type="hidden" name="to_user" value="{{ $row->customer_pk_no }}"
                                            id="to_user" />
                                        <div class="form-group" id="textfg">
                                            <div class="input-group">
                                                <textarea name="message" class="form-control type_msg" placeholder="Type your message..." id="textSmg"></textarea>
                                                <div class="input-group-append">
                                                    <span class="input-group-text send_btn" id="sendSmg"><i
                                                            class="fa fa-location-arrow"></i></span>
                                                </div>
                                            </div>
                                        </div>
                                        {!! Form::close() !!}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    @endif
@endsection
@push('custom_js')
    <script src="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/jquery.magnific-popup.min.js"></script>
    <!-- social js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.13.1/highlight.min.js"></script>
    <!-- social js -->
    <script src="{{ asset('/assets/js/social-share/share-helper.js') }}"></script>
    <script src="{{ asset('/assets/js/social-share/share-main.js') }}"></script>
    <!-- lightgallery plugins -->
    <script src="{{ asset('lightgallery/lightgallery.js') }}"></script>
    <script src="{{ asset('lightgallery/thumbnail.js') }}"></script>
    <script src="{{ asset('lightgallery/zoom.js') }}"></script>
    <script type="text/javascript">
        lightGallery(document.getElementById('lightgallery'), {
            plugins: [lgZoom, lgThumbnail],
            speed: 500,
            thumbnail: true
        });
    </script>

    <script type="text/javascript">
        $(document).on('click', '#save_as_fav', function(e) {
            var adid = $(this).data('adid');
            var uid = $(this).data('uid');
            var pageurl = `{{ URL::to('/favorite-ad') }}`;
            $.ajax({
                type: 'post',
                data: {
                    'adid': adid,
                    '_token': "{{ csrf_token() }}"
                },
                url: pageurl,
                async: true,
                beforeSend: function() {
                    $("body").css("cursor", "progress");
                },
                success: function(data) {
                    if (data.status == true) {
                        toastr.success(data.msg);
                        $('#save_as_fav').text('Added as favorite');
                    } else {
                        toastr.error(data.msg);
                    }
                },
                complete: function(data) {
                    $("body").css("cursor", "default");
                }
            });
        })
        jQuery(function($) {
            $('.aaa').each(function() {
                var show_char = 400;
                var ellipses = "... ";
                var content = $(this).html();

                if (content.trim().length > show_char) {
                    var a = content.trim().substr(3, show_char); // use 3 to avoid <p>
                    var b = content.trim().substr(show_char - content.trim().length).replace('</p>',
                        ''); // replace the last </p>
                    var html = a + "<span class='truncated'>" + ellipses +
                        "</span><span class='truncated' style='display:none'>" + b +
                        "</span><a class='read-more' href='#'>{{ __('read_more') }}</a>";
                    // wrap the a into `<p></p>` then append the read more to it
                    $(this).html('<p>' + html + '</p>');
                }
            });

            $(".read-more").click(function(e) {
                e.preventDefault();
                $(this).text((i, v) => v == "{{ __('read_more') }}" ?
                    ".. {{ __('read_less') }}" :
                    "{{ __('read_more') }}"); //change here..
                $(this).closest(".aaa").find(".truncated").toggle();
            });
        });
    </script>

    @if (Auth::user())
        @include('chat._chat_script')
    @endif
    <script>
        $('.popup').magnificPopup({
            type: 'image',
            gallery: {
                enabled: true
            },
            zoom: {
                enabled: true,
                duration: 300,
            }
        });
    </script>
    <script>
        hljs.initHighlightingOnLoad();
        $('#shareBlock').cShare({
            description: 'jQuery plugin - C Share buttons...',
            showButtons: ['fb', 'line', 'plurk', 'weibo', 'twitter', 'tumblr', 'email']
        });
        $(document).on('click', '#key_search', function(e) {
            var keywords = $('#keywords').val();

            var new_url = old_url = `{{ route('ads.list') }}`;
            new_url = makeUrl(new_url, 'keywords', keywords);

            window.location.href = new_url;
        })
        $(document).on('change', '#short_by_select', function(e) {
            var short_by = $(this).val();
            var new_url = old_url = $(location).attr("href");
            var param = $(this).val();
            var arr = param.split('_');
            var order = arr[0];
            var sort = arr[1];
            var val = 0;
            new_url = makeUrl(old_url, 'sort', order);
            new_url = makeUrl(new_url, 'order', sort);
            window.location.href = new_url;
        })
        $(document).on('click', '.filter_by', function(e) {
            var new_url = old_url = $(location).attr("href");
            var param = $(this).val();
            var val = 0;
            if ($(this).is(":checked")) {
                var val = 1;
                var new_url = makeUrl(old_url, param, val);
            } else {
                var val = 0;
                var new_url = makeUrl(old_url, param, val);
            }
            new_url = makeUrl(new_url, 'page', 1);
            window.location.href = new_url;

        })

        function makeUrl(old_url, param, val) {
            var url = new URL(old_url);
            var search_params = url.searchParams;
            search_params.set(param, val);
            url.search = search_params.toString();
            return url.toString();
        }
    </script>
    <script>
        function addToCart(id) {
            $.ajax({
                type: "get",
                url: "{{ route('addToCart') }}",
                data: {
                    id: id
                },
                success: function(response) {
                    console.log(response.status);
                }
            });
        }
    </script>
@endpush
