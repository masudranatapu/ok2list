@extends('admin.layout.master')
@section('permission-group','active')
@section('Role Management','open')
@section('title')
    @lang('admin_menu.edit_page_title')
@endsection
@section('page-name')
    @lang('admin_menu.list_page_sub_title')
@endsection
@section('breadcrumb')
    <li class="breadcrumb-item"><a href="{{url('/dashboard')}}">@lang('admin_menu.breadcrumb_title')</a>
    </li>
    <li class="breadcrumb-item"><a href="{{ route('admin.permission-group') }}">@lang('admin_menu.breadcrumb_sub_title')</a>
    </li>
    <li class="breadcrumb-item active">@lang('admin_menu.breadcrumb_title_active_2')
    </li>
@endsection
@section('content')
    <div class="col-md-12">
        <div class="card" style="height: 981.5px;">
            <div class="card-header">
                <h4 class="card-title" id="basic-layout-colored-form-control">@lang('form.edit_menu_form_title')</h4>
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
                    {!! Form::open([ 'route' => ['admin.permission-group.update', $permissionGroup->id], 'method' => 'post', 'class' => 'form-horizontal', 'files' => true , 'novalidate']) !!}
                    @csrf
                    <div class="form-body">
                        <div class="col-md-6 offset-3">
                            <div class="form-group">
                                <label>@lang('form.edit_menu_form_filed_name')</label>
                                <div class="controls">
                                    {!! Form::text('permission_group_name',$permissionGroup->group_name, [ 'class' => 'form-control mb-1', 'data-validation-required-message' => __('form.field_required'), 'placeholder' => __('form.edit_menu_form_placeholder'), 'tabindex' => 1 ]) !!}
                                </div>
                                @if ($errors->has('permission_group_name'))
                                    <div class="alert alert-danger">
                                        <strong>{{ $errors->first('permission_group_name') }}</strong>
                                    </div>
                                @endif
                            </div>
                        </div>
                        <div class="form-actions text-center mt-3">
                            <a href="{{ route('admin.permission-group') }}">
                                <button type="button" class="btn btn-warning mr-1">
                                    <i class="ft-x"></i> @lang('form.btn_cancle')
                                </button>
                            </a>
                            <button type="submit" class="btn btn-primary">
                                <i class="la la-check-square-o"></i> @lang('form.btn_save')
                            </button>
                        </div>
                    </div>
                    {!! Form::close() !!}
                </div>
            </div>
        </div>
    </div>
@endsection
