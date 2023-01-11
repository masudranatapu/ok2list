@extends('layouts.app')

@push('custom_css')
    <link rel="stylesheet" type="text/css" href="{{asset('/assets/css/forms/validation/form-validation.css')}}">
    <link rel="stylesheet" href="https://cdn.bootcss.com/toastr.js/latest/css/toastr.min.css">
    <style type="text/css">
        .user-account input {margin-bottom: 0px !important;}
    </style>
@endpush
    <?php
        $tabindex = 1;
    ?>
@section('content')
    <section id="main" class="clearfix user-page">
        <div class="container">
            <div class="login_page">
                <div class="login_wrapper">
                    <div class="row d-flex justify-content-center">
                       <!--  <div class="col-lg-7">
                            <div class="login_content">
                                <div class="login_title">
                                    <h3>@lang('web.sign_in_to_your_account')</h3>
                                </div>
                                <div class="login_role">
                                    <div class="media position-relative mb-5">
                                        <div class="icon">
                                            <img src="{{ asset('assets/images/icon/chat.png') }}" alt="">
                                        </div>
                                        <div class="login_role_article">
                                            <h3>@lang('web.chat_messaging')</h3>
                                            <span>@lang('web.access_you_chat')</span>
                                        </div>
                                    </div>
                                    <div class="media position-relative mb-5">
                                    <div class="icon">
                                            <img src="{{ asset('assets/images/icon/dashboard.png') }}" alt="">
                                        </div>
                                        <div class="login_role_article">
                                            <h3>@lang('web.user_dashboard')</h3>
                                            <span>@lang('web.maintain_a_wish')</span>
                                        </div>
                                    </div>
                                    <div class="media position-relative mb-5">
                                        <div class="icon">
                                            <img src="{{ asset('assets/images/icon/history.png') }}" alt="">
                                        </div>
                                        <div class="login_role_article">
                                            <h3>@lang('web.track_history')</h3>
                                            <span>@lang('web.track_the_status')</span>
                                        </div>
                                    </div>
                                    <div class="media position-relative mb-5">
                                        <div class="icon">
                                            <img src="{{ asset('assets/images/icon/target.png') }}" alt="">
                                        </div>
                                        <div class="login_role_article">
                                            <h3>@lang('web.features_listing')</h3>
                                            <span>@lang('web.features_listing_get')</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div> -->
                        <div class="col-md-7 col-lg-5">
                            <div class="login_form">
                                {{-- <div class="social_login">
                                    <p>@lang('web.iread')<a href="{{route('terms-conditions')}}">@lang('web.t_conditions')</a> and <a href="{{ route('privacy-policy')}}">@lang('web.privacy_policy')</a> @lang('web.before_proceed')</p>    
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
                                {!! Form::open([ 'route' => 'login', 'method' => 'post', 'class' => 'form-horizontal', 'files' => true , 'novalidate']) !!}
                                    <input type="hidden" value="{{ request()->get('referer') }}" name="referer" />
                                    <input type="hidden" value="{{ request()->get('pakid') }}" name="pakid" />
                                    <div class="form-group {!! $errors->has('email') ? 'error' : '' !!}">
                                        <label class="label-title">@lang('web.email')<span class="required">*</span></label>
                                        <div class="controls">
                                            {!! Form::text('email', null, [ 'class' => 'form-control', 'data-validation-required-message' => 'This field is required', 'placeholder' => 'Email', 'tabindex' => $tabindex++]) !!}
                                            {!! $errors->first('email', '<label class="help-block text-danger">:message</label>') !!}
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="label-title">@lang('web.password')<span class="required">*</span></label>
                                        <div class="controls">
                                            {!! Form::password('password', [ 'class' => 'form-control mb-1', 'minlength' => '6', 'data-validation-required-message' => 'This field is required', 'data-validation-minlength-message' => 'Minimum 6 characters', 'placeholder' => 'Enter  password', 'tabindex' => $tabindex++, 'autocomplete' => 'off']) !!}
                                            {!! $errors->first('password', '<label class="help-block text-danger">:message</label>') !!}
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-6">
                                            <div class="user-option">
                                                <div class="checkbox pull-left">
                                                    <label for="logged"><input type="checkbox" name="logged" id="logged"> @lang('web.remember')</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="forgot_pass float-right">
                                                <a href="{{ route('password.request') }}">@lang('web.forget_password')</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="login_btn">
                                        <button type="submit" class="btn w-100">@lang('web.login')</button>
                                    </div>
                                    <div class="sign_up text-center">
                                        <p><a href="{{ route('register') }}">@lang('web.sign_up')</a></p>
                                    </div>
                                    {!! Form::close() !!}
                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- row -->
        </div><!-- container -->
    </section>
@endsection

@push('custom_js')
    <script src="{{asset('/assets/js/forms/validation/jqBootstrapValidation.js')}}"></script>
    <script src="{{asset('/assets/js/forms/validation/form-validation.js')}}"></script>
    <script src="https://cdn.bootcss.com/toastr.js/latest/js/toastr.min.js"></script>
    {!! Toastr::message() !!}
    <script type="text/javascript">
            jQuery(document).ready(function ($) {
                let n1 = parseInt($('#n1').val());
                let n2 = parseInt($('#n2').val());
                let captcha = $('#captcha_input');

                captcha.keyup(function () {
                    captcha.next().next().hide();
                })

                $('#captcha_input').keyup(function (e) {
                    e.preventDefault();

                    if (n1 + n2 !== parseInt(captcha.val())) {
                        captcha.next().next().show();
                    }
                });

            })

    </script>
@endpush
