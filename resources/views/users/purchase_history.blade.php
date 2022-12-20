@extends('layouts.app')

@section('content')
    <section id="main" class="clearfix myads-page">
        <div class="container">
            <div class="breadcrumb-section">
                <ol class="breadcrumb">
				<li><a href="{{url('/')}}">@lang('web.home')</a></li>
                    <li>@lang('web.p_history')</li>
                </ol>
            </div>
            <div class="ads-info profile">
                <div class="row">
                    <div class="col-xl-3">
                        @include('users._user_dashboard_menu')
                    </div>
                    <div class="col-xl-9">
                        <div class="card">
                            <div class="card-body">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>Trnx ID</th>
                                            <th>Plan Type</th>
                                            <!-- <th>Card Type</th> -->
                                            <th>Amount</th>
                                            <th>Payment Type</th>
                                            <th>Date</th>
                                            <th>Status</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($purchase_history as $item)
                                            <tr>
                                                <td>{{$item->transaction_id}}</td>
                                                <td>{{$item->package->title ?? ''}}</td>
                                                <!-- <td>{{$item->card_type}}</td> -->
                                                <td>Rs {{$item->amount}}</td>
                                                <td>{{$item->payment_type}}</td>
                                                <td>{{$item->created_at->toFormattedDateString()}}</td>
                                                <td>
                                                    @if($item->status == "VALID")
                                                        <div class='badge badge-success badge-shadow'>Paid</div>
                                                    @endif
                                                    @if($item->status == "Due")
                                                        <div class='badge badge-danger badge-shadow'>Due</div>
                                                    @endif
                                                    @if($item->status == "Free")
                                                        <div class='badge badge-primary badge-shadow'>Free</div>
                                                    @endif
                                                </td>
                                                <td>
                                                    <a target="_blank" href="{{ route('purchase.invoice',$item->pk_no) }}" class="btn-sm btn-warning">Invoice</a>
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
@endsection