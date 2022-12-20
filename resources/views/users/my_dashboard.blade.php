@extends('layouts.app')
@push('custom_css')
<link rel="stylesheet" type="text/css" href="{{asset('/assets/css/forms/validation/form-validation.css')}}">
<link rel="stylesheet" href="https://cdn.bootcss.com/toastr.js/latest/css/toastr.min.css">
@endpush
<?php
$city_combo = $data['city_combo'] ?? array();
$seller_type_combo = Config::get('static_arrays.seller_type') ?? array();


?>
@section('content')
<!-- myads-page -->
<section id="main" class="clearfix myads-page">
    <div class="container">
        <div class="breadcrumb-section">
            <!-- breadcrumb -->
            <ol class="breadcrumb">
				<li><a href="{{url('/')}}">@lang('web.home')</a></li>
                <li>@lang('web.dashboard')</li>
            </ol><!-- breadcrumb -->
        </div><!-- banner -->
        <div class="ads-info profile">
            <div class="row">
                <div class="col-xl-3 text-center">
                    <!-- header -->
                    @include('users._user_dashboard_menu')
                    <!-- end header -->
                </div>
                <!-- recommended-cta-->
                <div class="col-xl-9">
                    <div class="user-pro-section">
                        <div class="profile-details section">
                            <div class="row">
                                <div class="col-8">
                                    <h2>@lang('web.pro_details')</h2>
                                </div>
                                <div class="col-4">
                                    {{-- <div class="float-right">
                                        <a class="logoutbtn btn-sm btn-warning" href="{{ route('logout') }}" onclick="event.preventDefault();document.getElementById('logout-form').submit();">{{ __('Logout') }}</a>
                                    </div>
                                    <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                        @csrf
                                    </form> --}}
                                </div>
                            </div>
                            <a class="edit show-form" href="javascript:void(0)"><i class="fa fa-pencil"></i>Edit</a>
                            <a class="edit show-profile d-none" href="#"><i class="fa fa-eye"></i>View</a>
                            <div class="view-profile">
                                <div class="form-group">
                                    <strong><label>@lang('web.name')</label></strong>
                                    : {{Auth::user()->name}}
                                </div>
                                <div class="form-group">
                                    <strong><label>@lang('web.email')</label></strong>
                                    : {{Auth::user()->email}}
                                </div>
                                <div class="form-group">
                                    <strong><label for="name-three">@lang('web.mobile')</label></strong>
                                    : {{Auth::user()->mobile1}}
                                </div>
                                <div class="form-group">
                                    <strong><label>@lang('web.city')</label></strong>
                                    : {{Auth::user()->city}}
                                </div>
                                <div class="form-group">
                                    <strong><label>@lang('web.ima')</label></strong>
                                    : {{Auth::user()->seller_type}}
                                </div>
                                <div class="form-group">
                                    <strong><label>@lang('web.my_package')</label></strong>
                                    : {{Auth::user()->package->title ?? ''}}
                                </div>
                                @if(Auth::user()->package_id != '1')
                                @php
                                $package = App\Payments::where('f_customer_pk_no',Auth::user()->id)->orderBy('pk_no','desc')->first();
                                @endphp
                                @if($package)
                                <div class="form-group">
                                    <strong><label> @lang('web.Package_End_Date')</label></strong>
                                    : {{ date('d F, Y',strtotime($package->expired_on)) }}
                                </div>
                                @endif
                                @endif
                                <div class="form-group">
                                    <strong><label>@lang('web.Monthly_Post_Limit')</label></strong>
                                    : {{Auth::user()->package->ad_limit_in_montrh ?? ''}}
                                </div>
                            </div>
                            <div class="form d-none edit-profile">
                                {!! Form::open([ 'route' => 'my-profile-update', 'method' => 'post', 'class' => 'form-horizontal', 'files' => true , 'novalidate']) !!}
                                <div class="form-group">
                                    <strong><label>@lang('web.p_upload')</label></strong>
                                    <div class="controls">
                                        {!! Form::file('profile', [ 'class' => 'form-control mb-1', 'data-validation-required-message' => 'This field is required', 'tabindex' => 1]) !!}
                                        {!! $errors->first('image', '<label class="help-block text-danger">:Profile Photo</label>') !!}
                                    </div>
                                </div>
                                <div class="form-group">
                                    <strong><label>@lang('web.name')</label></strong>
                                    <div class="controls">
                                        {!! Form::text('name', Auth::user()->name, [ 'class' => 'form-control mb-1', 'data-validation-required-message' => 'This field is required', 'placeholder' => 'Enter name', 'tabindex' => 1]) !!}
                                        {!! $errors->first('name', '<label class="help-block text-danger">:message</label>') !!}
                                    </div>
                                </div>
                                <div class="form-group">
                                    <strong><label>@lang('web.email')</label></strong>
                                    <div class="controls">
                                        {!! Form::text('email', Auth::user()->email, [ 'class' => 'form-control mb-1', 'data-validation-required-message' => 'This field is required', 'placeholder' => 'Enter email', 'tabindex' => 2]) !!}
                                        {!! $errors->first('email', '<label class="help-block text-danger">:message</label>') !!}
                                    </div>
                                </div>
                                <div class="form-group">
                                    <strong><label for="name-three">@lang('web.mobile')</label></strong>
                                    <div class="controls">
                                        {!! Form::number('mobile', Auth::user()->mobile1, [ 'class' => 'form-control mb-1', 'data-validation-required-message' => 'This field is required', 'placeholder' => 'Enter mobile number', 'tabindex' => 3]) !!}
                                        {!! $errors->first('mobile', '<label class="help-block text-danger">:message</label>') !!}
                                    </div>
                                </div>
                                <div class="form-group">
                                    <strong><label>@lang('web.city')</label></strong>
                                    <div class="controls">
                                        {!! Form::select('city', $city_combo, Auth::user()->city, ['class'=>'form-control mb-1 ', 'id' => 'city', 'data-validation-required-message' => 'This field is required', 'placeholder' => 'Select city', 'tabindex' => 4 ]) !!}
                                        {!! $errors->first('city', '<label class="help-block text-danger">:message</label>') !!}
                                    </div>
                                </div>
                                <div class="form-group">
                                    <strong><label>@lang('web.ima')</label></strong>
                                    {!! Form::select('seller_type', $seller_type_combo, Auth::user()->seller_type, ['class'=>'form-control mb-1 ', 'id' => 'seller_type', 'data-validation-required-message' => 'This field is required', 'placeholder' => 'Select seller type', 'tabindex' => 4 ]) !!}
                                    {!! $errors->first('seller_type', '<label class="help-block text-danger">:message</label>') !!}
                                </div>
                                <a style="margin-bottom: 9px;" href="{{route('my-dashboard')}}" class="btn btn-info cancle">@lang('web.cancle')</a>
                                <button style="padding: 7px 29px 5px;" type="submit" class="btn btn-primary">@lang('web.u_profile')</button>
                                {!! Form::close() !!}
                            </div>
                        </div>
                        <!-- change-password -->
                        {!! Form::open([ 'route' => 'my-password-update', 'method' => 'post', 'class' => 'form-horizontal', 'files' => true , 'novalidate']) !!}
                        <div class="change-password section">
                            <h2>@lang('web.change_password')</h2>
                            <!-- form -->
                            <div class="form-group">
                                <label> @lang('web.old_pass')</label>
                                {!! Form::password('old_password', [ 'class' => 'form-control mb-1', 'minlength' => '6', 'data-validation-required-message' => 'This field is required', 'data-validation-minlength-message' => 'Minimum 6 characters', 'placeholder' => 'Enter old password', 'tabindex' => 2, 'autocomplete' => 'off']) !!}
                                {!! $errors->first('old_password', '<label class="help-block text-danger">:message</label>') !!}
                            </div>
                            <div class="form-group">
                                <label> @lang('web.new_pass')</label>
                                {!! Form::password('password', [ 'class' => 'form-control mb-1', 'minlength' => '6', 'data-validation-required-message' => 'This field is required', 'data-validation-minlength-message' => 'Minimum 6 characters', 'placeholder' => 'Enter password', 'tabindex' => 2, 'autocomplete' => 'off']) !!}
                                {!! $errors->first('password', '<label class="help-block text-danger">:message</label>') !!}
                            </div>
                            <div class="form-group">
                                <label> @lang('web.c_pass')</label>
                                {!! Form::password('password_confirmation', [ 'class' => 'form-control mb-1', 'minlength' => '6', 'data-validation-matches-match' => 'password', 'data-validation-matches-message' => 'Must match with password', 'data-validation-minlength-message' => 'Minimum 6 characters', 'data-validation-required-message' => 'This field is required', 'placeholder' => 'Enter confirm password', 'tabindex' => 4, 'autocomplete' => 'off']) !!}
                                {!! $errors->first('password_confirmation', '<label class="help-block text-danger">:message</label>') !!}
                            </div>
                            <a style="margin-bottom: 9px;" href="{{route('my-dashboard')}}" class="btn btn-info cancle">@lang('web.cancle')</a>
                            <button style="padding: 7px 29px 5px;" type="submit" class="btn btn-primary">@lang('web.change_password')</button>
                        </div>
                        {!! Form::close() !!}
                        <!-- change-password -->
                        <!-- preferences-settings -->
                        <div class="preferences-settings section d-none">
                            <h2>Preferences Settings</h2>
                            <!-- checkbox -->
                            <div class="checkbox">
                                <label><input type="checkbox" name="logged"> Comments are enabled on my ads </label>
                                <label><input type="checkbox" name="receive"> I want to receive newsletter.</label>
                                <label><input type="checkbox" name="want">I want to receive advice on buying and selling. </label>
                            </div><!-- checkbox -->
                        </div><!-- preferences-settings -->
                    </div><!-- user-pro-edit -->
                </div><!-- profile -->
            </div><!-- row -->
        </div><!-- row -->
    </div><!-- container -->
</section><!-- myads-page -->
@endsection
@push('custom_js')
<script src="{{asset('/assets/js/forms/validation/jqBootstrapValidation.js')}}"></script>
<script src="{{asset('/assets/js/forms/validation/form-validation.js')}}"></script>
<script src="https://cdn.bootcss.com/toastr.js/latest/js/toastr.min.js"></script>
{!! Toastr::message() !!}
<script>
$(document).on('click', '.show-form', function() {
    $('.view-profile').addClass('d-none');
    $(this).hide();
    $('.edit-profile').removeClass('d-none');
    $('.show-profile').toggleClass('d-none');
});
$(document).on('click', '.show-profile', function() {
    $('.view-profile').removeClass('d-none');
    $(this).toggleClass('d-none');
    $('.edit-profile').addClass('d-none');
    $('.show-form').show();
});

</script>
@endpush
