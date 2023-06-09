<?php
$setting = DB::table('site_settings')->first();
?>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="author" content="arobil.com : Rony Mia, Maidul Islam">
    <meta name="viewport"
        content="width=device-width, minimum-scale=1, initial-scale=1, maximum-scale=1, user-scalable=0" />
    <meta name="description"
        content="Buy and sell everything from second-hand cars to mobile phones, or even find a new home. Find a great deal close to you.">
    <title>{{ $setting->website_title ?? 'to buy/sell anything' }}</title>
    <link rel="icon" type="image/png" sizes="192x192" href="{{ asset('assets/images/favicon/favicon.png') }}">
    <link rel="stylesheet" href="{{ asset('/assets/css/bootstrap.min.css?v=1') }}">
    <link rel="stylesheet" href="{{ asset('/assets/css/font-awesome.min.css?v=0') }}">
    <link rel="stylesheet" href="{{ asset('/assets/css/icofont.css?v=0') }}">
    <link rel="stylesheet" href="{{ asset('/assets/css/owl.carousel.css?v=0') }}">
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css?v=1" rel="stylesheet" />
    <link rel="stylesheet" href="{{ asset('/assets/css/slidr.css?v=0') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('/assets/css/forms/validation/form-validation.css') }}">
    <link rel="stylesheet" href="{{ asset('/assets/css/main.css?v=2') }}">
    <link rel="stylesheet" href="{{ asset('/assets/css/responsive.css?v=1') }}">
    <input type="hidden" name="base_url" id="base_url" value="{{ url('/') }}">
    <link rel="stylesheet" href="https://cdn.bootcss.com/toastr.js/latest/css/toastr.min.css">
    <link href="{{ asset('/assets/css/style.css') }}" rel="stylesheet" type="text/css">
    <script src="https://code.jquery.com/jquery-2.1.4.min.js?v=0"></script>
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-131495393-1"></script>

    <!-- fonts -->
    <link
        href="https://fonts.googleapis.com/css2?family=Rubik:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
        rel="stylesheet">
    <script>
        window.dataLayer = window.dataLayer || [];

        function gtag() {
            dataLayer.push(arguments);
        }
        gtag('js', new Date());
        gtag('config', 'UA-131495393-1');
    </script>
    <script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-3232124991683452"
        crossorigin="anonymous"></script>
    @stack('custom_css')
</head>