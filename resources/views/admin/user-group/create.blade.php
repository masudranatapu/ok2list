@extends('admin.layout.master')
@section('user-group', 'active')
@section('User Management', 'open')
@section('title')
    {{ __('create_user_group') }}
@endsection
@section('page-name')
    {{ __('create_user_group') }}
@endsection
@section('breadcrumb')
    <li class="breadcrumb-item">
        <a href="{{ route('admin.dashboard') }}">{{ __('admin_breadcrumb_title') }}</a>
    </li>
    <li class="breadcrumb-item active">
        {{ __('create_user_group') }}
    </li>
@endsection
@section('content')
    <div class="card" style="height: 281.5px;">
        <div class="card-header">
            <h4 class="card-title" id="basic-layout-colored-form-control"><i class="ft-plus text-primary"></i>
                {{ __('new_group_form_title') }}</h4>
            <a class="heading-elements-toggle"><i class="la la-ellipsis-v font-medium-3"></i></a>
            <div class="heading-elements">
                <ul class="list-inline mb-0">
                    <li><a data-action="collapse"><i class="ft-minus"></i></a></li>
                    <li><a data-action="reload"><i class="ft-rotate-cw"></i></a></li>
                    <li><a data-action="expand"><i class="ft-maximize"></i></a></li>
                    <li><a data-action="close"><i class="ft-x"></i></a></li>
                </ul>
            </div>
        </div>
        <div class="card-content collapse show">
            <div class="card-body" style="background:#fff;">
                {!! Form::open([
                    'route' => 'admin.user-group.store',
                    'method' => 'post',
                    'class' => 'form-horizontal error',
                    'files' => true,
                    'novalidate',
                ]) !!}
                @csrf
                <div class="col-md-6 offset-3">
                    <div class="form-group">
                        <label>{{ __('new_group_form_filed_name') }}</label><span class="required">*</span>
                        <div class="controls">
                            {!! Form::text('user_group_name', null, [
                                'class' => 'form-control mb-1',
                                'data-validation-required-message' => __('field_required'),
                                'placeholder' => __('new_group_form_placeholder'),
                                'tabindex' => 1,
                            ]) !!}
                        </div>
                        @if ($errors->has('user_group_name'))
                            <div class="help-block">
                                <ul role="alert">
                                    <li>{{ $errors->first('user_group_name') }}</li>
                                </ul>
                            </div>
                        @endif
                    </div>
                </div>
                <div class="col-md-6 offset-3">
                    <div class="form-group">
                        <label>{{ __('new_group_form_filed_role') }}</label>
                        <div class="controls">
                            {!! Form::select('role', $role, null, [
                                'class' => 'form-control mb-1',
                                'placeholder' => 'Select role name',
                                'data-validation-required-message' => __('field_required'),
                            ]) !!}
                        </div>
                        @if ($errors->has('role'))
                            <span class="alert alert-danger">
                                <strong>{{ $errors->first('role') }}</strong>
                            </span>
                        @endif
                    </div>
                </div>
                <div class="form text-center">
                    <a href="{{ route('admin.user-group') }}">
                        <button type="button" class="btn btn-warning mr-1">
                            <i class="ft-x"></i> {{ __('btn_cancle') }}
                        </button>
                    </a>
                    <button type="submit" class="btn btn-primary">
                        <i class="la la-check-square-o"></i> {{ __('btn_save') }}
                    </button>
                </div>

                {!! Form::close() !!}
            </div>
        </div>
    </div>
    </div>
@endsection
