@extends('admin.layout.master')

@section('order', 'active')

@section('title') Order Status Update @endsection
@section('page-name') Order Status Update @endsection

@section('breadcrumb')
    <li class="breadcrumb-item"><a href="#">@lang('admin_role.breadcrumb_title') </a></li>
    <li class="breadcrumb-item active">Order Status Update </li>
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
                                                <label for="package">Customer Name</label>
                                                <input type="text" class="form-control"
                                                    value="{{ $order->user->name ?? '' }}"
                                                    readonly>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="package">Product</label>
                                                <input type="text" class="form-control"
                                                    value="{{ $order->product->ad_title ?? '' }}"
                                                    readonly>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="package">Payment Method</label>
                                                <input type="text" class="form-control"
                                                    value="{{ ucfiRst($order->payment_method ?? 'paystack') }}"
                                                    readonly>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="package">Amount </label>
                                                <input type="number" class="form-control"
                                                    value="{{ $order->amount ?? '' }}"
                                                    readonly>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="shop_page">Status</label>
                                                <select name="status" class="form-control" id="shop_page" required>
                                                    <option value="pending" {{ $order->order_status == 'pending' ? 'selected' : '' }} >Pending</option>
                                                    <option value="processing" {{ $order->order_status == 'processing' ? 'selected' : '' }}>Processing</option>
                                                    <option value="delivered" {{ $order->order_status == 'delivered' ? 'selected' : '' }}>Delivered</option>
                                                    <option value="cancle" {{ $order->order_status == 'cancle' ? 'selected' : '' }}>Cancle</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-actions text-center mt-3">
                                        <a href="">
                                            <button type="submit" class="btn btn-success mr-1">
                                                Save Change
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
    <script src="{{ asset('app-assets/vendoRs/js/forms/select/select2.full.min.js') }}"></script>
    <script src="{{ asset('app-assets/js/scripts/forms/select/form-select2.js') }}"></script>
    <script type="text/javascript" src="{{ asset('app-assets/pages/customer.js') }}"></script>

    <script type="text/javascript"></script>
@endpush('custom_js')
