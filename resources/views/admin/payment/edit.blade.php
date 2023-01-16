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
                                <h3>Edit Payment Gateway </h3>
                            </div>
                            <div class="col-lg-6 col-md-12 text-right">
                                <a href="{{ route('payment-gateway.index') }}" class="btn btn-success">
                                    <i class="la la-arrow-left"></i>
                                    Back
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <form action="{{ route('payment-gateway.update', $payments->id) }}" enctype="multipart/form-data" method="post">
                            @csrf
                            @method('PUT')
                            <div class="row">
                                <div class="col-md-6 mb-2 mb-lg-0">
                                    <label for="">Name</label>
                                    <input type="text" placeholder="Payment getway name" name="name" value="{{ $payments->name }}" class="form-control @error('name') is-invalid @enderror">
                                    @error('name')
                                        <span class="invalid-feedback"  role="alert"><strong>{{ $message }}</strong></span>
                                    @enderror
                                </div>
                                <div class="col-md-6">
                                    <label for="">Image</label>
                                    <input type="file" class="form-control" name="image">
                                    @error('image')
                                        <span class="invalid-feedback"  role="alert"><strong>{{ $message }}</strong></span>
                                    @enderror
                                </div>
                            </div>
                            <div class="row mt-2">
                                <div class="col-md-6 mb-2 mb-lg-0">
                                    <label for="">Public key</label>
                                    <input type="text" placeholder="Public key" name="public_key" value="{{ $payments->public_key }}" class="form-control @error('public_key') is-invalid @enderror">
                                    @error('public_key')
                                        <span class="invalid-feedback"  role="alert"><strong>{{ $message }}</strong></span>
                                    @enderror
                                </div>
                                <div class="col-md-6">
                                    <label for="">Secret key</label>
                                    <input type="text" placeholder="Secret key" name="secret_key" value="{{ $payments->secret_key }}" class="form-control @error('secret_key') is-invalid @enderror">
                                    @error('secret_key')
                                        <span class="invalid-feedback"  role="alert"><strong>{{ $message }}</strong></span>
                                    @enderror
                                </div>
                            </div>
                            <div class="row mt-2">
                                <div class="col-md-6 mb-2 mb-lg-0">
                                    <label for="">Live Mood Status</label>
                                    <select name="live_mood" class="form-control @error('live_mood') is-invalid @enderror">
                                        <option value="0" @if($payments->live_mood == 0) selected @endif>Sandbox</option>
                                        <option value="1" @if($payments->live_mood == 1) selected @endif>Live</option>
                                    </select>
                                    @error('live_mood')
                                        <span class="invalid-feedback"  role="alert"><strong>{{ $message }}</strong></span>
                                    @enderror
                                </div>
                                <div class="col-md-6">
                                    <label for="">Status</label>
                                    <select name="status" class="form-control @error('status') is-invalid @enderror">
                                        <option value="1" @if($payments->status == 1) selected @endif>Active</option>
                                        <option value="0" @if($payments->status == 0) selected @endif>Inactive</option>
                                    </select>
                                    @error('status')
                                        <span class="invalid-feedback"  role="alert"><strong>{{ $message }}</strong></span>
                                    @enderror
                                </div>
                            </div>
                            <div class="row mt-2">
                                <div class="col-md-12 text-center">
                                    <button type="submit" class="btn btn-success">Update</button>
                                </div>
                            </div>
                        </form>
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