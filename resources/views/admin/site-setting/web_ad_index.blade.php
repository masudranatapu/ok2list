@extends('admin.layout.master')
@section('site-ads', 'active')

@section('breadcrumb')
    <li class="breadcrumb-item">
        <a href="{{ route('admin.dashboard') }}">{{ __('admin_breadcrumb_title') }}</a>
    </li>
    <li class="breadcrumb-item active">{{ __('admin_ads') }}
    </li>
@endsection

@section('content')
    <div class="content-body">
        <section id="pagination">
            <div class="row">
                <div class="col-8">
                    <div class="card">
                        <div class="card-header">
                            <a class="text-white btn btn-round btn-sm btn-primary" href="{{ route('site.ads.create') }}"><i
                                    class="ft-plus text-white"></i> Create Ads</a>
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
                                    <table class="table table-striped table-bordered alt-pagination" id="indextable">
                                        <thead>
                                            <tr>
                                                <th>SL</th>
                                                <th>Ads Name</th>
                                                <th>Total Photos</th>
                                                <th>Status</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @if (isset($data) && count($data) > 0)
                                                @foreach ($data as $key => $row)
                                                    <tr>
                                                        <td>{{ $loop->index + 1 }}</td>
                                                        <td>{{ $row->name }}</td>
                                                        <td>{{ $row->photos->count() }}</td>
                                                        <td>{{ $row->is_active == 1 ? 'Active' : 'Inactive' }}</td>
                                                        <td class="text-center">
                                                            <a href="{{ route('site.ads.edit', $row->pk_no) }}"
                                                                title="EDIT"
                                                                class="btn btn-xs btn-outline-primary mr-1"><i
                                                                    class="la la-edit"></i></a>
                                                            <a href="{{ route('site.ads.delete', $row->pk_no) }}"
                                                                title="DELETE" class="btn btn-xs btn-outline-danger mr-1"><i
                                                                    class="la la-close"></i></a>
                                                        </td>
                                                    </tr>
                                                @endforeach()
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
