@extends('admin.layout.master')
@section('transaction','active')
@section('title')
Transaction History
@endsection
@section('page-name')
Transaction History
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
                                        <th>Transation Id</th>
                                        <th>Customer</th>
                                        <th>Plan Name</th>
                                        <th>Card Type</th>
                                        <th>Payment Type</th>
                                        <th>Amount</th>
                                        <th>Date</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($transactions as $item)
                                    <tr>
                                        <td>{{$loop->iteration}}</td>
                                        <td>{{$item->transaction_id}}</td>
                                        <td> <a href="{{url('admin/customer')}}">{{$item->customer->name ?? ''}}</a> </td>
                                        <td>{{$item->package->title ?? ''}}</td>
                                        <td>{{$item->card_type}}</td>
                                        <td>{{$item->payment_type}}</td>
                                        <td>₦ {{$item->amount}}</td>
                                        <td>{{$item->created_at->toFormattedDateString()}}</td>
                                        <td>@php
                                            if($item->status == "VALID"){
                                            echo  "<div class='badge badge-success badge-shadow'>VALID</div>";
                                            }elseif($item->status == "Due"){
                                            echo  "<div class='badge badge-danger badge-shadow'>Due</div>";
                                            }else{
                                                echo  "<div class='badge badge-primary badge-shadow'>Free</div>";
                                            }
                                            @endphp
                                        </td>
                                        <td>
                                            @if($item->status=="Due")
                                            <a href="{{ route('admin.transaction.edit', [$item->pk_no]) }}" class="btn btn-xs btn-outline-primary mr-1" title="EDIT"><i class="la la-edit"></i></a>
                                            @endif
                                            <a href="{{route('admin.delete-transaction-history',$item->pk_no)}}" onclick="return confirm('Are you sure you want to delete ?')" title="DELETE" class="btn btn-xs btn-outline-danger"><i class="la la-trash"></i></a>
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