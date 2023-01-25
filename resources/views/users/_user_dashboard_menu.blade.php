<?php
$curent_route = request()
    ->route()
    ->getName();
?>
<div class="recommended-cta">
    <div class="cta">
        <div class="ad-profile">
            <div class="user-profile">
                <div class="user">
                    @if (!empty(Auth::user()->profile_pic_url))
                        <img src="{{ asset(Auth::user()->profile_pic_url ?? '') }}" class="rounded-circle border mb-2"
                            width="80" alt="avatar">
                    @else
                        <img src="{{ asset('assets/images/profile_img.jpg') }}" class="rounded-circle border mb-2"
                            width="80" alt="avatar">
                    @endif
                    <h2>Hello, <a href="#">{{ Auth::user()->name ?? '' }}</a></h2>
                    <h5>{{ Auth::user()->email ?? '' }}</h5>
                    <hr>
                </div>
                <div class="favorites-user">
                    <div class="my-ads">
                        <a
                            href="{{ route('my-ads') }}">{{ Auth::user()->total_post ?? 0 }}<small>{{ __('my_ads') }}</small></a>
                    </div>
                    <div class="favorites">
                        <a
                            href="{{ route('favorite-ads') }}">{{ Auth::user()->total_favorite ?? 0 }}<small>{{ __('favorites') }}</small></a>
                    </div>
                </div>
            </div><!-- user-profile -->
            @php
                $payments = App\Payments::where('f_customer_pk_no', Auth::user()->id)
                    ->where(['payment_type' => 'package'])
                    ->orderBy('pk_no', 'desc')
                    ->first();
            @endphp
            <ul class="user-menu">
                <li class="{{ $curent_route == 'dashboard-overview' ? 'active' : '' }} "><a
                        href="{{ route('dashboard-overview') }}"> {{ __('dashboard_overview') }}</a>
                </li>

                <li class="{{ $curent_route == 'my-dashboard' ? 'active' : '' }} "><a
                        href="{{ route('my-dashboard') }}"> {{ __('my_account') }}</a></li>

                @if (Auth::user()->is_verified == 1)
                    <li class="{{ $curent_route == 'my-ads' ? 'active' : '' }}"><a href="{{ route('my-ads') }}">
                            {{ __('my_ads') }}</a></li>

                    @if (Auth::user()->package_id > 1)
                        <li class="{{ $curent_route == 'my-shop' ? 'active' : '' }}"><a href="{{ route('my-shop') }}">
                                {{ __('my_shop') }}</a></li>
                    @endif

                    <li class="{{ $curent_route == 'favorite-ads' ? 'active' : '' }}"><a
                            href="{{ route('favorite-ads') }} ">{{ __('favorites') }}</a>
                    </li>

                    <li class="{{ $curent_route == 'promoted-ads' ? 'active' : '' }}"><a
                            href="{{ route('promotedads') }}"> {{ __('promote-ads') }}</a></li>
                    <li class="{{ $curent_route == 'purchase-history' ? 'active' : '' }}">
                        <a href="{{ route('purchase-history') }}">{{ __('purchasehistory') }}</a>
                    </li>
                    <li
                        class="{{ $curent_route == 'user.orders' || $curent_route == 'user.order.details' ? 'active' : '' }}">
                        <a href="{{ route('user.orders') }}">{{ __('orders') }}</a>
                    </li>
                    <li class="{{ $curent_route == 'my-membership' ? 'active' : '' }}"><a
                            href="{{ route('my-membership') }}">{{ __('billing_&_plan') }}</a></li>
                    <li class="{{ $curent_route == 'chat' ? 'active' : '' }}"><a href="{{ route('chat') }}">
                            {{ __('chat_messaging') }}</a></li>
                    <li><a href="{{ route('logout') }}"
                            onclick="event.preventDefault();document.getElementById('logout-form').submit();">{{ __('Logout') }}</a>
                    </li>
                    <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                        @csrf
                    </form>
                @else
                    <li><a href="{{ route('logout') }}"
                            onclick="event.preventDefault();document.getElementById('logout-form').submit();">{{ __('Logout') }}</a>
                    </li>
                    <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                        @csrf
                    </form>
                    <h3 class="alert alert-danger pendinguser">
                        {{ __('pending_massage') }}
                        <a class="mt-2" href="{{ route('resent-verify-user') }}">{{ __('resent_totke') }}</a>
                    </h3>
                @endif
                </li>
            </ul>
        </div>
        <!-- ad-profile -->
    </div>
</div><!-- cta -->
