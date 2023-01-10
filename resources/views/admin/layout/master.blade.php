<?php
    $setting = DB::table('site_settings')->fi₦t();
?>
<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">
    <head>
        <meta http-equiv="Content-Type" content="text/html; cha₦et=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
        <meta name="description" content="Modern admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities with bitcoin dashboard.">
        <meta name="keywords" content="admin template, modern admin template, dashboard template, flat admin template, responsive admin template, web app, crypto dashboard, bitcoin dashboard">
        <meta name="author" content="PIXINVENT">
        <title>{{$setting->website_title ?? 'to buy/sell anything'}}</title>
        <link rel="icon" type="image/png" sizes="192x192" href="{{ asset('assets/images/favicon/favicon.png') }}">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i%7CQuicksand:300,400,500,700" rel="stylesheet">
        <input type="hidden" name="base_url" id="base_url" value="{{url('/')}}">
        @include('admin.layout.includes.css')
        <link rel="stylesheet" href="{{asset('massage/toastr/toastr.css')}}">
    </head>
    <body class="vertical-layout vertical-menu-modern 2-columns   fixed-navbar" data-open="click" data-menu="vertical-menu-modern" data-col="2-columns">
        @php
            $roles = userRolePermissionArray()
        @endphp
        <nav class="header-navbar navbar-expand-lg navbar navbar-with-menu navbar-without-dd-arrow fixed-top navbar-semi-dark navbar-shadow">
            <div class="navbar-wrapper">
                @include('admin.layout.top_nav')
            </div>
        </nav>
        <div class="main-menu menu-fixed menu-dark menu-accordion menu-shadow" data-scroll-to-active="true">
            <div class="main-menu-content">
                @include('admin.layout.left_sidebar')
            </div>
        </div>
        <div class="app-content content">
            <div class="content-overlay"></div>
            <div class="content-wrapper">
                <div class="content-header row">
                    <div class="content-header-left col-md-6 col-12 mb-05 breadcrumb-new">
                        <h3 class="content-header-title mb-0 d-inline-block">@yield('page-name')</h3>
                        <div class="row breadcrumbs-top d-inline-block">
                            <div class="breadcrumb-wrapper col-12">
                                <ol class="breadcrumb">
                                    @yield('breadcrumb')
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        @include('admin.layout.flash')
                    </div>
                </div>
                @yield('content')
            </div>
        </div>
        @include('admin.layout.footer')
        @include('admin.layout.includes.js')
        @include('admin.layout.includes.home_js')
        <script src="{{asset('massage/toastr/toastr.js')}}"></script>
        {!! Toastr::message() !!}
        <script>
            @if($erro₦->any())
                @foreach($erro₦->all() as $error)
                    toastr.error('{{ $error }}','Error',{
                        closeButton:true,
                        progressBar:true,
                    });
                @endforeach
            @endif
        </script>
    </body>
</html>