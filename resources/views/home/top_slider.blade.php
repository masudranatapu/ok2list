 <!-- world -->
        <div id="banner-two" class="parallax-section" style="background-image: url('{{ asset('banner-bg.jpg') }}');">
            <div class="row text-center">
                <!-- banner -->
                <div class="col-sm-12 ">
                    <div class="banner">
                        <h1 class="title"><span style="color:#fff;">@lang('web.ok2list_title')</span> {{ __('online_mega') }}</h1>
                        <h3>
                            <span id="break">@lang('web.buy_and_sell')</span> @lang('web.Ex')
                            <span class="typewrite" data-period="2000" data-type='[ "@lang("web.c_p")", "@lang("web.c_pp")", "@lang("web.p_h")", "@lang("web.job")" ]'> <span class="wrap"></span></span>
                        </h3>
                        <!-- banner-form -->
                        <div class="banner-form">
                            <form action="{{route('ads.list',['area' => 'Nigeria'])}}" method="get">
                                <i class="fa fa-map-marker-alt"></i>
                                <div class="dropdown category-dropdown select-category" data-toggle="modal" data-target="#divisioncitymodal">
                                    <span>@lang('web.s_loca')</span>
                                </div>
                                <i class="fa fa-tag"></i>
                                <div class="dropdown category-dropdown select-category" data-toggle="modal" data-target="#exampleModal">
                                    <span>@lang('web.s_cate')</span>
                                </div>
                                <input type="text" class="form-control" placeholder='@lang('web.type')' name="keywords">
                                <button type="submit" class="form-control" value="Search">@lang('web.search')</button>
                            </form>
                        </div><!-- banner-form -->
                    </div>
                </div><!-- banner -->
            </div><!-- row -->
        </div><!-- world -->
        <!-- Brand-logo  -->
    </div>
