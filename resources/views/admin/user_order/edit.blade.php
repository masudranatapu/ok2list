@extends('admin.layout.master')

@section('order', 'active')

@section('title') {{ __('Order_Status_Update') }} @endsection
@section('page-name') {{ __('Order_Status_Update') }} @endsection

@section('breadcrumb')
    <li class="breadcrumb-item"><a href="#">{{ __('breadcrumb_title') }}</a></li>
    <li class="breadcrumb-item active">{{ __('Order_Status_Update') }} </li>
@endsection

<!--push from page-->
@push('custom_css')
    <link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
@endpush('custom_css')

@section('content')

    <div class="content-body">
        <section id="pagination">
            <div class="row">
                <div class="col-md-6">
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
                        @if (session()->has('message'))
                            <div class="alert alert-success">
                                {{ session()->get('message') }}
                            </div>
                        @endif
                        <div class="card-content collapse show">
                            <form action="{{ route('admin.order.update', $order->id) }}" method="post">
                                @csrf
                                <div class="card-body card-dashboard">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="package">{{ __('customer') }}</label>
                                                <input type="text" class="form-control"
                                                    value="{{ $order->user->name ?? '' }}" readonly>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="package">{{ __('Package_Name') }}</label>
                                                <input type="text" class="form-control"
                                                    value="{{ $order->product->ad_title ?? '' }}" readonly>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="package">{{ __('Payment_Type') }}</label>
                                                <input type="text" class="form-control"
                                                    value="{{ ucfirst($order->payment_method ?? 'paystack') }}" readonly>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="package">{{ __('amount') }} (₦)</label>
                                                <input type="number" class="form-control"
                                                    value="{{ $order->amount ?? '' }}" readonly>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="shop_page">{{ __('status') }}</label>
                                                <select name="status" class="form-control" id="shop_page" required>
                                                    <option value="pending"
                                                        {{ $order->order_status == 'pending' ? 'selected' : '' }}>
                                                        {{ __('pending') }}
                                                    </option>
                                                    <option value="processing"
                                                        {{ $order->order_status == 'processing' ? 'selected' : '' }}>
                                                        {{ __('Processing') }}</option>
                                                    <option value="delivered"
                                                        {{ $order->order_status == 'delivered' ? 'selected' : '' }}>
                                                        {{ __('delivered') }}</option>
                                                    <option value="cancle"
                                                        {{ $order->order_status == 'cancle' ? 'selected' : '' }}>
                                                        {{ __('btn_cancle') }}
                                                    </option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-actions text-center mt-3">
                                        <a href="">
                                            <button type="submit" class="btn btn-success mr-1">
                                                {{ __('btn_update') }}
                                            </button>
                                        </a>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
@endsection
<!--push from page-->
@push('custom_js')
    <script src="{{ asset('app-assets/vendors/js/forms/select/select2.full.min.js') }}"></script>
    <script src="{{ asset('app-assets/js/scripts/forms/select/form-select2.js') }}"></script>
    <script type="text/javascript" src="{{ asset('app-assets/pages/customer.js') }}"></script>
    <script type="text/javascript"></script>
@endpush('custom_js')
