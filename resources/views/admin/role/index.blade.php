@extends('admin.layout.master')

@section('role', 'active')
@section('Role Management', 'open')
@section('title')
    {{ __('role') }}
@endsection
@section('page-name')
    {{ __('role') }}
@endsection
@section('breadcrumb')
    <li class="breadcrumb-item">
        <a href="{{ route('admin.dashboard') }}">{{ __('admin_breadcrumb_title') }}</a>
    </li>
    <li class="breadcrumb-item active">
        {{ __('role') }}
    </li>
@endsection

@section('content')
    @php
        $roles = userRolePermissionArray();
    @endphp
    <div class="content-body">
        <section id="pagination">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            @if (hasAccessAbility('new_role', $roles))
                                <a class="text-white" href="{{ route('admin.role.new') }}">
                                    <button type="button" class="btn btn-round btn-sm btn-primary">
                                        <i class="ft-plus text-white"></i> {{ __('role_create_btn') }}
                                    </button>
                                </a>
                            @endif
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
                            <div class="card-body card-dashboard">
                                <div class="table-responsive text-center">
                                    <table class="table table-striped table-bordered alt-pagination" id="indextable">
                                        <thead>
                                            <tr>
                                                <th>SL</th>
                                                <th>Name</th>
                                                <th>Created by</th>
                                                <th>Created at</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($rows as $row)
                                                <tr>
                                                    <td>{{ $loop->index + 1 }}</td>
                                                    <td>{{ $row->role_name }}</td>
                                                    <td>{{ $row->first_name }}</td>
                                                    <td>{{ date('d-m-Y', strtotime($row->created_at)) }}</td>
                                                    <td>
                                                        @if (hasAccessAbility('edit_role', $roles))
                                                            <a href="{{ route('admin.role.edit', [$row->id]) }}">
                                                                <button type="button"
                                                                    class="btn btn-sm btn-outline-primary mr-1"><i
                                                                        class="la la-edit"></i>
                                                                </button>
                                                            </a>
                                                        @endif
                                                        @if (hasAccessAbility('delete_role', $roles))
                                                            <a href="{{ route('admin.role.delete', [$row->id]) }}">
                                                                <button type="button"
                                                                    class="btn btn-sm btn-outline-danger mr-1"><i
                                                                        class="la la-trash"></i>
                                                                </button>
                                                            </a>
                                                        @endif
                                                    </td>
                                                </tr>
                                            @endforeach()
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
@endsection
