@extends('admin.layout.master')
@section('role', 'active')
@section('Role Management', 'open')
@section('title')
    {{ __('role_edit_btn') }}
@endsection
@section('page-name')
    {{ __('role_edit_btn') }}
@endsection
@section('breadcrumb')
    <li class="breadcrumb-item">
        <a href="{{ route('admin.dashboard') }}">{{ __('admin_breadcrumb_title') }}</a>
    </li>
    <li class="breadcrumb-item active">
        {{ __('role_edit_btn') }}
    </li>
@endsection
@section('content')
    @php
        $role = $data['role'];
        $groups = $data['groups'];
    @endphp
    <div class="col-md-12">
        <div class="card">
            <div class="card-header">
                <h4 class="card-title" id="basic-layout-colored-form-control">{{ __('user_profile') }}</h4>
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
                    @if ($errors->any())
                        @foreach ($errors->all() as $error)
                            <div>{{ $error }}</div>
                        @endforeach
                    @endif
                    {!! Form::open([
                        'route' => ['admin.role.update', $role->id],
                        'method' => 'post',
                        'class' => 'form-horizontal',
                        'files' => true,
                        'novalidate',
                    ]) !!}
                    @csrf
                    <div class="form-body">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label><strong>Role Name :</strong></label>
                                    <div class="controls">
                                        {!! Form::text('role_name', $role->role_name, [
                                            'class' => 'form-control',
                                            'data-validation-required-message' => 'This field is required',
                                            'placeholder' => 'Enter group name',
                                            'tabindex' => 1,
                                        ]) !!}
                                    </div>
                                    @if ($errors->has('role_name'))
                                        <div class="alert alert-danger">
                                            <strong>{{ $errors->first('role_name') }}</strong>
                                        </div>
                                    @endif
                                </div>
                            </div>
                        </div>
                    </div>
                    @php
                        $assigned_perms = explode(',', $role->permission->permissions);
                    @endphp
                    <div class="table-responsive p-1">
                        <table class="table table-bordered table-hover">
                            <thead class="bg-primary bg-darken-1 text-white text-center">
                                <tr>
                                    <th>Menu</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody class="text-center">
                                @foreach ($groups as $group)
                                    <tr>
                                        <td class="text-left">{{ $group->group_name }}</td>
                                        <td class="skin skin-flat" style="text-align: left;">
                                            <fieldset style="margin-left: 68px;">
                                                @foreach ($group->permissions as $i => $permissions)
                                                    @if (in_array($group->permissions[$i]->name, $assigned_perms) && $group->permissions[$i]->name != '')
                                                        <label class="m-checkbox"
                                                            for="input-{{ $loop->parent->index + 1 }}{{ $i }}"
                                                            style="margin-left: 40px;">
                                                            <input name="permission[]" type="checkbox" checked="checked"
                                                                class="icheckbox_flat-pink checked"
                                                                value="{{ $group->permissions[$i]->name }}"
                                                                id="input-{{ $loop->parent->index + 1 }}{{ $i }}">
                                                            <span>{{ $group->permissions[$i]->display_name }}</span>
                                                        </label>
                                                    @else
                                                        <label class="m-checkbox"
                                                            for="input-{{ $loop->parent->index + 1 }}{{ $i }}"
                                                            style="margin-left: 40px;">
                                                            <input name="permission[]" type="checkbox"
                                                                class="icheckbox_flat-pink"
                                                                value="{{ $group->permissions[$i]->name }}"
                                                                id="input-{{ $loop->parent->index + 1 }}{{ $i }}">
                                                            <span>{{ $group->permissions[$i]->display_name }}</span>
                                                        </label>
                                                    @endif
                                                @endforeach
                                            </fieldset>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                    <div class="form-actions text-center">
                        <a href="{{ route('admin.role') }}">
                            <button type="button" class="btn btn-warning mr-1">
                                <i class="ft-x"></i> {{ __('btn_cancle') }}
                            </button>
                        </a>
                        <button type="submit" class="btn bg-primary bg-darken-1 text-white">
                            <i class="la la-check-square-o"></i> {{ __('btn_save') }}
                        </button>
                    </div>
                    {!! Form::close() !!}
                </div>
            </div>
        </div>
    </div>
@endsection
