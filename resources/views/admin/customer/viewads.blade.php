@extends('admin.layout.master')

@push('custom_css')
    <link rel="stylesheet" type="text/css" href="{{ asset('app-assets/css/core/colors/palette-tooltip.css')}}">
@endpush

@section('Customer Management','open')

@section('customer_list','active')


@section('title')
    Customer Ads List
@endsection

@section('page-name')
    Customer Ads List
@endsection

@section('breadcrumb')
    <li class="breadcrumb-item"><a href="#">
        Customer Ads List</a>
    </li>
    <li class="breadcrumb-item active">
    Customer Ads List
    </li>
@endsection

@section('content')

    @php
        $roles = userRolePermissionArray();
        $promotion = request()->get('ad_promotion_type') ?? '';
    @endphp

    <div class="content-body">
        <section id="pagination">
            <div class="row">
                <div class="col-md-12">
                    <div class="card card-sm">
                        <div class="card-header">
                            <a class="btn btn-round btn-sm btn-primary text-white" href="#" title="CUSTOMER LIST">Customer Ads List</a>


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
                                    <table class="table table-striped table-bordered alt-pagination table-sm" id="indextable">
                                        <thead>
                                            <tr>
                                                <th>Sl</th>
                                                <th>Name</th>
                                                <th>Category</th>
                                                <th>Subcategory</th>
                                                <th>User Type</th>
                                                <th>Entry Time</th>
                                                <th>Is Rejected</th>
                                                <th>Status</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @if(isset($rows) && ($rows->count() > 0))
                                                @foreach($rows as $row)
                                                    <?php
                                                    $text_color = '';
                                                    if ($row->is_active == 0) {
                                                        $text_color = 'text-warning';
                                                    }elseif($row->is_active == 1){
                                                        $text_color = 'text-success';
                                                    }elseif($row->is_active == 2){
                                                        $text_color = 'text-danger';
                                                    }
                                                ?>
                                                <tr class="{{ $text_color }}" title="{{ $row->is_active == 2 ? 'Rejacted' : '' }}">
                                                    <td class="text-center">{{$loop->index + 1}}</td>
                                                    <td>{{$row->ad_title ?? '' }}</td>
                                                    <td>{{$row->category->name ?? '' }}</td>
                                                    <td>{{$row->subcategory->name ?? '' }}</td>
                                                    <td>{{$row->customer->seller_type ?? '' }}</td>

                                                    <td>{{ date('d-m-Y h:i A', strtotime($row->created_at)) }}</td>
                                                    <td>{{ $row->is_delete == 1 ? 'Rejected' : '' }}</td>
                                                    <td>
                                                        @if($row->is_active == 0 )
                                                        <a href="javascript:void(0)"  class="pull-right c-btn"> Pending</a>
                                                        @elseif($row->is_active == 1)
                                                        <a href="javascript:void(0)"  class="pull-right c-btn"> {{ $row->promotion }} </a>
                                                        @elseif($row->is_active == 2)
                                                        <a href="javascript:void(0)"  class="pull-right c-btn btn-danger">Expired</a> @elseif($row->is_active == 3)
                                                        <a href="javascript:void(0)"  class="pull-right c-btn btn-danger">Draft</a>
                                                        @endif

                                                    </td>
                                                    <td style="width: 90px;">
                                                        @if(hasAccessAbility('edit_product', $roles))
                                                            <a href="{{ route('admin.product.edit', [$row->pk_no]) }}" class="btn btn-xs btn-outline-primary mr-1" title="EDIT"><i class="la la-edit"></i></a>
                                                        @endif
                                                        {{--
                                                        @if(hasAccessAbility('view_product', $roles))
                                                            <a href="{{ route('admin.product.view', [$row->pk_no]) }}" class="btn btn-xs btn-outline-primary mr-1" title="VIEW"><i class="la la-eye"></i></a>
                                                        @endif --}}

                                                        @if(hasAccessAbility('delete_product', $roles))
                                                            <a href="{{ route('admin.product.delete', [$row->pk_no]) }}" class="btn btn-xs btn-outline-danger mr-1" onclick="return confirm('Are you sure you want to delete the product with it\'s variant product ?')" title="DELETE"><i class="la la-trash"></i></a>
                                                        @endif
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
    <script src="{{ asset('app-assets/js/scripts/tooltip/tooltip.js')}}"></script>
@endpush