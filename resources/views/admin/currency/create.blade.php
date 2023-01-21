@extends('admin.layout.master')

@section('title')
    {{ __('add_new_curr') }}
@endsection

@section('page-name')
    {{ __('add_new_curr') }}
@endsection

@section('breadcrumb')
    <li class="breadcrumb-item">
        <a href="{{ route('admin.dashboard') }}">{{ __('admin_breadcrumb_title') }}</a>
    </li>
    <li class="breadcrumb-item active">
        {{ __('add_new_curr') }}
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
                                <h3> {{ __('add_new_curr') }}</h3>
                            </div>
                            <div class="col-lg-6 col-md-12 text-right">
                                <a href="{{ route('currency.index') }}" class="btn btn-success">
                                    <i class="la la-arrow-left"></i>
                                    {{ __('back') }}
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="col-md-6 offset-md-3">
                            <form class="form-horizontal" action="{{ route('currency.store') }}" method="POST">
                                @csrf
                                <div class="form-group row">
                                    <label class="col-sm-3" >Name </label>
                                    <div class="col-sm-9">
                                        <input type="text" name="name" id="name" class="form-control @error('name') is-invalid @enderror" value="{{ old('name') }}" placeholder="{{ __('E.g - Dollar') }}">
                                        @error('name')
                                            <span class="invalid-feedback" role="alert">{{ __($message) }}</span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-3" >Code </label>
                                    <div class="col-sm-9">
                                        <input type="text" name="code" id="code" class="form-control @error('code') is-invalid @enderror" value="{{ old('code') }}" placeholder="{{ __('E.g - USD') }}">
                                        @error('code')
                                            <span class="invalid-feedback" role="alert">{{ __($message) }}</span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-3" >Symbol </label>
                                    <div class="col-sm-9">
                                        <input type="text" name="symbol" id="symbol" class="form-control @error('symbol') is-invalid @enderror" value="{{ old('symbol') }}" placeholder="E.g - $">
                                        @error('symbol')
                                            <span class="invalid-feedback" role="alert">{{ __($message) }}</span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-3" >
                                        Conversion Rate
                                        <br>
                                        @if($getDefualtCurrency)
                                            <small>( Based on  {{ $getDefualtCurrency->code }} )</small>
                                        @else
                                            <small>( First set your based currency )</small>
                                        @endif
                                    </label>
                                    <div class="col-sm-9">
                                        <input type="number" name="conversion_rate" step="0.0001" min="0" id="conversion_rate" class="form-control @error('conversion_rate') is-invalid @enderror" value="{{ old('conversion_rate') }}" placeholder="Conversion rate">
                                        @error('conversion_rate')
                                            <span class="invalid-feedback" role="alert">{{ __($message) }}</span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-3" >Position </label>
                                    <div class="col-sm-9">
                                        <select name="symbol_position" class="form-control @error('symbol_position') is-invalid @enderror">
                                            <option value="left">Left</option>
                                            <option value="right">Right</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="offset-sm-3 col-sm-4">
                                        <button type="submit" class="btn btn-success"><i class="fas fa-plus"></i>&nbsp;
                                            {{ __('create') }}
                                        </button>
                                    </div>
                                </div>
                            </form>
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
