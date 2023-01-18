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
    <nav class="navbar navbar-default navbar-expand-lg">
        <div class="container">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#tr-mainmenu"
                aria-controls="tr-mainmenu" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"><i class="fa fa-align-justify"></i></span>
            </button>
            @if (!empty($setting))
            <a class="navbar-brand" href="{{ route('home') }}"><img class="img-fluid" src="{{ asset($setting->logo) }}"
                    alt="Logo" width="200"></a>
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
                    <select name="lang_code" class="language_dropdown mr-2" onchange="this.form.submit()">
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
                        <option value="{{ $currency->code }}" @if(session()->get('set_currency')) {{
                            session()->get('set_currency') == $currency->code ? 'selected' : '' }} @else {{
                            $currency->default_currencies == 1 ? 'selected' : '' }} @endif >{{ $currency->code }} ( {{
                            $currency->symbol }} )</option>
                        @endforeach
                    </select>
                </form>
            </div>
            <div class="nav-right">
                <!-- sign-in -->
                <ul class="chat">
                    {{-- <li class="mr-2">
                        @if (app()->getLocale() == 'sl')
                        <a class="language_menu" href="{{ route('changelang','en') }}">English</a>
                        @else
                        <a class="language_menu" href="{{ route('changelang','sl') }}">{{ __('sin') }}</a>
                        @endif
                    </li> --}}
                    <!-- <li class="language_dropdown">
                        <div class="">
                            <div class="dropdown">
                              <button class="btn btn-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false">
                                {{ app()->getLocale() == 'sl' ? 'Sinhala' : 'English' }}
                              </button>
                              <div class="dropdown-menu">
                                <a class="dropdown-item" href="{{ route('changelang', 'en') }}">English</a>
                                <a class="dropdown-item" href="{{ route('changelang', 'sl') }}">Sinhala</a>
                              </div>
                            </div>
                        </div>
                    </li>  -->
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
                <a href="javascript:;" data-toggle="modal" data-target="#staticBackdrop" class="btn">{{
                    __('post_free_ad') }}</a>
                @else
                <a href="javascript:;" class="btn">{{ __('pending') }}</a>
                @endif
                @else
                @if (Auth::user()->is_verified == 1)
                <a href="javascript:;" data-toggle="modal" data-target="#staticBackdrop" class="btn">{{
                    __('post_free_ad') }}</a>
                @endif
                @endif
                @endguest
            </div>
        </div>
    </nav>
</header>
