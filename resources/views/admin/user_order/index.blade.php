@extends('admin.layout.master')
@section('order','active')
@section('title')
Orders
@endsection
@section('page-name')
Orders
@endsection
@section('breadcrumb')
<li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Dashboard</a>
</li>
<li class="breadcrumb-item active">Transaction History
</li>
@endsection
@section('content')
<div class="content-body">
<section id="pagination">
    <div class="row">
        <div class="col-12">
            <div class="card card-sm">
                @if(session()->has('message'))
						<div class="alert alert-success">
							{{ session()->get('message') }}
						</div>
					@endif
                <div class="card-content collapse show">
                    <div class="card-body card-dashboard">
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered alt-pagination table-sm" id="indextable">
                                <thead>
                                    <tr>
                                        <th>Sl.</th>
                                        <th>Product</th>
                                        <th>Transation Id</th>
                                        <th>Customer</th>
                                        <th>Seller</th>
                                        <th>Payment Method</th>
                                        <th>Amount</th>
                                        <th>Date</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($orders as $item)
                                    <tr>
                                        <td>{{$loop->iteration}}</td>
                                        <td>{{$item->product->ad_title}}</td>
                                        <td>{{$item->transaction_number}}</td>
                                        <td> <a href="{{url('admin/customer')}}">{{$item->user->name ?? ''}}</a> </td>
                                        <td> <a href="{{url('admin/customer')}}">{{$item->seller->name ?? ''}}</a> </td>
                                        <td>{{ucfirst($item->payment_method ?? 'paystack')}}</td>
                                        <td> {{$item->amount}}</td>
                                        <td>{{$item->created_at->toFormattedDateString()}}</td>
                                        <td>{{ ucfirst($item->order_status) }}</td>
                                        <td>
                                            <a href="{{ route('admin.order.details', $item->id) }}" class="btn btn-xs btn-outline-primary mr-1" title="View"><i class="la la-eye"></i></a>
                                            <a href="{{ route('admin.order.edit', $item->id) }}" class="btn btn-xs btn-outline-primary mr-1" title="EDIT"><i class="la la-edit"></i></a>
                                            <a href="{{route('admin.order.delete',$item->id)}}" onclick="return confirm('Are you sure you want to delete ?')" title="DELETE" class="btn btn-xs btn-outline-danger"><i class="la la-trash"></i></a>
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
