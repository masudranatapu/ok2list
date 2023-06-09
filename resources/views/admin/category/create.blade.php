@extends('admin.layout.master')

@section('web_settings', 'open')
@section('category', 'active')

@section('title') {{ __('create_cate') }} @endsection
@section('page-name') {{ __('create_cate') }} @endsection

@section('breadcrumb')
    <li class="breadcrumb-item">
        <a href="{{ route('admin.dashboard') }}">{{ __('admin_breadcrumb_title') }}</a>
    </li>
    <li class="breadcrumb-item active">{{ __('create_cate') }}</li>
@endsection
@section('content')
    @php
        $parent_cat_combo = $data['parent_category_combo'] ?? [];
    @endphp
    <section id="basic-form-layouts">
        <div class="row match-height">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-content collapse show">
                        <div class="card-body">
                            {!! Form::open([
                                'route' => 'product.category.store',
                                'method' => 'post',
                                'class' => 'form-horizontal',
                                'files' => true,
                                'novalidate',
                            ]) !!}
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group {!! $errors->has('parent') ? 'error' : '' !!}">
                                        <label>{{ __('parent_category') }}</label>
                                        <div class="controls">
                                            {!! Form::select('parent', $parent_cat_combo, null, [
                                                'class' => 'form-control mb-1 select2',
                                                'id' => 'parent',
                                                'placeholder' => 'Select parent',
                                                'tabindex' => 2,
                                            ]) !!}
                                            {!! $errors->first('parent', '<label class="help-block text-danger">:message</label>') !!}
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group {!! $errors->has('name') ? 'error' : '' !!}">
                                        <label>{{ __('name') }}<span class="text-danger">*</span></label>
                                        <div class="controls">
                                            {!! Form::text('name', null, [
                                                'class' => 'form-control mb-1',
                                                'placeholder' => 'Enter product category name',
                                                'data-validation-required-message' => 'This field is required',
                                                'tabindex' => 2,
                                            ]) !!}
                                            {!! $errors->first('name', '<label class="help-block text-danger">:message</label>') !!}
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group {!! $errors->has('description') ? 'error' : '' !!}">
                                        <label>{{ __('description') }}</label>
                                        <div class="controls">
                                            {!! Form::textarea('description', null, [
                                                'class' => 'form-control mb-1',
                                                'placeholder' => 'Enter product category description',
                                                'tabindex' => 2,
                                                'rows' => 3,
                                            ]) !!}
                                            {!! $errors->first('description', '<label class="help-block text-danger">:message</label>') !!}
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group {!! $errors->has('seo_des') ? 'error' : '' !!}">
                                        <label>{{ __('seo_des') }}</label>
                                        <div class="controls">
                                            {!! Form::textarea('seo_des', null, [
                                                'class' => 'form-control mb-1',
                                                'placeholder' => 'Enter product category seo description',
                                                'tabindex' => 2,
                                                'rows' => 3,
                                            ]) !!}
                                            {!! $errors->first('seo_des', '<label class="help-block text-danger">:message</label>') !!}
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>{{ __('logo') }} (64X64)</label>
                                        <div class="controls">
                                            <input type="file" name="logo">
                                            {!! $errors->first('logo', '<label class="help-block text-danger">:message</label>') !!}
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>{{ __('icon') }} (16X16)</label>
                                        <div class="controls">
                                            <input type="file" name="icon">
                                            {!! $errors->first('icon', '<label class="help-block text-danger">:message</label>') !!}
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>{{ __('banner') }} (970X250)</label>
                                        <div class="controls">
                                            <input type="file" name="banner">
                                            {!! $errors->first('banner', '<label class="help-block text-danger">:message</label>') !!}
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <br>
                                        <div class="controls">
                                            <label><input type="checkbox" name="is_top">
                                                <small>{{ __('is_top') }}</small></label>
                                            {!! $errors->first('is_top', '<label class="help-block text-danger">:message</label>') !!}
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <br>
                                        <div class="controls">
                                            <label><input type="checkbox" name="is_new">
                                                <small>{{ __('is_new') }}</small></label>
                                            {!! $errors->first('is_new', '<label class="help-block text-danger">:message</label>') !!}
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <br>
                                        <div class="controls">
                                            <label><input type="checkbox" name="is_feature">
                                                <small>{{ __('is_feature') }}</small></label>
                                            {!! $errors->first('is_feature', '<label class="help-block text-danger">:message</label>') !!}
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-actions text-center mt-3">
                                <a href="{{ route('product.category.list') }}">
                                    <button type="button" class="btn btn-warning mr-1">
                                        <i class="ft-x"></i>{{ __('btn_cancle') }}
                                    </button>
                                </a>
                                <button type="submit" class="btn btn-primary">
                                    <i class="la la-check-square-o"></i>{{ __('btn_save') }}
                                </button>
                            </div>
                            {!! Form::close() !!}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
