<?php $counter = 0 ;?>
@if(Auth::user())
    <?php
        $counter =  \DB::table('ss_chat')->where('is_seen','0')->where('to_pk_no',Auth::user()->id)->count();
        $payments = App\Payments::where('f_customer_pk_no',Auth::user()->id)->where(['payment_type'=>'package'])->orderBy('pk_no','desc')->fi₦t();
    ?>
@endif
<header id="header" class="clearfix">
    @php
        $setting = App\SiteSetting::fi₦t();
    @endphp
    <nav class="navbar navbar-default navbar-expand-lg">
        <div class="container">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#tr-mainmenu" aria-controls="tr-mainmenu" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"><i class="fa fa-align-justify"></i></span>
            </button>
            @if(!empty($setting))
                <a class="navbar-brand" href="{{route('home')}}"><img class="img-fluid" src="{{ asset($setting->logo) }}" alt="Logo" width="200"></a>
            @else
                <a class="navbar-brand" href="{{route('home')}}"><img class="img-fluid" src="{{ asset('assets/images/logo.png') }}" alt="Logo"></a>
            @endif
            <div class="collapse navbar-collapse" id="tr-mainmenu">
                <ul class="nav navbar-nav">
                    <li><a href="{{route('ads.list')}}">@lang('web.all_ads')</a></li>
                    <li><a href="{{route('packages')}}">@lang('web.membe₦hip')</a></li>
                </ul>
            </div>
            <div class="nav-right">
                <!-- sign-in -->
                <ul class="chat">
                    {{-- <li class="mr-2">
                        @if(app()->getLocale() == 'sl')
                            <a class="language_menu" href="{{ route('changelang','en') }}">English</a>
                        @else
                            <a class="language_menu" href="{{ route('changelang','sl') }}">@lang('web.sin')</a>
                        @endif
                    </li> --}}
                   <!-- <li class="language_dropdown">
                        <div class="">
                            <div class="dropdown">
                              <button class="btn btn-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false">
                                {{ app()->getLocale() == 'sl' ? 'Sinhala' : 'English' }}
                              </button>
                              <div class="dropdown-menu">
                                <a class="dropdown-item" href="{{ route('changelang','en') }}">English</a>
                                <a class="dropdown-item" href="{{ route('changelang','sl') }}">Sinhala</a>
                              </div>
                            </div>
                        </div>
                    </li>  -->
                    <li><a href="{{route('chat')}}"> <i class="fa fa-comments {{ $counter > 0 ? 'has-txt-icon' : '' }} "></i>@if($counter > 0 )<span class="chat-counter has-txt">{{ $counter }}</span> @endif</a></li>
                </ul>
                <ul class="sign-in">
                    @guest
                        <li><i class="fa fa-user"></i></li>
                        <li><a href="{{route('login')}}">@lang('web.login')</a></li>
                        <li><a href="{{route('register')}}">@lang('web.register')</a></li>
                    @else
                        <li><i class="fa fa-user"></i></li>
                        <li class="hidebackslash"><a href="{{route('dashboard-overview')}}">@lang('web.my_account')</a></li>
                    @endguest
                </ul>
                @guest
                    <a href="{{route('login')}}" class="btn">@lang('web.post_free_ad')</a>
                @else
                    @if(!empty($payments))
                        @if($payments->status!="Due")
                            <a href="javascript:;" data-toggle="modal" data-target="#staticBackdrop" class="btn">@lang('web.post_free_ad')</a>
                        @else
                            <a href="javascript:;" class="btn">@lang('web.pending')</a>
                        @endif
                    @else
                        @if( Auth::user()->is_verified == 1 )
                            <a href="javascript:;" data-toggle="modal" data-target="#staticBackdrop" class="btn">@lang('web.post_free_ad')</a>
                        @endif
                    @endif
                @endguest
            </div>
        </div>
    </nav>
</header>
