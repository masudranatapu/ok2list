<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">
<!-- BEGIN: Head-->

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta name="description" content="listorbuy.org admin login">
    <meta name="keywords" content="listorbuy admin login">
    <meta name="author" content="PIXINVENT">
    <title>Admin - Login</title>
    <link rel="icon" type="image/png" sizes="192x192" href="{{ ('assets/images/favicon/favicon.png') }} ">
    <!-- <link rel="icon" type="image/png" sizes="96x96" href="{{ ('assets/images/favicon/favicon.ico') }} "> -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i%7CQuicksand:300,400,500,700" rel="stylesheet">

    @include('admin.layout.includes.css')

</head>
<!-- END: Head-->

<!-- BEGIN: Body-->

<body class="vertical-layout vertical-menu-modern 1-column  bg-cyan bg-lighten-2 blank-page" data-open="click" data-menu="vertical-menu-modern" data-col="1-column">
<!-- BEGIN: Content-->
<div class="app-content content">
    <div class="content-overlay"></div>
    <div class="content-wrapper">
        <div class="content-header row">
        </div>
        <div class="content-body">
            <section class="row flexbox-container">
                <div class="col-12 d-flex align-items-center justify-content-center">
                    <div class="col-lg-4 col-md-8 col-10 box-shadow-2 p-0">
                        <div class="card border-grey border-lighten-3 m-0">
                            <div class="card-header border-0">
                                @if(session('flashMessageSuccess'))
                                    <div class="alert alert-success">
                                        {{session('flashMessageSuccess')}}
                                    </div>
                                @endif
                                <div class="card-title text-center">
                                    <div  class="p-1"><img width="150" src="{{url('app-assets/images/logo/logo2.png')}}" alt="branding logo" ></div>
                                </div>
                                 @if ($errors->any())
                                        <div class="alert alert-danger">
                                            @foreach ($errors->all() as $error)
                                                {{ $error }}<br/>
                                            @endforeach
                                        </div>
                                    @endif
                                <!--h6 class="card-subtitle line-on-side text-muted text-center font-small-3 pt-2"><span>Easily Using</span></h6-->
                            </div>
                            <div class="card-content">
                                <!--div class="card-body pt-0 text-center">
                                    <a href="#" class="btn btn-social mb-1 mr-1 btn-outline-facebook"><span class="la la-facebook"></span> <span class="px-1">facebook</span> </a>
                                    <a href="#" class="btn btn-social mb-1 mr-1 btn-outline-google"><span class="la la-google-plus font-medium-4"></span> <span class="px-1">google</span> </a>
                                </div-->
                                <!--p class="card-subtitle line-on-side text-muted text-center font-small-3 mx-2"><span>OR Using Account
                                            Details</span></p-->
                                <div class="card-body pt-0">
                                    <form class="form-horizontal" method="post" action="{{ route('admin.login.save') }}">
                                        @csrf
                                        <fieldset class="form-group floating-label-form-group">
                                            <label for="user-email">Email</label>
                                            <input type="email" class="form-control" name="email" placeholder="Your Email" value="{{ old('email') }}" >
                                        </fieldset>
                                        <fieldset class="form-group floating-label-form-group mb-1">
                                            <label for="user-password">Enter Password</label>
                                            <input type="password" class="form-control" name="password" placeholder="Enter Password" value="">
                                        </fieldset>
                                        <div class="form-group row">
                                            <div class="col-sm-6 col-12 text-center text-sm-left">
                                                <fieldset>
                                                    <input type="checkbox" id="remember-me" class="chk-remember">
                                                    <label for="remember-me"> Remember Me</label>
                                                </fieldset>
                                            </div>
                                            <!--div class="col-sm-6 col-12 float-sm-left text-center text-sm-right"><a href="recover-password.html" class="card-link">Forgot Password?</a></div-->
                                        </div>
                                        <button type="submit" class="btn btn-outline-info btn-block"><i class="ft-unlock"></i> Login</button>
                                    </form>
                                </div>
                                <!--p class="card-subtitle line-on-side text-muted text-center font-small-3 mx-2 my-1"><span>New to Modern
                                            ?</span></p-->
                                <!--div class="card-body">
                                    <a href="#" class="btn btn-outline-danger btn-block"><i class="la la-user"></i>
                                        Register</a>
                                </div-->
                            </div>
                        </div>
                    </div>
                </div>
            </section>

        </div>
    </div>
</div>
<!-- END: Content-->

@include('admin.layout.includes.js')

</body>
<!-- END: Body-->

</html>
