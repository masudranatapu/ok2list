@extends('admin.layout.master')
@push('custom_css')
<link rel="stylesheet" type="text/css" href="{{ asset('app-assets/css/core/coloRs/palette-tooltip.css')}}">
@endpush

@section('product_list','active')
@section('Product Management','open')

@section('title')
    @lang('product.list_page_title')
@endsection

@section('page-name')
    @lang('product.list_page_sub_title')
@endsection

@section('breadcrumb')
    <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">@lang('product.breadcrumb_title')    </a>
    </li>
    <li class="breadcrumb-item active">@lang('product.breadcrumb_sub_title')
    </li>
@endsection

@php
    $roles = userRolePermissionArray();
    $promotion = request()->get('ad_promotion_type') ?? '';
@endphp

@section('content')
    <div class="content-body">
        <section id="pagination">
            <div class="row">
                <div class="col-md-12">
                    <div class="card card-sm">
                        <div class="card-header">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="filter">
                                                <form method="" action="" class="form-inline"  style="display: inline-flex">
                                                <div class="form-group mr-2">
                                                    <select class="form-control" id="ad_promotion_type" data-url="{{ route('admin.product.list') }}" >
                                                        <option value="" selected="">--select--</option>
                                                        <option value="Top" {{ $promotion == 'Top' ? 'selected' : '' }}>Top</option>
                                                        <option value="Feature" {{ $promotion == 'Feature' ? 'selected' : '' }}>Feature</option>
                                                        <option  value="Urgent" {{ $promotion == 'Urgent' ? 'selected' : '' }}>Urgent</option>
                                                        <option value="Basic" {{ $promotion == 'Basic' ? 'selected' : '' }}>Free</option>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <button type="submit" class="btn btn-primary">Filter</button>
                                                </div>
                                                </form>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <form action="{{route('admin.product.selecteddelete')}}" method="GET">
                                                <input class="form-control" name="productid" id="showProductId" type="hidden"/>
                                                <button onclick="return confirm('Are you really sure to delete ?')" type="submit" class="btn btn-primary">Delete All Selected</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
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
                            </div>
                        </div>
                        <div class="card-content collapse show">
                            <div class="card-body card-dashboard">
                                <div class="table-responsive ">
                                    <table class="table table-striped table-bordered alt-pagination table-sm" id="indextable">
                                        <thead>
                                        <tr>
                                            <th width="50px">
                                                <input type="checkbox" class="selectall">
                                            </th>
                                            <th class="text-center">Sl</th>
                                            <th>Name</th>
                                            <th style="">Category</th>
                                            <th style="">Subcategory</th>
                                            <th style="">User Type</th>
                                            <th style="">Entry Time</th>
                                            <th style="" class="text-center">Is Rejected</th>
                                            <th style="" class="text-center">Status</th>
                                            <th style="" class="text-center">Report</th>
                                            <th style="width: 90px;">Action</th>
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
                                                        <td>
                                                            <input type="checkbox" onclick="addValue(this)" value="{{$row->pk_no}}" name="product_id[]" >
                                                        </td>
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
                                                        <td class="text-center">
                                                            <a href="{{ route('product.reports',['id' => $row->pk_no ]) }}">{{ $row->allReports->count() ?? 0 }}</a>
                                                        </td>

                                                        <td style="width: 90px;">

                                                            @if(hasAccessAbility('edit_product', $roles))
                                                            <a href="{{ route('admin.product.edit', [$row->pk_no]) }}" class="btn btn-xs btn-outline-primary mr-1" title="EDIT"><i class="la la-edit"></i></a>
                                                            @endif
                                                            <a href="{{ route('admin.product.delete.single', [$row->pk_no]) }}" class="btn btn-xs btn-outline-danger mr-1" onclick="return confirm('Are you sure you want to delete the product with it\'s variant product ?')" title="DELETE"><i class="la la-trash"></i></a>
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
    <script type="text/javascript">
        $(document).on('change', '#ad_promotion_type', function(e){
            var url = $(this).data('url');
            var ad_promotion_type = $(this).val();
            window.location.href = url+'?ad_promotion_type='+ad_promotion_type;
        })
    </script>
    <script>
        function addValue(input){
            //select all checkboxes with name userid that are checked
            var checkboxes = document.querySelectorAll("input[name='product_id[]']:checked")
            
            var values = "";
            
            //append values of each checkbox into a variable (seperated by commas)
            for(var i=0; i<checkboxes.length; i++){
                values += checkboxes[i]
            .value + ","  }

            //remove last comma
            values = values.slice(0,values.length-1)
            
            //set the value of input box
            document.getElementById("showProductId").value = values;
            
        }

    </script>
    <script>
        $('.selectall').click(function() {
            if ($(this).is(':checked')) {
                $('input:checkbox').prop('checked', true);
                
                var checkboxes = document.querySelectorAll("input[name='product_id[]']:checked")
                
                var values = "";
                
                //append values of each checkbox into a variable (seperated by commas)
                for(var i=0; i<checkboxes.length; i++){
                    values += checkboxes[i]
                .value + ","  }

                //remove last comma
                values = values.slice(0,values.length-1)
                
                //set the value of input box
                document.getElementById("showProductId").value = values;

            } else {
                $('input:checkbox').prop('checked', false);
                document.getElementById("showProductId").value = '';
            }
        });
    </script>
@endpush
