@extends('admin.layout.master')
@section('permission', 'active')
@section('Role Management', 'open')
@section('title')
{{ __('edit_permission') }}
@endsection
@section('page-name')
{{ __('edit_permission') }}
@endsection
@section('breadcrumb')
    <li class="breadcrumb-item">
        <a href="{{ route('admin.dashboard') }}">{{ __('admin_breadcrumb_title') }}</a>
    </li>
    <li class="breadcrumb-item active">
        {{ __('edit_permission') }}
    </li>
@endsection
@section('content')
    <div class="col-md-12">
        <div class="card" style="height: 981.5px;">
            <div class="card-header">
                <h4 class="card-title" id="basic-layout-colored-form-control">{{ __('edit_action_form_title') }}</h4>
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
                <div class="card-body">
                    {!! Form::open([
                        'route' => ['admin.permission.update', $permission->id],
                        'method' => 'post',
                        'class' => 'form-horizontal',
                        'files' => true,
                        'novalidate',
                    ]) !!}
                    @csrf
                    <div class="form-body">
                        <div class="col-md-6 offset-3">
                            <div class="form-group">
                                <label>{{ __('new_action_form_field_menuslug') }}</label>
                                <div class="controls">
                                    {!! Form::text('permission_slug', $permission->name, [
                                        'class' => 'form-control mb-1',
                                        'data-validation-required-message' => __('field_required'),
                                        'placeholder' => __('new_action_form_field_menuslug'),
                                        'tabindex' => 1,
                                    ]) !!}
                                </div>
                                @if ($errors->has('permission_slug'))
                                    <div class="alert alert-danger">
                                        <strong>{{ $errors->first('permission_slug') }}</strong>
                                    </div>
                                @endif
                            </div>
                        </div>
                        <div class="col-md-6 offset-3">
                            <div class="form-group">
                                <label>{{ __('display_name') }}</label>
                                <div class="controls">
                                    {!! Form::text('display_name', $permission->display_name, [
                                        'class' => 'form-control mb-1',
                                        'data-validation-required-message' => __('field_required'),
                                        'placeholder' => __('display_name'),
                                        'tabindex' => 2,
                                    ]) !!}
                                </div>
                                @if ($errors->has('display_name'))
                                    <div class="alert alert-danger">
                                        <strong>{{ $errors->first('display_name') }}</strong>
                                    </div>
                                @endif
                            </div>
                        </div>
                        <div class="col-md-6 offset-3">
                            <div class="form-group">
                                <label>{{ __('per_group') }}</label>
                                <div class="controls">
                                    {!! Form::select('permission_group', $group, $permission->permission_group_id, [
                                        'class' => 'form-control mb-1',
                                        'placeholder' => __('per_group'),
                                        'data-validation-required-message' => __('field_required'),
                                    ]) !!}
                                </div>
                                @if ($errors->has('permission_group'))
                                    <div class="alert alert-danger">
                                        <strong>{{ $errors->first('permission_group') }}</strong>
                                    </div>
                                @endif
                            </div>
                        </div>
                        <div class="form-actions text-center">
                            <a href="{{ route('admin.permission') }} ">
                                <button type="button" class="btn btn-warning mr-1">
                                    <i class="ft-x"></i> {{ __('btn_cancle') }}
                                </button>
                            </a>
                            <button type="submit" class="btn btn-primary">
                                <i class="la la-check-square-o"></i> {{ __('btn_edit') }}
                            </button>
                        </div>
                    </div>
                    {!! Form::close() !!}
                </div>
            </div>
        </div>
    </div>
@endsection
