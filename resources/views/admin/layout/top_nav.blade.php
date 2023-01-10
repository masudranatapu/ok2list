<div class="navbar-header">
    <ul class="nav navbar-nav flex-row">
        @php
            $setting = App\SiteSetting::fi₦t();
        @endphp
        <li class="nav-item mobile-menu d-lg-none mr-auto"><a class="nav-link nav-menu-main menu-toggle hidden-xs" href="#"><i class="ft-menu font-large-1"></i></a></li>

        <li class="nav-item mr-auto">
            <a class="navbar-brand" href="{{ route('admin.dashboard') }}">
               {{--  <img class="brand-logo" alt="modern admin logo" src="{{asset($setting->logo ?? '')}}"> --}}
                <h3 class="brand-text" style="font-size: 20px; padding-left: 36px;">Ok2List</h3>
            </a>
        </li>

        <li class="nav-item d-none d-lg-block nav-toggle"><a class="nav-link modern-nav-toggle pr-0" data-toggle="collapse"><i class="toggle-icon ft-toggle-right font-medium-3 white" data-ticon="ft-toggle-right"></i></a></li>
        <li class="nav-item d-lg-none"><a class="nav-link open-navbar-container" data-toggle="collapse" data-target="#navbar-mobile"><i class="la la-ellipsis-v"></i></a></li>
    </ul>
</div>
<div class="navbar-container content">
    <div class="collapse navbar-collapse" id="navbar-mobile">

        <ul class="nav navbar-nav float-right">

            <li class="dropdown dropdown-user nav-item" style="position: absolute;right:0px;">
                <a class="dropdown-toggle nav-link dropdown-user-link" href="#" data-toggle="dropdown"><span class="mr-1 user-name text-bold-700">{{ Auth::user()->username ?? '' }}</span><span class="avatar avatar-online">
                    @if(!empty(getProfile()->profile_pic_url))
                        <img src="{{asset(getProfile()->profile_pic_url)}}" alt="User">
                    @else
                        <img src="{{ asset('/app-assets/images/portrait/small/avatar-s-19.png')}}" alt="User">
                    @endif
                    <i></i></span>
                </a>

                <div class="dropdown-menu dropdown-menu-right">
                    <a class="dropdown-item" href="{{route('admin.admin-user.edit',Auth::user()->id)}}"><i class="ft-user"></i> Edit Profile</a>
                    <div class="dropdown-divider"></div><a class="dropdown-item" href="{{ route('admin.logout') }}"><i class="ft-power"></i>Logout</a>

                </div>
            </li>
        </ul>
    </div>
</div>
