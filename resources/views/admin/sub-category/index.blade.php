@extends('admin.layout.master')

@section('web_settings', 'open')

@section('sub_category', 'active')

@section('title') {{ __('sub_category') }} @endsection
@section('page-name') {{ __('sub_category') }} @endsection

@section('breadcrumb')
    <li class="breadcrumb-item">
        <a href="{{ route('admin.dashboard') }}">{{ __('admin_breadcrumb_title') }}</a>
    </li>
    <li class="breadcrumb-item active">{{ __('sub_category') }}
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
                    <div class="card card-sm">
                        <div class="card-header pl-2">
                            @if (hasAccessAbility('new_category', $roles))
                                <a class="text-white btn btn-round btn-sm btn-primary"
                                    href="{{ route('product.category.create') }}"><i class="ft-plus text-white"></i>
                                    {{ __('create_sub_cate') }}
                                </a>
                            @endif
                            <a class="heading-elements-toggle heading-elements-toggle-sm"><i
                                    class="la la-ellipsis-v font-medium-3"></i></a>
                            <div class="heading-elements heading-elements-sm">
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
                                                <th>Sl.</th>
                                                <th class="text-left">{{ __('category') }}</th>
                                                <th class="text-left">{{ __('subcategory_name') }}</th>
                                                <th class="text-left">URL Title</th>
                                                <th class="text-left">Order id</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($rows as $row)
                                                <tr>
                                                    <td>{{ $loop->index + 1 }}</td>
                                                    <td class="text-left">{{ $row->category_name }}</td>
                                                    <td class="text-left">{{ $row->name }}</td>
                                                    <td class="text-left">{{ $row->url_slug }}</td>
                                                    <td class="text-left">{{ $row->order_id }}</td>
                                                    <td>
                                                        @if (hasAccessAbility('edit_category', $roles))
                                                            <a href="{{ route('product.category.edit', $row->pk_no) }}"
                                                                class="btn btn-xs btn-outline-primary mr-1"
                                                                title="EDIT"><i class="la la-edit"></i></a>
                                                        @endif
                                                        @if (hasAccessAbility('delete_category', $roles))
                                                            <a href="{{ route('product.category.delete', $row->pk_no) }}"
                                                                onclick="return confirm('Are you sure you want to delete?')"
                                                                class="btn btn-xs btn-outline-danger mr-1" title="DELETE">
                                                                <i class="la la-trash"></i>
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
