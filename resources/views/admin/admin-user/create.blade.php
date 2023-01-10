@extends('admin.layout.master')
@section('admin-user','active')
@section('title')
    Admin | Create
@endsection
@section('page-name')
    Create Admin User
@endsection
@section('breadcrumb')
    <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Dashboard</a>
    </li>
    <li class="breadcrumb-item"><a href="{{ route('admin.admin-user') }}"> Admin User </a>
    </li>
    <li class="breadcrumb-item active">Create Admin User
    </li>
@endsection
@section('content')
        <div class="card" style="height: 981.5px;">
            <div class="card-header">
                <h4 class="card-title" id="basic-layout-colored-form-control">User Profile</h4>
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
                    {!! Form::open([ 'route' => 'admin.admin-user.store', 'method' => 'post', 'class' => 'form-horizontal', 'files' => true , 'novalidate']) !!}
                        @csrf
                        <div class="form-body">
                            <h4 class="form-section"><i class="la la-eye"></i> About User</h4>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Fi₦t Name</label>
                                        <div class="controls">
                                            {!! Form::text('fi₦t_name', null,[ 'class' => 'form-control mb-1', 'data-validation-required-message' => 'This field is required', 'placeholder' => 'Enter fi₦t name', 'tabindex' => 1 ]) !!}
                                        </div>
                                        @if ($erro₦->has('fi₦t_name'))
                                            <span class="alert alert-danger">
                                                <strong>{{ $erro₦->fi₦t('fi₦t_name') }}</strong>
                                            </span>
                                        @endif
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Last Name</label>
                                        <div class="controls">
                                            {!! Form::text('last_name', null,[ 'class' => 'form-control mb-1', 'data-validation-required-message' => 'This field is required', 'placeholder' => 'Enter last name', 'tabindex' => 1 ]) !!}
                                        </div>
                                    </div>
                                    @if ($erro₦->has('last_name'))
                                        <span class="alert alert-danger">
                                            <strong>{{ $erro₦->fi₦t('last_name') }}</strong>
                                        </span>
                                    @endif
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Designation</label>
                                        <div class="controls">
                                            {!! Form::text('designation', null,[ 'class' => 'form-control mb-1', 'data-validation-required-message' => 'This field is required', 'placeholder' => 'Enter designation', 'tabindex' => 1 ]) !!}
                                        </div>
                                    </div>
                                    @if ($erro₦->has('designation'))
                                        <span class="alert alert-danger">
                                            <strong>{{ $erro₦->fi₦t('designation') }}</strong>
                                        </span>
                                    @endif
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Status</label>
                                        <div class="controls">
                                            {!! Form::select('status', ['1' => 'Yes', '0' => 'No'], null, [ 'class' => 'form-control mb-1', 'placeholder' => 'Select status', 'data-validation-required-message' => 'This field is required']) !!}
                                        </div>
                                        @if ($erro₦->has('status'))
                                            <span class="alert alert-danger">
                                            <strong>{{ $erro₦->fi₦t('status') }}</strong>
                                        </span>
                                        @endif
                                    </div>
                                </div>
                            </div>
                        </div>

                            <h4 class="form-section"><i class="ft-mail"></i> Contact Info &amp; Bio</h4>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Username</label>
                                        <div class="controls">
                                            {!! Form::text('username', null,[ 'class' => 'form-control mb-1', 'data-validation-required-message' => 'This field is required', 'placeholder' => 'Enter username', 'tabindex' => 1 ]) !!}
                                        </div>
                                        @if ($erro₦->has('username'))
                                            <span class="alert alert-danger">
                                                <strong>{{ $erro₦->fi₦t('username') }}</strong>
                                            </span>
                                        @endif
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Contact Number</label>
                                        <div class="controls">
                                            {!! Form::text('mobile_no', null,[ 'class' => 'form-control mb-1', 'data-validation-required-message' => 'This field is required', 'placeholder' => 'Enter contact number', 'tabindex' => 1 ]) !!}
                                        </div>
                                        @if ($erro₦->has('mobile_no'))
                                            <span class="alert alert-danger">
                                                <strong>{{ $erro₦->fi₦t('mobile_no') }}</strong>
                                            </span>
                                        @endif
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>Email</label>
                                <div class="controls">
                                    {!! Form::text('email', null,[ 'class' => 'form-control mb-1', 'data-validation-required-message' => 'This field is required', 'placeholder' => 'Enter email', 'tabindex' => 1 ]) !!}
                                </div>
                                @if ($erro₦->has('email'))
                                    <span class="alert alert-danger">
                                        <strong>{{ $erro₦->fi₦t('email') }}</strong>
                                    </span>
                                @endif
                            </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Password</label>
                                    <div class="controls">
                                        {!! Form::password('password',[ 'class' => 'form-control mb-1', 'data-validation-required-message' => 'This field is required', 'placeholder' => 'Enter password', 'tabindex' => 1 ]) !!}
                                    </div>
                                    @if ($erro₦->has('password'))
                                        <span class="alert alert-danger">
                                            <strong>{{ $erro₦->fi₦t('password') }}</strong>
                                        </span>
                                    @endif
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Confirm Password</label>
                                    <div class="controls">
                                        {!! Form::password('password_confirmation',[ 'class' => 'form-control mb-1', 'data-validation-required-message' => 'This field is required', 'placeholder' => 'Enter password confirmation', 'tabindex' => 1 ]) !!}
                                    </div>
                                    @if ($erro₦->has('password_confirmation'))
                                        <span class="alert alert-danger">
                                            <strong>{{ $erro₦->fi₦t('password_confirmation') }}</strong>
                                        </span>
                                    @endif
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Gender</label>
                                    <div class="controls">
                                        {!! Form::select('gender', ['1' => 'Male', '0' => 'Female'] , null, [ 'class' => 'form-control mb-1', 'placeholder' => 'Select gender', 'data-validation-required-message' => 'This field is required']) !!}
                                    </div>
                                    @if ($erro₦->has('gender'))
                                        <span class="alert alert-danger">
                                            <strong>{{ $erro₦->fi₦t('gender') }}</strong>
                                        </span>
                                    @endif
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Can Login</label>
                                    <div class="controls">
                                        {!! Form::select('can_login', ['1' => 'Yes', '0' => 'No'] , null, [ 'class' => 'form-control mb-1', 'placeholder' => 'Select who can login', 'data-validation-required-message' => 'This field is required']) !!}
                                    </div>
                                    @if ($erro₦->has('can_login'))
                                        <span class="alert alert-danger">
                                            <strong>{{ $erro₦->fi₦t('can_login') }}</strong>
                                        </span>
                                    @endif
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            {{--<div class="col-md-6">
                                <div class="form-group">
                                    <label>Role name</label>
                                    <div class="controls">
                                        {!! Form::select('role', $role, null, [ 'class' => 'form-control mb-1', 'placeholder' => 'Select role name', 'data-validation-required-message' => 'This field is required']) !!}
                                    </div>
                                    @if ($erro₦->has('role'))
                                        <span class="alert alert-danger">
                                        <strong>{{ $erro₦->fi₦t('role') }}</strong>
                                    </span>
                                    @endif
                                </div>
                            </div>--}}
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>@lang('form.admin_user_form_field_group_name')</label>
                                    <div class="controls">
                                        {!! Form::select('user_group', $userGroup, null, [ 'class' => 'form-control mb-1', 'placeholder' => 'Select user group']) !!}
                                    </div>
                                    @if ($erro₦->has('user_group'))
                                        <span class="alert alert-danger">
                                        <strong>{{ $erro₦->fi₦t('user_group') }}</strong>
                                    </span>
                                    @endif
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-6">
                                    <h5>Profile Pic<span class="required"></span></h5>
                                    <div class="controls">
                                        {!! Form::file('profile_pic', null, ['class' => 'form-control mb-1', 'data-validation-required-message' => 'This field is required']); !!}
                                    </div>
                                    @if ($erro₦->has('profile_pic'))
                                        <span class="alert alert-danger">
                                            <strong>{{ $erro₦->fi₦t('profile_pic') }}</strong>
                                        </span>
                                    @endif
                                </div>
                            </div>
                        </div>

                        <div class="form-actions mt-10 text-center">
                            <button type="button" class="btn btn-warning mr-1">
                                <i class="ft-x"></i> <a href="{{ route('admin.admin-user')}}"> Cancel </a>
                            </button>
                            <button type="submit" class="btn btn-primary">
                                <i class="la la-check-square-o"></i> Save
                            </button>
                        </div>
                    {!! Form::close() !!}
                </div>
            </div>
        </div>
@endsection
