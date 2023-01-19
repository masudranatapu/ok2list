@extends('admin.layout.master')
@push('custom_css')
    <link rel="stylesheet" type="text/css" href="{{ asset('app-assets/css/core/colors/palette-tooltip.css') }}">
@endpush

@section('Package', 'open')
@section('package_list', 'active')


@section('title')
    {{ __('package_package_menu') }}
@endsection

@section('page-name')
    {{ __('package_list_page_title') }}
@endsection

@section('breadcrumb')
    <li class="breadcrumb-item"><a href="#">{{ __('admin_breadcrumb_title') }}</a>
    </li>
    <li class="breadcrumb-item active">{{ __('admin_breadcrumb_sub_title') }}
    </li>
@endsection

@php
    $roles = userRolePermissionArray();
    $rows = $data['rows'] ?? null;

@endphp

@section('content')
    <div class="content-body">
        <section id="pagination">
            <div class="row">
                <div class="col-md-12">
                    <div class="card card-sm">
                        <div class="card-header pl-2">
                            <div class="form-group">
                                @if (hasAccessAbility('new_package', $roles))
                                    <a class="text-white btn btn-round btn-sm btn-primary"
                                        href="{{ route('admin.package.create') }}"><i class="ft-plus text-white"></i> Create
                                        Package</a>
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
                                <div class="table-responsive ">
                                    <table class="table table-striped table-bordered alt-pagination table-sm"
                                        id="indextable">
                                        <thead>
                                            <tr>
                                                <th class="text-center">SL</th>
                                                <th>{{ __('name') }}</th>
                                                <th>{{ __('price') }}</th>
                                                <th>{{ __('support1') }}</th>
                                                <th title="Discount on Promotiom">{{ __('discount') }}</th>
                                                <td>{{ __('package_duration') }}</td>
                                                <td>{{ __('add_limit') }}</td>
                                                <th>{{ __('sms') }}</th>
                                                <th>{{ __('email') }}</th>
                                                <th>{{ __('shop_page') }}</th>
                                                <th>{{ __('analytics') }}</th>
                                                <th>{{ __('active') }}</th>
                                                <th>{{ __('action') }}</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @if ($rows && count($rows) > 0)
                                                @foreach ($rows as $key => $row)
                                                    <tr>
                                                        <td>{{ $key + 1 }}</td>
                                                        <td>{{ $row->title }}</td>
                                                        <td>₦ {{ $row->price_per_month }}</td>
                                                        <td>{{ $row->support_duration }}</td>
                                                        <td>{{ $row->discount_on_promotion }}</td>
                                                        <td>{{ $row->package_duration }}</td>
                                                        <td>{{ $row->ad_limit_in_montrh }}</td>
                                                        <td>{{ $row->sms_feature == 1 ? 'YES' : 'NO' }}</td>
                                                        <td>{{ $row->email_feature == 1 ? 'YES' : 'NO' }}</td>
                                                        <td>{{ $row->shop_page == 1 ? 'YES' : 'NO' }}</td>
                                                        <td>{{ $row->analytics == 1 ? 'YES' : 'NO' }}</td>
                                                        <td>{{ $row->is_active == 1 ? 'YES' : 'NO' }}</td>
                                                        <td>
                                                            {{-- @if (hasAccessAbility('edit_package', $roles))
                                                    <a href="{{ route('admin.package.view',$row->pk_no) }}" class="btn btn-xs btn-outline-primary mr-1" title="VIEW"><i class="la la-eye"></i></a>
                                                    @endif --}}
                                                            @if (hasAccessAbility('edit_package', $roles))
                                                                <a href="{{ route('admin.package.edit', $row->pk_no) }}"
                                                                    title="EDIT"
                                                                    class="btn btn-xs btn-outline-primary mr-1"><i
                                                                        class="la la-edit"></i></a>
                                                            @endif


                                                        </td>
                                                    </tr>
                                                @endforeach
                                            @endif

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
    <script src="{{ asset('app-assets/js/scripts/tooltip/tooltip.js') }}"></script>
@endpush
