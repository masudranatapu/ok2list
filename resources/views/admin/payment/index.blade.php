@extends('admin.layout.master')

@section('title')
    Payment Gateway
@endsection

@section('page-name')
    Payment Gateway
@endsection

@section('breadcrumb')
    <li class="breadcrumb-item">
        <a href="{{ route('admin.dashboard') }}">
            Dashboard
        </a>
    </li>
    <li class="breadcrumb-item active">
        Payment Gateway
    </li>
@endsection

@section('content')
    <div class="content-body">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <div class="row">
                            <div class="col-lg-6 col-md-12 mb-2 mb-lg-0">
                                    <h3>Payment Gateway <span class="badge bg-success">{{ $payments->count() }}</span></h3>
                            </div>
                            <div class="col-lg-6 col-md-12 text-right">
                                <a href="{{ route('payment-gateway.create') }}" class="btn btn-success">
                                    <i class="la la-plus-circle"></i>
                                    Add Payment Gateway
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <table class="table table-hover text-nowrap table-bordered">
                            <thead>
                                <tr>
                                    <th class="text-center">SL No</th>
                                    <th class="text-center">Name</th>
                                    <th class="text-center">Image</th>
                                    <th class="text-center">Live Mood Status</th>
                                    <th class="text-center">Status</th>
                                    <th class="text-center">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse ($payments as $key => $payment)
                                    <tr>
                                        <td class="text-center">{{ $key + 1 }}</td>
                                        <td class="text-center">
                                            {{ $payment->name }}
                                        </td>
                                        <td class="text-center">
                                            <img width="50" height="50" src="@if($payment->image) {{ asset($payment->image) }} @else {{ asset('images/demo.jpg') }} @endif" alt="">
                                        </td>
                                        <td class="text-center">
                                            @if($payment->live_mood == 1)
                                                <span class="badge bg-success">Live</span>
                                            @else
                                                <span class="badge bg-info">Sandbox</span>
                                            @endif
                                        </td>
                                        <td class="text-center">
                                            @if($payment->status == 1)
                                                <span class="badge bg-success">Active</span>
                                            @else
                                                <span class="badge bg-info">Inactive</span>
                                            @endif
                                        </td>
                                        <td class="d-flex justify-content-center align-items-center">
                                            <a href="{{ route('payment-gateway.edit', $payment->id) }}" class="btn btn-info btn-sm mt-0 mr-2">
                                                <i class="la la-edit"></i>
                                            </a>
                                            <form action="{{ route('payment-gateway.destroy', $payment->id) }}" class="d-inline" method="POST">
                                                @method('DELETE')
                                                @csrf
                                                <button data-toggle="tooltip" data-placement="top" title="{{ __('delete_payment_gateway') }}"
                                                    onclick="return confirm('{{ __('are_you_sure_want_to_delete_this_item?') }}');"
                                                    class="btn btn-sm bg-danger text-white">
                                                    <i class="la la-trash"></i>
                                                </button>
                                            </form>
                                        </td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td colspan="10" class="text-center">
                                            <h5 class="pt-3">No data</h5>
                                            <a class="btn btn-success mb-3" href="{{ route('payment-gateway.create') }}">
                                                <i class="la la-plus-circle"></i>
                                                Create Payment gateway
                                            </a>
                                        </td>
                                    </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>
                    <div class="card-footer">
                        <div class="row">
                            <div class="col-md-12">
                                {{ $payments->links() }}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('custom_css')

@endpush

@push('custom_js')


@endpush