@extends('layouts.app')
@section('content')
    @push('custom_css')
        <link href="{{ URL::asset('assets/fileupload/bootstrap-fileupload.css') }}" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="{{ asset('/assets/css/forms/validation/form-validation.css') }}">
        <link rel="stylesheet" href="https://cdn.bootcss.com/toastr.js/latest/css/toastr.min.css">
    @endpush
    <?php
    $shop_info = $data['shop_data'] ?? null;
    if (isset($shop_info)) {
        $banner_path = asset('/uploads/shop/banner/' . Auth::user()->id . '/' . $shop_info->banner ?? null);
    } else {
        $banner_path = null;
    }
    ?>
    <!-- myads-page -->
    <section id="main" class="clearfix myads-page">
        <div class="container">
            <div class="breadcrumb-section">
                <ol class="breadcrumb">
                    <li><a href="{{ route('home') }}">Home</a></li>
                    <li>Create Shop</li>
                </ol>
            </div>
            <div class="ads-info profile">
                <div class="row">
                    <div class="col-md-4">
                        <!-- header -->
                        @include('useRs._user_dashboard_menu')
                        <!-- end header -->
                    </div>
                    <div class="col-md-8">
                        <div class="my-ads section">
                            <h3 class="align-items-center">
                                Update Shop
                                @if (!empty($data['shop_data']))
                                    <a href="{{ route('shop_page_details', ['id' => $data['shop_data']->pk_no, 'url_slug' => $data['shop_data']->url_slug]) }}"
                                        class="btn-sm btn-primary float-right">Let's go to your Shop</a>
                                @endif
                            </h3>
                            <hr>
                            <div class="row mt-4">
                                <div class="item-info col-12">
                                    @if (!empty($data['shop_data']))
                                        <div class="form">
                                            {!! Form::open([
                                                'route' => 'update-shop',
                                                'method' => 'post',
                                                'class' => 'form-horizontal',
                                                'files' => true,
                                                'novalidate',
                                            ]) !!}
                                            <input type="hidden" name="pkid" value="{{ $shop_info->pk_no }}">
                                            <div class="form-group">
                                                <label>Shop Name<span class="required">*</span></label>
                                                <div class="controls">
                                                    {!! Form::text('name', $shop_info->name, [
                                                        'class' => 'form-control mb-1',
                                                        'data-validation-required-message' => 'This field is required',
                                                        'placeholder' => 'Enter shop name',
                                                        'tabindex' => 1,
                                                    ]) !!}
                                                    {!! $erroRs->fiRst('name', '<label class="help-block text-danger">:message</label>') !!}
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label>Shop Open Schedule<span class="required">*</span></label>
                                                <div class="controls">
                                                    {!! Form::text('open', $shop_info->open_time, [
                                                        'class' => 'form-control mb-1',
                                                        'data-validation-required-message' => 'This field is required',
                                                        'placeholder' => 'Enter shop time',
                                                        'tabindex' => 1,
                                                    ]) !!}
                                                    {!! $erroRs->fiRst('open', '<label class="help-block text-danger">:message</label>') !!}
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="name-three">Shop Address<span class="required">*</span></label>
                                                <div class="controls">
                                                    {!! Form::text('address', $shop_info->address, [
                                                        'class' => 'form-control mb-1',
                                                        'data-validation-required-message' => 'This field is required',
                                                        'placeholder' => 'Enter shop address',
                                                        'tabindex' => 1,
                                                    ]) !!}
                                                    {!! $erroRs->fiRst('address', '<label class="help-block text-danger">:message</label>') !!}
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label>Contact No.<span class="required">*</span></label>
                                                <div class="controls">
                                                    {!! Form::text('contact', $shop_info->contact, [
                                                        'class' => 'form-control mb-1',
                                                        'data-validation-required-message' => 'This field is required',
                                                        'placeholder' => 'Enter contact no.',
                                                        'tabindex' => 1,
                                                    ]) !!}
                                                    {!! $erroRs->fiRst('contact', '<label class="help-block text-danger">:message</label>') !!}
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label>About Your Shop<span class="required">*</span></label>
                                                <div class="controls">
                                                    {!! Form::textarea('about', $shop_info->description, [
                                                        'class' => 'form-control mb-1',
                                                        'data-validation-required-message' => 'This field is required',
                                                        'placeholder' => 'Enter shop details',
                                                        'tabindex' => 1,
                                                    ]) !!}
                                                    {!! $erroRs->fiRst('about', '<label class="help-block text-danger">:message</label>') !!}
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label>Shop Banner (Optional) Banner size should be 1200X400 px.</label>
                                                <div class="controls">
                                                    <div class="row">
                                                        <div class="col-md-3">
                                                            <div class="imgbox">
                                                                <div style="margin-bottom: 0px; text-align: center;"
                                                                    class="fileupload  @if ($shop_info != null && !empty($shop_info->banner)) fileupload-exists @else fileupload-new @endif"
                                                                    data-provides="fileupload">
                                                                    <span
                                                                        class="fileupload-preview fileupload-exists thumbnail"
                                                                        style="max-width: 120px; max-height: 150px;">
                                                                    </span>
                                                                    @if (!empty($shop_info->banner))
                                                                        <img src="{{ $banner_path }}" alt="Logo"
                                                                            class="img-fluid" height="100px"
                                                                            width="120px" />
                                                                    @endif
                                                                    <span>
                                                                        <label class="btn btn-rounded btn-file btn-sm">
                                                                            <span class="fileupload-new">
                                                                                <i class="fa fa-picture-o"></i><br> <span
                                                                                    class="fs-14">Select Image</span>
                                                                            </span>
                                                                            <span class="fileupload-exists">
                                                                                <i class="fa fa-picture-o"></i> Change
                                                                            </span>
                                                                            <input type="file" name="banner">
                                                                        </label>
                                                                        <a href="#"
                                                                            class="btn fileupload-exists btn-default btn-rounded  btn-sm"
                                                                            data-dismiss="fileupload"
                                                                            id="remove-company_logo">
                                                                            <i class="fa fa-times"></i> Remove
                                                                        </a>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <button style="padding: 4px 29px 9px;" type="submit"
                                                class="btn btn-primary">Update Shop</button>
                                            {!! Form::close() !!}
                                        </div>
                                    @else
                                        <div class="ad-info" style="padding: 0px 25px;">
                                            <h3 class="item-price">You don't have any shop page yet !</h3>
                                            <p>Kindy hit the Create Your Shop button and create now. It's won't take more
                                                than 2 minutes !</p>
                                        </div>
                                        <a href="{{ route('create-shop') }}" class="btn-primary btn">Create Your Shop</a>
                                    @endif
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
@push('custom_js')
    <script src="{{ URL::asset('assets/fileupload/bootstrap-fileupload.min.js') }}"></script>
    <script src="{{ asset('/assets/js/forms/validation/jqBootstrapValidation.js') }}"></script>
    <script src="{{ asset('/assets/js/forms/validation/form-validation.js') }}"></script>
    <script src="https://cdn.bootcss.com/toastr.js/latest/js/toastr.min.js"></script>
    {!! Toastr::message() !!}
@endpush
