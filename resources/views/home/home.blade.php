@extends('layouts.app')

@push('custom_css')
    <link rel="stylesheet" href="https://cdn.bootcss.com/toastr.js/latest/css/toastr.min.css">
    <style type="text/css">
        .footer-widget input[type="email"] {margin: 5px 0;font-weight: 300;font-size: 16px;}
        .urgent .featured-image{overflow: hidden;}
        .category-icon .img-fluid{width: 40px; height: 35px;}
    </style>
@endpush


@section('content')
    @if(Auth::user())
        <?php
            $payments = App\Payments::where('f_customer_pk_no',Auth::user()->id)->where(['payment_type'=>'package'])->orderBy('pk_no','desc')->first();
        ?>
    @endif
    <section id="home-one-info" class="clearfix home-one">
        @include('home.top_slider')
    </section>

    @if(isset($data['home_page1']) && ($data['home_page1']) != null )
        <div class="container">
             <div class="ads_banner text-center mb-5">
                 <a href="{{ $data['home_page1']->link }}" target="_blank" title="{{ $data['home_page1']->name }}"><img src="{{ fileExit($data['home_page1']->photo) }}" class="w-100" alt="{{ $data['home_page1']->name }}" style="height: 96px;"></a>
             </div>
         </div>
     @endif


    <section id="home-two-info" class="clearfix home-two">
        @include('home.popular_category')
    </section>

    <section id="home-three-info" class="clearfix home-three">
        @include('home.urgent_ads')
    </section>

    @if(isset($data['home_page2']) && ($data['home_page2']) != null )
        <div class="container">
         <div class="ads_banner text-center mb-4">
             <a href="{{ $data['home_page2']->link }}" target="_blank" title="{{ $data['home_page2']->name }}"><img src="{{ fileExit($data['home_page2']->photo) }}" class="w-100" alt="{{ $data['home_page2']->name }}" style="height: 96px;"></a>
         </div>
        </div>
     @endif

    <section id="home-four-info" class="clearfix home-four">
        @include('home.best_location')
    </section>

    @if(isset($data['home_page3']) && ($data['home_page3']) != null )
    <div class="container">
         <div class="ads_banner text-center mb-4">
             <a href="{{ $data['home_page3']->link }}" target="_blank" title="{{ $data['home_page3']->name }}"><img src="{{ fileExit($data['home_page3']->photo) }}" class="w-100" alt="{{ $data['home_page3']->name }}" style="height: 96px;"></a>
         </div>
    </div>
     @endif

    <section id="something-sell" class="clearfix parallax-section">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 text-center">
                    <h2 class="title">@lang('web.something_to_sel')</h2>
                    <h4>@lang('web.free_on_gogoads')</h4>

                    @if(!empty($payments))
						@if($payments->status!="Due")
							<a href="javascript:;" data-toggle="modal" data-target="#staticBackdrop" class="btn btn-primary">@lang('web.post_free_ad')</a>
						@else
							<a href="javascript:;" class="btn btn-primary">@lang('web.pending')</a>
						@endif
                    @else
                        @if(Auth::user())
                            @if( Auth::user()->is_verified == 1 )
                                <a href="javascript:;" data-toggle="modal" data-target="#staticBackdrop" class="btn btn-primary">@lang('web.post_free_ad')</a>
                            @endif
                        @else 
                            <a href="{{route('login')}}" class="btn btn-primary">@lang('web.post_free_ad')</a>
                        @endif
                    @endif
                </div>
            </div>
        </div>
    </section>
@endsection

@push('custom_js')
    <script src="https://cdn.bootcss.com/toastr.js/latest/js/toastr.min.js"></script>
    {!! Toastr::message() !!}
    <script src="{{asset('/assets/js/imagelazy.js')}}"></script>
    <script type="text/javascript">
        jQuery(function($) {
            $.imgLazy({ effect: 'fadeIn', viewport: true, timeout: 20 });
        });
    </script>
@endpush
