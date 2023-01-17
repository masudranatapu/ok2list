@extends('layouts.app')

@push('custom_css')
    <link rel="stylesheet" type="text/css" href="{{ asset('/assets/css/forms/validation/form-validation.css') }}">
    <link rel="stylesheet" href="https://cdn.bootcss.com/toastr.js/latest/css/toastr.min.css">
    <style type="text/css">
        .user-account input {
            margin-bottom: 0px !important;
        }
    </style>
@endpush

<?php
$tabindex = 1;
?>

@section('content')
    <!-- signup-page -->
    <section id="main" class="clearfix user-page">
        <div class="container">

            <div class="login_wrapper">
                <div class="row d-flex justify-content-center">
                    <!-- <div class="col-lg-7">
                                                                                                                                                                                            <div class="login_content">
                                                                                                                                                                                                <div class="login_title">
                                                                                                                                                                                                    <h3>{{ __('sign_in_to_your_account') }}</h3>
                                                                                                                                                                                                </div>
                                                                                                                                                                                                <div class="login_role">
                                                                                                                                                                                                    <div class="media position-relative mb-5">
                                                                                                                                                                                                        <div class="icon">
                                                                                                                                                                                                            <img src="{{ asset('assets/images/icon/chat.png') }}" alt="">
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        <div class="login_role_article">
                                                                                                                                                                                                            <h3>{{ __('chat_messaging') }}</h3>
                                                                                                                                                                                                            <span>{{ __('access_you_chat') }}</span>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                    </div>
                                                                                                                                                                                                    <div class="media position-relative mb-5">
                                                                                                                                                                                                       <div class="icon">
                                                                                                                                                                                                            <img src="{{ asset('assets/images/icon/dashboard.png') }}" alt="">
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        <div class="login_role_article">
                                                                                                                                                                                                           {{ __('user_dashboard') }}</h3>
                                                                                                                                                                                                            <span>{{ __('maintain_a_wish') }}</span>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                    </div>
                                                                                                                                                                                                    <div class="media position-relative mb-5">
                                                                                                                                                                                                        <div class="icon">
                                                                                                                                                                                                            <img src="{{ asset('assets/images/icon/history.png') }}" alt="">
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        <div class="login_role_article">
                                                                                                                                                                                                            <h3>{{ __('track_history') }}</h3>
                                                                                                                                                                                                            {{ __('track_the_status') }}</span>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                    </div>
                                                                                                                                                                                                    <div class="media position-relative mb-5">
                                                                                                                                                                                                        <div class="icon">
                                                                                                                                                                                                            <img src="{{ asset('assets/images/icon/target.png') }}" alt="">
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        <div class="login_role_article">
                                                                                                                                                                                                            <h3>{{ __('features_listing') }}</h3>
                                                                                                                                                                                                            <span>{{ __('features_listing_get') }}</span>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                    </div>
                                                                                                                                                                                                </div>
                                                                                                                                                                                            </div>
                                                                                                                                                                                        </div> -->
                    <div class="col-md-7 col-lg-5">
                        <div class="login_form">
                            {{-- <div class="social_login">
                                <p>{{ __('iread') }}<a href="{{route('terms-conditions')}}">{{ __('t_conditions') }}</a> and <a href="{{ route('privacy-policy')}}">{{ __('privacy_policy') }}</a> ){{ __('before_proceed') }}</p>
                                <div class="social_login_btn">
                                    <div class="row">
                                        <div class="col-6">
                                            <a href="{{url('login/facebook')}}" class="facebook">
                                                <i class="fa fa-facebook"></i>
                                                <span>Facebook</span>
                                            </a>
                                        </div>
                                        <div class="col-6">
                                            <a href="{{url('login/google')}}" class="google">
                                                <i class="fa fa-google"></i>
                                                <span>Google</span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div> --}}
                            {{-- <div class="divider">
                                <p>OR</p>
                            </div> --}}

                            {!! Form::open([
                                'route' => 'register',
                                'method' => 'post',
                                'class' => 'form-horizontal',
                                'files' => true,
                                'novalidate',
                            ]) !!}

                            <div class="form-group {!! $errors->has('name') ? 'error' : '' !!}">
                                <label class="label-title">{{ __('name') }}<span class="required">*</span></label>
                                <div class="controls">
                                    {!! Form::text('name', null, [
                                        'class' => 'form-control',
                                        'data-validation-required-message' => 'This field is required',
                                        'placeholder' => 'Name',
                                        'tabindex' => $tabindex++,
                                    ]) !!}
                                    {!! $errors->first('name', '<label class="help-block text-danger">:message</label>') !!}
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="label-title">{{ __('email') }}<span class="required">*</span></label>
                                <div class="controls">
                                    {!! Form::text('email', null, [
                                        'class' => 'form-control',
                                        'data-validation-required-message' => 'This field is required',
                                        'placeholder' => 'email',
                                        'tabindex' => $tabindex++,
                                    ]) !!}
                                    {!! $errors->first('email', '<label class="help-block text-danger">:message</label>') !!}
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="label-title">{{ __('password') }}<span class="required">*</span></label>
                                <div class="controls">
                                    {!! Form::password('password', [
                                        'class' => 'form-control mb-1',
                                        'minlength' => '6',
                                        'data-validation-required-message' => 'This field is required',
                                        'data-validation-minlength-message' => 'Minimum 6 characters',
                                        'placeholder' => 'Enter  password',
                                        'tabindex' => $tabindex++,
                                        'autocomplete' => 'off',
                                    ]) !!}
                                    {!! $errors->first('password', '<label class="help-block text-danger">:message</label>') !!}
                                </div>
                            </div>



                            <div class="row">
                                <div class="col-12">
                                    <div class="user-option">
                                        <div class="checkbox pull-left">
                                            <label for="logged" class="checked">
                                                <input type="checkbox" name="tc" id="logged" required
                                                    tabindex="{{ $tabindex++ }}"
                                                    value="1">{{ __('bysigningup') }}<a
                                                    href="{{ route('terms-conditions') }}"></a>
                                            </label>
                                        </div>
                                        {!! $errors->first('tc', '<label class="help-block text-danger">:message</label>') !!}
                                    </div>
                                </div>
                            </div>
                            <div class="login_btn">{{ __('register') }}</button>
                            </div>
                            <div class="sign_up text-center">
                                <p> {{ __('already_reg') }}<a href="{{ route('login') }}">{{ __('login') }}</a></p>
                            </div>
                            {!! Form::close() !!}
                        </div>
                    </div>
                </div>
            </div>


        </div><!-- container -->
    </section><!-- signup-page -->
@endsection






@push('custom_js')
    <script src="{{ asset('/assets/js/forms/validation/jqBootstrapValidation.js') }}"></script>
    <script src="{{ asset('/assets/js/forms/validation/form-validation.js') }}"></script>
    <script src="https://cdn.bootcss.com/toastr.js/latest/js/toastr.min.js"></script>
    {!! Toastr::message() !!}
    <script type="text/javascript">
        jQuery(document).ready(function($) {
            let n1 = parseInt($('#n1').val());
            let n2 = parseInt($('#n2').val());
            let captcha = $('#captcha_input');

            captcha.keyup(function() {
                captcha.next().next().hide();
            })

            $('#captcha_input').keyup(function(e) {
                e.preventDefault();

                if (n1 + n2 !== parseInt(captcha.val())) {
                    captcha.next().next().show();
                }
            });

        })
    </script>
@endpush
