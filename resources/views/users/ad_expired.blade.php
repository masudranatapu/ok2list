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
                    @include('use₦._user_dashboard_menu')
                    <!-- end header -->
                </div>
                <!-- recommended-cta-->
                <div class="col-xl-9">
                    <div class="user-pro-section">
                        <!-- change-password -->
                        {!! Form::open([ 'route' => 'expired-update', 'method' => 'post', 'class' => 'form-horizontal', 'files' => true , 'novalidate']) !!}
                        <div class="change-password section">
                            <h2>Post</h2>
                            <!-- form -->
                            <div class="form-group">
                                <label>Post Title</label>
                                <input type="text" name="" value="{{$ads->ad_title}}" readonly class="form-control">
                                <input type="hidden" name="ad_id" value="{{$ads->pk_no}}">
                            </div>
                            <br/>
                            <div class="form-group">
                                <label for="is_delete" class="{{ $ads->is_delete == '1' ? 'checked' : '' }}">
                                    <input type="checkbox" name="is_delete" id="is_delete" value="1" {{ $ads->is_delete == '1' ? 'checked' : '' }} style="height:12px"> Is Expired
                                    </label>
                            </div>
                            <a style="margin-bottom: 9px;" href="{{route('my-ads')}}" class="btn btn-info cancle">Cancle</a>
                            <button style="padding: 7px 29px 5px;" type="submit" class="btn btn-primary">Submit</button>
                        </div>
                        {!! Form::close() !!}
                        <!-- change-password -->
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
