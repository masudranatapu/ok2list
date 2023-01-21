@extends('admin.layout.master')

@section('web_settings', 'open')
@section('cities', 'active')

@section('title') {{ __('city') }} @endsection
@section('page-name') {{ __('city') }} @endsection

@section('breadcrumb')
    <li class="breadcrumb-item">
        <a href="{{ route('admin.dashboard') }}">{{ __('admin_breadcrumb_title') }}</a>
    </li>
    <li class="breadcrumb-item active">{{ __('city') }}</li>
@endsection

@section('content')
    @php
        $roles = userRolePermissionArray();
        $rows = $data['data'];
    @endphp
    <div class="content-body">
        <section id="pagination">
            <div class="row">
                <div class="col-12">
                    <div class="card card-sm">
                        <div class="card-header">
                            <div class="form-group">
                                @if (hasAccessAbility('new_city', $roles))
                                    <a class="text-white btn btn-round btn-sm btn-primary"
                                        href="{{ route('admin.city.create') }}"><i class="ft-plus text-white"></i>
                                        {{ __('add_new') }}
                                    </a>
                                @endif
                            </div>
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
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered alt-pagination table-sm"
                                        id="indextable">
                                        <thead>
                                            <tr>
                                                <th style="width: 40px;">Sl.</th>
                                                <th style="max-width: 200px;">Country</th>
                                                <th>City Name</th>
                                                <th>URL Title</th>
                                                <th>Order ID</th>
                                                <th style="width: 100px;">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($rows as $row)
                                                <tr>
                                                    <td>{{ $loop->index + 1 }}</td>
                                                    <td>{{ $row->country->name ?? '' }}</td>
                                                    <td>{{ $row->name }}</td>
                                                    <td>{{ $row->url_slug }}</td>
                                                    <td>{{ $row->order_id }}</td>
                                                    <td>
                                                        @if (hasAccessAbility('edit_city', $roles))
                                                            <a href="{{ route('admin.city.edit', $row->pk_no) }}"
                                                                title="EDIT"
                                                                class="btn btn-xs btn-outline-primary mr-1"><i
                                                                    class="la la-edit"></i></a>
                                                        @endif
                                                        @if (hasAccessAbility('delete_city', $roles))
                                                            <a href="{{ route('admin.city.delete', [$row->pk_no]) }}"
                                                                class="btn btn-xs btn-outline-danger mr-1" title="DELETE"
                                                                onclick="return confirm('Are you sure you want to delete?')"><i
                                                                    class="la la-trash"></i>
                                                            </a>
                                                        @endif
                                                    </td>
                                                </tr>
                                            @endforeach
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

@push('custom_js')
@endpush('custom_js')
