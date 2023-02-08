<?php $counter = 0; ?>
@if (Auth::user())
<?php
    $counter = \DB::table('ss_chat')
        ->where('is_seen', '0')
        ->where('to_pk_no', Auth::user()->id)
        ->count();
    $payments = App\Payments::where('f_customer_pk_no', Auth::user()->id)
        ->where(['payment_type' => 'package'])
        ->orderBy('pk_no', 'desc')
        ->first();
    ?>
@endif
@php
$languages = App\Models\Language::get();
$currencies = App\Models\Currency::get();
@endphp
<header id="header" class="clearfix">
    @php
    $setting = App\SiteSetting::first();
    @endphp


    {{-- <nav class="navbar navbar-default navbar-expand-lg">
        <div class="container">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#tr-mainmenu"
                aria-controls="tr-mainmenu" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"><i class="fa fa-align-justify"></i></span>
            </button>
            @if (!empty($setting))
            <a class="navbar-brand" href="{{ route('home') }}">
                <img class="img-fluid" src="{{ asset($setting->logo) }}" alt="Logo" width="200"></a>
            @else
            <a class="navbar-brand" href="{{ route('home') }}"><img class="img-fluid"
                    src="{{ asset('assets/images/logo.png') }}" alt="Logo"></a>
            @endif

            <div class="collapse navbar-collapse" id="tr-mainmenu">
                <ul class="nav navbar-nav">
                    <li><a href="{{ route('ads.list') }}">{{ __('all_ads') }}</a></li>
                    <li><a href="{{ route('packages') }}">{{ __('membership') }}</a></li>
                </ul>
                <form action="{{ route('changelang') }}" method="get">
                    <select name="lang_code" class="mr-2 language_dropdown" onchange="this.form.submit()">
                        @foreach ($languages as $lang)
                        <option value="{{ $lang->code }}" @if (session()->has('set_lang')) {{ session()->get('set_lang')
                            == $lang->code ? 'selected' : '' }} @else {{ $lang->default_lang == 1 ? 'selected' : '' }}
                            @endif>
                            {{ $lang->name }}</option>
                        @endforeach
                    </select>
                </form>
                <form action="{{ route('changecurrency') }}" method="get">
                    <select name="currency_symbol" class="currency_dropdown" onchange="this.form.submit()">
                        @foreach ($currencies as $currency)
                        <option value="{{ $currency->code }}" @if (session()->get('set_currency')) {{
                            session()->get('set_currency') == $currency->code ? 'selected' : '' }} @else {{
                            $currency->default_currencies == 1 ? 'selected' : '' }} @endif >{{ $currency->code }} ( {{
                            $currency->symbol }} )</option>
                        @endforeach
                    </select>
                </form>
            </div>

            <div class="nav-right">
                <ul class="chat">
                    <li><a href="{{ route('chat') }}"> <i
                                class="fa fa-comments {{ $counter > 0 ? 'has-txt-icon' : '' }} "></i>
                            @if ($counter > 0)
                            <span class="chat-counter has-txt">{{ $counter }}</span>
                            @endif
                        </a></li>
                </ul>
                <ul class="sign-in">
                    @guest
                    <li><i class="fa fa-user"></i></li>
                    <li><a href="{{ route('login') }}">{{ __('login') }}</a></li>
                    <li><a href="{{ route('register') }}">{{ __('register') }}</a></li>
                    @else
                    <li><i class="fa fa-user"></i></li>
                    <li class="hidebackslash"><a href="{{ route('dashboard-overview') }}">{{ __('my_account') }}</a>
                    </li>
                    @endguest
                </ul>
                @guest
                <a href="{{ route('login') }}" class="btn">{{ __('post_free_ad') }}</a>
                @else
                @if (!empty($payments))
                @if ($payments->status != 'Due')
                <a href="javascript:void(0);" data-toggle="modal" data-target="#staticBackdrop" class="btn">{{
                    __('post_free_ad') }}</a>
                @else
                <a href="javascript:void(0);" class="btn">{{ __('pending') }}</a>
                @endif
                @else
                @if (Auth::user()->is_verified == 1)
                <a href="javascript:void(0);" data-toggle="modal" data-target="#staticBackdrop" class="btn">{{
                    __('post_free_ad') }}</a>
                @endif
                @endif
                @endguest
            </div>
        </div>
    </nav> --}}

    <nav class="navbar navbar-default navbar-expand-lg">
        <div class="container">
            @if (!empty($setting))
            <a class="navbar-brand pt-1 pb-1" href="{{ route('home') }}">
                <img class="img-fluid" src="{{ asset($setting->logo) }}" alt="Logo" width="200"></a>
            @else
            <a class="navbar-brand" href="{{ route('home') }}"><img class="img-fluid"
                    src="{{ asset('assets/images/logo.png') }}" alt="Logo"></a>
            @endif


            {{-- post btn --}}
            @guest
            <a href="{{ route('login') }}" class="btn d-block d-lg-none mobile_post_btn">{{ __('post_free_ad') }}</a>
            @else
            @if (!empty($payments))
            @if ($payments->status != 'Due')
            <a href="javascript:void(0);" data-toggle="modal" data-target="#staticBackdrop"
                class="btn d-block d-lg-none mobile_post_btn">{{ __('post_free_ad') }}</a>
            @else
            <a href="javascript:void(0);" class="btn d-block d-lg-none mobile_post_btn">{{ __('pending') }}</a>
            @endif
            @else
            @if (Auth::user()->is_verified == 1)
            <a href="javascript:void(0);" data-toggle="modal" data-target="#staticBackdrop"
                class="btn d-block d-lg-none mobile_post_btn">{{ __('post_free_ad') }}</a>
            @endif
            @endif
            @endguest

            {{-- toggle button --}}
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"><i class="fa fa-align-justify"></i></span>
            </button>


            {{-- post btn --}}
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link" href="{{ route('ads.list') }}">{{ __('all_ads') }}</a>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="{{ route('packages') }}">{{ __('membership') }}</a>
                    </li>
                    <li class="nav-item d-none d-lg-block">
                        <form action="{{ route('changelang') }}" method="get">
                            <select name="lang_code" class="mr-2 language_dropdown" onchange="this.form.submit()">
                                @foreach ($languages as $lang)
                                <option value="{{ $lang->code }}" @if (session()->has('set_lang')) {{
                                    session()->get('set_lang') == $lang->code ? 'selected' : '' }} @else {{
                                    $lang->default_lang == 1 ? 'selected' : '' }} @endif>
                                    {{ $lang->name }}</option>
                                @endforeach
                            </select>
                        </form>
                    </li>
                    <li class="nav-item d-none d-lg-block">
                        <form action="{{ route('changecurrency') }}" method="get">
                            <select name="currency_symbol" class="currency_dropdown" onchange="this.form.submit()">
                                @foreach ($currencies as $currency)
                                <option value="{{ $currency->code }}" @if (session()->get('set_currency')) {{
                                    session()->get('set_currency') == $currency->code ? 'selected' : '' }} @else {{
                                    $currency->default_currencies == 1 ? 'selected' : '' }} @endif>
                                    {{ $currency->code }} ( {{ $currency->symbol }} )</option>
                                @endforeach
                            </select>
                        </form>
                    </li>
                </ul>
                <ul class="navbar-nav ml-auto">
                    <li class="chat">
                        <a class="nav-link" href="{{ route('chat') }}"> <i
                                class="fa fa-comments {{ $counter > 0 ? 'has-txt-icon' : '' }} "></i>
                            {{ __('chat') }}
                            @if ($counter > 0)
                            <span class="chat-counter has-txt">{{ $counter }}</span>
                            @endif
                        </a>
                    </li>

                    @guest
                    <li class="nav-item">
                        <a class="nav-link" href="{{ route('login') }}">
                            <i class="fa fa-user"></i>
                            {{ __('login') }}
                        </a>
                    </li>
                    @else
                    <li class="hidebackslash nav-link">
                        <a class="nav-link" href="{{ route('dashboard-overview') }}">
                            <i class="fa fa-user"></i>
                            {{ __('my_account') }}
                        </a>
                    </li>
                    @endguest

                    @guest
                    <a href="{{ route('login') }}" class="btn d-none d-lg-block">{{ __('post_free_ad') }}</a>
                    @else
                    @if (!empty($payments))
                    @if ($payments->status != 'Due')
                    <a href="javascript:void(0);" data-toggle="modal" data-target="#staticBackdrop"
                        class="btn d-none d-lg-block">{{ __('post_free_ad') }}</a>
                    @else
                    <a href="javascript:void(0);" class="btn d-none d-lg-block">{{ __('pending') }}</a>
                    @endif
                    @else
                    @if (Auth::user()->is_verified == 1)
                    <a href="javascript:void(0);" data-toggle="modal" data-target="#staticBackdrop"
                        class="btn d-none d-lg-block">{{ __('post_free_ad') }}</a>
                    @endif
                    @endif
                    @endguest

                    <li class="nav-item d-block d-lg-none">
                        <form action="{{ route('changelang') }}" method="get">
                            <select name="lang_code" class="mr-2 language_dropdown" onchange="this.form.submit()">
                                @foreach ($languages as $lang)
                                <option value="{{ $lang->code }}" @if (session()->has('set_lang')) {{
                                    session()->get('set_lang') == $lang->code ? 'selected' : '' }} @else {{
                                    $lang->default_lang == 1 ? 'selected' : '' }} @endif>
                                    {{ $lang->name }}</option>
                                @endforeach
                            </select>
                        </form>
                    </li>
                    <li class="nav-item d-block d-lg-none">
                        <form action="{{ route('changecurrency') }}" method="get">
                            <select name="currency_symbol" class="currency_dropdown" onchange="this.form.submit()">
                                @foreach ($currencies as $currency)
                                <option value="{{ $currency->code }}" @if (session()->get('set_currency')) {{
                                    session()->get('set_currency') == $currency->code ? 'selected' : '' }} @else {{
                                    $currency->default_currencies == 1 ? 'selected' : '' }} @endif>
                                    {{ $currency->code }} ( {{ $currency->symbol }} )</option>
                                @endforeach
                            </select>
                        </form>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>