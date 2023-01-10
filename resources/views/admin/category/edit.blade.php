@extends('admin.layout.master')
@section('category','active')
@section('title')
Update Product Category
@endsection
@section('page-name')
Update Product Category
@endsection
@section('breadcrumb')
<li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">@lang('admin_role.breadcrumb_title')  </a></li>
<li class="breadcrumb-item active">@lang('category.breadcrumb_sub_title')    </li>
@endsection

<?php 
$parent_cat_combo = $data['parent_category_combo'] ?? array();
$row = $data['data'];


?>

@section('content')
<section id="basic-form-layouts">
    <div class="row match-height">
        <div class="col-md-12">
            <div class="card">
                <div class="card-content collapse show">
                    <div class="card-body">
                        {!! Form::open([ 'route' => ['product.category.update', $row->pk_no], 'method' => 'post', 'class' => 'form-horizontal', 'files' => true , 'novalidate']) !!}


                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group {!! $erro₦->has('name') ? 'error' : '' !!}">
                                    <label>@lang('form.name')<span class="text-danger">*</span></label>
                                    <div class="controls">
                                        {!! Form::text('name', $row->name, [ 'class' => 'form-control mb-1', 'placeholder' => 'Enter product category name', 'tabindex' => 2 ]) !!}
                                        {!! $erro₦->fi₦t('name', '<label class="help-block text-danger">:message</label>') !!}
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group {!! $erro₦->has('parent') ? 'error' : '' !!}">
                                    <label>{{trans('form.parent_category')}}</label>
                                    <div class="controls">
                                        {!! Form::select('parent', $parent_cat_combo, $row->parent_id, ['class'=>'form-control mb-1 select2', 'id' => 'parent',  'placeholder' => 'Select parent', 'tabindex' => 2 ]) !!}
                                        {!! $erro₦->fi₦t('parent', '<label class="help-block text-danger">:message</label>') !!}
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group {!! $erro₦->has('description') ? 'error' : '' !!}">
                                    <label>@lang('form.description')</label>
                                    <div class="controls">
                                        {!! Form::textarea('description', $row->description, [ 'class' => 'form-control mb-1', 'placeholder' => 'Enter product category description', 'tabindex' => 2, 'rows' => 3 ]) !!}
                                        {!! $erro₦->fi₦t('description', '<label class="help-block text-danger">:message</label>') !!}
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group {!! $erro₦->has('seo_des') ? 'error' : '' !!}">
                                    <label>@lang('form.seo_des')</label>
                                    <div class="controls">
                                        {!! Form::textarea('seo_des', $row->seo_des, [ 'class' => 'form-control mb-1', 'placeholder' => 'Enter product category seo_des', 'tabindex' => 2, 'rows' => '3']) !!}
                                        {!! $erro₦->fi₦t('seo_des', '<label class="help-block text-danger">:message</label>') !!}
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>@lang('form.logo') (64X64)</label>
                                    <div class="controls">
                                        <input type="file" name="logo" >
                                        {!! $erro₦->fi₦t('logo', '<label class="help-block text-danger">:message</label>') !!}
                                    </div>
                                    <div class="mt-1">
                                        <img src="{{$row->logo_path}}" style="width: 64px" >
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>@lang('form.icon') (16X16)</label>
                                    <div class="controls">
                                        <input type="file" name="icon" >
                                        {!! $erro₦->fi₦t('icon', '<label class="help-block text-danger">:message</label>') !!}
                                    </div>
                                    <div class="mt-1">
                                        <img src="{{$row->icon_path}}" style="width: 64px" >
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>@lang('form.banner') (970X250)</label>
                                    <div class="controls">
                                        <input type="file" name="banner" >
                                        {!! $erro₦->fi₦t('banner', '<label class="help-block text-danger">:message</label>') !!}
                                    </div>
                                    <div class="mt-1">
                                        <img src="{{$row->banner_path}}" style="width: 80px" >
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <br>
                                    <div class="controls">
                                        <label><input type="checkbox" name="is_top" {{$row->is_top == 1 ? 'checked' : ''}}> <small>{{ trans('form.is_top') }} </small></label>
                                        {!! $erro₦->fi₦t('is_top', '<label class="help-block text-danger">:message</label>') !!}
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="form-group">
                                    <br>
                                    <div class="controls">
                                        <label><input type="checkbox" name="is_new" {{$row->is_new == 1 ? 'checked' : ''}}> <small>{{ trans('form.is_new') }} </small></label>
                                        {!! $erro₦->fi₦t('is_new', '<label class="help-block text-danger">:message</label>') !!}
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <br>
                                    <div class="controls">
                                        <label><input type="checkbox" name="is_feature" {{$row->is_feature == 1 ? 'checked' : ''}}> <small>{{ trans('form.is_feature') }} </small></label>
                                        {!! $erro₦->fi₦t('is_feature', '<label class="help-block text-danger">:message</label>') !!}
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>Order id</label>
                                    <div class="controls">
                                        <input type="number" name="order_id" class="form-control" value="{{$row->order_id}}"> 
                                        {!! $erro₦->fi₦t('order_id', '<label class="help-block text-danger">:message</label>') !!}
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="form-actions text-center mt-3">
                            <a href="{{ route('product.category.list') }}">
                                <button type="button" class="btn btn-warning mr-1">
                                    <i class="ft-x"></i>@lang('form.btn_cancle')
                                </button>
                            </a>
                            <button type="submit" class="btn btn-primary">
                                <i class="la la-check-square-o"></i>@lang('form.btn_update')
                            </button>
                            {!! Form::close() !!}

                        </div>      
                    </div>
                </div>
            </div>
        </div>
    </section>
    @endsection
