@extends('admin.layout.master')

@push('custom_css')
    <link rel="stylesheet" type="text/css" href="{{ asset('app-assets/vendors/css/forms/selects/select2.min.css') }}">
@endpush

@section('Category', 'active')

@section('title') {{ __('create_sub_cate') }} @endsection
@section('page-name') {{ __('create_sub_cate') }} @endsection

@section('breadcrumb')
    <li class="breadcrumb-item">
        <a href="{{ route('admin.dashboard') }}">{{ __('admin_breadcrumb_title') }}</a>
    </li>
    <li class="breadcrumb-item active">{{ __('create_sub_cate') }}</li>
@endsection

@section('content')
    @php
        $categories_combo = $data['category_combo'] ?? [];
    @endphp
    <section id="basic-form-layouts">
        <div class="row match-height">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-content collapse show">
                        <div class="card-body">
                            {!! Form::open([
                                'route' => 'admin.sub_category.store',
                                'method' => 'post',
                                'class' => 'form-horizontal',
                                'files' => true,
                                'novalidate',
                            ]) !!}
                            <div class="row">
                                <div class="col-md-6 offset-3">
                                    <div class="form-group {!! $errors->has('category') ? 'error' : '' !!}">
                                        <label>{{ __('category') }}<span class="text-danger">*</span></label>
                                        <div class="controls">
                                            {!! Form::select('category', $categories_combo, null, [
                                                'class' => 'form-control mb-1 select2',
                                                'id' => 'category',
                                                'data-validation-required-message' => 'This field is required',
                                                'placeholder' => 'Select category',
                                                'tabindex' => 2,
                                                'data-url' => URL::to('prod_subcategory'),
                                            ]) !!}
                                            {!! $errors->first('category', '<label class="help-block text-danger">:message</label>') !!}
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 offset-3">
                                    <div class="form-group {!! $errors->has('name') ? 'error' : '' !!}">
                                        <label>{{ __('name') }}<span class="text-danger">*</span></label>
                                        <div class="controls">
                                            {!! Form::text('name', null, [
                                                'class' => 'form-control mb-1',
                                                'placeholder' => 'Enter product name',
                                                'tabindex' => 2,
                                            ]) !!}
                                            {!! $errors->first('name', '<label class="help-block text-danger">:message</label>') !!}
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-actions text-center mt-3">
                                <a href="{{ route('admin.sub_category.list') }}">
                                    <button type="button" class="btn btn-warning mr-1">
                                        <i class="ft-x"></i>{{ __('btn_cancle') }}
                                    </button>
                                </a>
                                <button type="submit" class="btn btn-primary">
                                    <i class="la la-check-square-o"></i>{{ __('btn_save') }}
                                </button>
                                {!! Form::close() !!}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </section>
@endsection

@push('custom_js')
    <script src="{{ asset('app-assets/vendors/js/forms/select/select2.full.min.js') }}"></script>\
    <script src="{{ asset('app-assets/js/scripts/forms/select/form-select2.js') }}"></script>
@endpush
