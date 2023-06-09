@extends('layouts.app')

@section('content')
<section id="main" class="clearfix myads-page">
    <div class="container">
        <div class="breadcrumb-section">
            <ol class="breadcrumb">
                <li><a href="{{ url('/') }}">{{ __('home') }}</a></li>
                <li>{{ __('p_history') }}</li>
            </ol>
        </div>
        <div class="ads-info profile">
            <div class="row">
                <div class="col-xl-3">
                    @include('users._user_dashboard_menu')
                </div>
                <div class="col-xl-9">
                    <div class="card mb-3">
                        <div class="card-body table-responsive">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Product Title</th>
                                        <th>Amount ({{ $setting->paystack_curency }})</th>
                                        <th>Payment Method</th>
                                        <th>Transaction Number</th>
                                        <th>Payment Status</th>
                                        <th>Order Date</th>
                                        <th>Order Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($orders as $item)
                                    <tr>
                                        <td>{{ $item->product->ad_title }}</td>
                                        <td>{{ $item->amount }}</td>
                                        <td>{{ ucfirst($item->payment_method ?? 'paystack') }}</td>
                                        <td>{{ $item->transaction_number }}</td>
                                        <td>
                                            @if ($item->payment_status == 'paid')
                                            <span class="badge bg-success">Paid</span>
                                            @else
                                            <span class="badge bg-danger">Unpaid</span>
                                            @endif
                                        </td>
                                        <td>{{ $item->created_at->toFormattedDateString() }}</td>
                                        <td>{{ ucfirst($item->order_status) }}</td>
                                        <td>
                                            <a target="_blank" href="{{ route('user.order.details', $item->id) }}"
                                                class="btn-sm "><i class="fa fa-eye"></i></a>
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