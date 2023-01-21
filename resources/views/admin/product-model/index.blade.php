@extends('admin.layout.master')

@section('web_settings', 'open')

@section('product_model', 'active')

@section('title') {{ __('product_model') }} @endsection
@section('page-name') {{ __('product_model') }} @endsection

@section('breadcrumb')
    <li class="breadcrumb-item">
        <a href="{{ route('admin.dashboard') }}">{{ __('admin_breadcrumb_title') }}</a>
    </li>
    <li class="breadcrumb-item active">{{ __('product_model') }}</li>
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
                            <div class="form-group">
                                @if (hasAccessAbility('new_brand', $roles))
                                    <a class="text-white" href="{{ route('admin.product-model.new') }}">
                                        <button type="button" class="btn btn-round btn-sm btn-primary">
                                            <i class="ft-user-plus"></i>{{ __('add_new') }}
                                        </button>
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
                            <div class="card-body card-dashboard text-center">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered alt-pagination table-sm"
                                        id="indextable">
                                        <thead>
                                            <tr>
                                                <th>{{ __('sl') }}</th>
                                                <th class="text-left">{{ __('brand') }}</th>
                                                <th class="text-left">{{ __('model_name') }}</th>

                                                <th style="width: 120px;">{{ __('action') }}</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($model as $row)
                                                <tr>
                                                    <td>{{ $loop->index + 1 }}</td>
                                                    <td class="text-left">{{ $row->brand->name ?? '' }}</td>
                                                    <td class="text-left">{{ $row->name }}</td>
                                                    <td>
                                                        @if (hasAccessAbility('edit_model', $roles))
                                                            <a href="{{ route('admin.product-model.edit', [$row->pk_no]) }}"
                                                                class="btn btn-xs btn-outline-primary mr-1"
                                                                title="EDIT"><i class="la la-edit"></i></a>
                                                        @endif
                                                        @if (hasAccessAbility('delete_model', $roles))
                                                            <a href="{{ route('admin.product-model.delete', [$row->pk_no]) }}"
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
