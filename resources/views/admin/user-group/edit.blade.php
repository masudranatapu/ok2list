@extends('admin.layout.master')
@section('user-group', 'active')
@section('User Management', 'open')
@section('title')
    {{ __('user_group_edit') }}
@endsection
@section('page-name')
    {{ __('user_group_edit') }}
@endsection
@section('breadcrumb')
    <li class="breadcrumb-item">
        <a href="{{ route('admin.dashboard') }}">{{ __('admin_breadcrumb_title') }}</a>
    </li>
    <li class="breadcrumb-item active">
        {{ __('user_group_edit') }}
    </li>
@endsection
@section('content')
    <div class="col-md-12">
        <div class="card" style="height: 981.5px;">
            <div class="card-header">
                <h4 class="card-title" id="basic-layout-colored-form-control">{{ __('edit_group_form_title') }}</h4>
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
                        'route' => ['admin.user-group.update', $userGroup->id],
                        'method' => 'post',
                        'class' => 'form-horizontal',
                        'files' => true,
                        'novalidate',
                    ]) !!}
                    @csrf
                    <div class="form-body">
                        <div class="col-md-6 offset-3">
                            <div class="form-group">
                                <label>Name</label>
                                <div class="controls">
                                    {!! Form::text('user_group_name', $userGroup->group_name, [
                                        'class' => 'form-control mb-1',
                                        'data-validation-required-message' => __('field_required'),
                                        'placeholder' => __('name'),
                                        'tabindex' => 1,
                                    ]) !!}
                                </div>
                                @if ($errors->has('user_group_name'))
                                    <div class="alert alert-danger">
                                        <strong>{{ $errors->first('user_group_name') }}</strong>
                                    </div>
                                @endif
                            </div>
                        </div>
                        <div class="col-md-6 offset-3">
                            <div class="form-group">
                                <label>{{ __('new_group_form_filed_role') }}</label>
                                <div class="controls">
                                    {!! Form::select('role', $role, $userGroup->role_id, [
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
                        <div class="form-actions text-center mt-3">
                            <a href="{{ route('admin.permission-group') }}">
                                <button type="button" class="btn btn-warning mr-1">
                                    <i class="ft-x"></i>{{ __('btn_cancle') }}
                                </button>
                            </a>
                            <button type="submit" class="btn btn-primary">
                                <i class="la la-check-square-o"></i>{{ __('btn_save') }}
                            </button>
                        </div>
                    </div>
                    {!! Form::close() !!}
                </div>
            </div>
        </div>
    </div>
@endsection
