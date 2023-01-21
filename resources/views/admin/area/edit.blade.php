@extends('admin.layout.master')

@section('web_settings', 'open')
@section('area', 'active')

@section('title') {{ __('edit_area') }} @endsection
@section('page-name') {{ __('edit_area') }} @endsection

@section('breadcrumb')
    <li class="breadcrumb-item">
        <a href="{{ route('admin.dashboard') }}">{{ __('admin_breadcrumb_title') }}</a>
    </li>
    <li class="breadcrumb-item active">{{ __('edit_area') }}</li>
@endsection

@section('content')
    @php
        $parent_cat_combo = $data['parent_category_combo'] ?? [];
        $city_combo = $data['city_combo'] ?? [];
        $division_combo = $data['division_combo'] ?? [];
        $row = $data['data'];
    @endphp
    <section id="basic-form-layouts">
        <div class="row match-height">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-content collapse show">
                        <div class="card-body">
                            {!! Form::open([
                                'route' => ['admin.area.update', $row->pk_no],
                                'method' => 'post',
                                'class' => 'form-horizontal',
                                'files' => true,
                                'novalidate',
                            ]) !!}
                            <input type="hidden" name="pk_no" value="{{ $row->pk_no }}" />
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group {!! $errors->has('name') ? 'error' : '' !!}">
                                        <label>{{ __('name') }}<span class="text-danger">*</span></label>
                                        <div class="controls">
                                            {!! Form::text('name', $row->name, [
                                                'class' => 'form-control mb-1',
                                                'placeholder' => 'Enter area name',
                                                'data-validation-required-message' => 'This field is required',
                                                'tabindex' => 2,
                                            ]) !!}
                                            {!! $errors->first('name', '<label class="help-block text-danger">:message</label>') !!}
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group {!! $errors->has('city_id') ? 'error' : '' !!}">
                                        <label>{{ __('city') }}</label>
                                        <div class="controls">
                                            {!! Form::select('city_id', $city_combo, $row->city_pk_no, [
                                                'class' => 'form-control mb-1 select2',
                                                'id' => 'city_id',
                                                'placeholder' => 'Select city',
                                                'tabindex' => 2,
                                            ]) !!}
                                            {!! $errors->first('city_id', '<label class="help-block text-danger">:message</label>') !!}
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group {!! $errors->has('   division_id') ? 'error' : '' !!}">
                                        <label>{{ __('division') }}</label>
                                        <div class="controls">
                                            {!! Form::select('division_id', $division_combo, $row->division_pk_no, [
                                                'class' => 'form-control mb-1 select2',
                                                'id' => '  division_id',
                                                'placeholder' => 'Select division',
                                                'tabindex' => 2,
                                            ]) !!}
                                            {!! $errors->first('    division_id', '<label class="help-block text-danger">:message</label>') !!}
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group {!! $errors->has('order_id') ? 'error' : '' !!}">
                                        <label>{{ __('order') }}</label>
                                        <div class="controls">
                                            {!! Form::text('order_id', $row->order_id, [
                                                'class' => 'form-control mb-1',
                                                'placeholder' => 'Enter order',
                                                'tabindex' => 3,
                                            ]) !!}
                                            {!! $errors->first('order_id', '<label class="help-block text-danger">:message</label>') !!}
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <br>
                                        <br>
                                        <div class="controls">
                                            <label><input type="checkbox" name="is_active" checked="true">
                                                <small>{{ __('is_active') }}</small></label>
                                            {!! $errors->first('is_active', '<label class="help-block text-danger">:message</label>') !!}
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-actions text-center mt-3">
                                <a href="{{ route('admin.area.list') }}">
                                    <button type="button" class="btn btn-warning mr-1">
                                        <i class="ft-x"></i>{{ __('btn_cancle') }}
                                    </button>
                                </a>
                                <button type="submit" class="btn btn-primary">
                                    <i class="la la-check-square-o"></i>{{ __('btn_update') }}
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
