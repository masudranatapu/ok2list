@extends('admin.layout.master')
@push('custom_css')
    <link rel="stylesheet" type="text/css" href="{{ asset('app-assets/css/core/colors/palette-tooltip.css') }}">
@endpush

@section('Promotion', 'open')
@section('promotion_list', 'active')


@section('title')
    {{ __('promotion_title') }}
@endsection

@section('page-name')
    {{ __('promotion_title') }}
@endsection

@section('breadcrumb')
    <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">{{ __('admin_breadcrumb_title') }}</a>
    </li>
    <li class="breadcrumb-item active">
        {{ __('promotion_title') }}
    </li>
@endsection

@php
    $roles = userRolePermissionArray();
@endphp

@section('content')
    <div class="content-body">
        <section id="pagination">
            <div class="row">
                <div class="col-md-12">
                    <div class="card card-sm">
                        <div class="card-header">

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
                                                <th class="text-center">{{ __('sl') }}</th>
                                                <th>{{ __('name') }}</th>
                                                <th>{{ __('price') }}</th>
                                                <th>{{ __('duration') }}</th>
                                                <th style="width: 120px;" class="text-center">{{ __('action') }}</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @if (isset($data['rows']) && count($data['rows']) > 0)
                                                @foreach ($data['rows'] as $key => $row)
                                                    <tr>
                                                        <td>01</td>
                                                        <td>{{ $row->promotion->name ?? '' }}</td>
                                                        <td>₦ {{ number_format($row->price, 2) }} </td>
                                                        <td>{{ $row->day_limit }} Day</td>
                                                        <td class="text-center">

                                                            @if (hasAccessAbility('edit_promotion', $roles))
                                                                <a href="{{ route('admin.promotion.edit', $row->pk_no) }}"
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
