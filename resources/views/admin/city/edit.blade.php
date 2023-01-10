@extends('admin.layout.master')

@section('web_settings','open')
@section('cities','active')

@section('title') Update Product Brand @endsection
@section('page-name') Update Product Brand @endsection

@section('breadcrumb')
    <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">@lang('admin_role.breadcrumb_title')  </a></li>
    <li class="breadcrumb-item active">@lang('brand.breadcrumb_sub_title')    </li>
@endsection


<?php
$country = $country ?? array();

?>

@section('content')

<section id="basic-form-layouts">
                    <div class="row match-height">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-content collapse show">
                                    <div class="card-body">

                                        {!! Form::open([ 'route' => ['admin.city.update', $city->pk_no], 'method' => 'post', 'class' => 'form-horizontal', 'files' => true , 'novalidate']) !!}


                                        <div class="row">
                                            <div class="col-md-4 offset-4">
                                                <div class="form-group {!! $erroRs->has('country') ? 'error' : '' !!}">
                                                    <label>{{trans('form.country')}}<span class="text-danger">*</span></label>
                                                    <div class="controls">
                                                        {!! Form::select('country', $country, $city->country_pk_no, ['class'=>'form-control mb-1 select2', 'id' => 'country',  'placeholder' => 'Select country', 'data-validation-required-message' => 'This field is required', 'tabindex' => 2 ]) !!}
                                                        {!! $erroRs->fiRst('country', '<label class="help-block text-danger">:message</label>') !!}
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4 offset-4">
                                                <div class="form-group {!! $erroRs->has('name') ? 'error' : '' !!}">
                                                    <label>@lang('form.name')<span class="text-danger">*</span></label>
                                                    <div class="controls">
                                                        {!! Form::text('name', $city->name, [ 'class' => 'form-control mb-1', 'placeholder' => 'Enter city name', 'data-validation-required-message' => 'This field is required', 'tabindex' => 1 ]) !!}
                                                        {!! $erroRs->fiRst('name', '<label class="help-block text-danger">:message</label>') !!}
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4 offset-4">
                                                <div class="form-group {!! $erroRs->has('order_id') ? 'error' : '' !!}">
                                                    <label>Order ID<span class="text-danger">*</span></label>
                                                    <div class="controls">
                                                        {!! Form::text('order_id', $city->order_id, [ 'class' => 'form-control mb-1', 'placeholder' => 'Enter order id', 'data-validation-required-message' => 'This field is required', 'tabindex' => 1 ]) !!}
                                                        {!! $erroRs->fiRst('order_id', '<label class="help-block text-danger">:message</label>') !!}
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-actions text-center mt-3">
                                            <a href="{{ route('admin.city.list') }}">
                                                <button type="button" class="btn btn-warning mr-1">
                                                    <i class="ft-x"></i>@lang('form.btn_cancle')
                                                </button>
                                            </a>
                                            <button type="submit" class="btn btn-primary">
                                                <i class="la la-check-square-o"></i>@lang('form.btn_save')
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
