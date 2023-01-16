@extends('admin.layout.master')

@section('title')
    Currency
@endsection

@section('page-name')
    Currency
@endsection

@section('breadcrumb')
    <li class="breadcrumb-item">
        <a href="{{ route('admin.dashboard') }}">
            Dashboard
        </a>
    </li>
    <li class="breadcrumb-item active">
        Currency
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
                                <div class="row">
                                    <div class="col-md-3">
                                        <h3>Currency <span class="badge bg-success">{{ $currencies->count() }}</span></h3>
                                    </div>
                                    <div class="col-md-9">
                                        <form action="{{ route('setDefault.currency') }}" method="get">
                                            @csrf
                                            <div class="row g-0">
                                                <div class="col-md-7 text-right">
                                                    <label style="margin-top: 0.7rem;">Select Your default Currency : </label>
                                                </div>
                                                <div class="col-md-5">
                                                    <select name="id" class="form-control" onchange="this.form.submit()">
                                                        <option disabled selected>{{ __('Currency') }}</option>
                                                        @foreach ($currencies as $currency)
                                                            <option {{ ($currency->default_currencies == 1) ? 'selected' : '' }} value="{{ $currency->id }}">
                                                                {{ $currency->name }}
                                                            </option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-12 text-right">
                                <a href="{{ route('currency.create') }}" class="btn btn-success">
                                    <i class="la la-plus-circle"></i>
                                    Add Currency
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <table class="table table-hover text-nowrap table-bordered">
                            <table class="table table-hover text-nowrap table-bordered">
                                <thead class="text-center">
                                    <tr>
                                        <th width="5%">#</th>
                                        <th>Name</th>
                                        <th>Code</th>
                                        <th>Symbol</th>
                                        <th>Position</th>
                                        <th width="15%">Actions</th>
                                    </tr>
                                </thead>
                                <tbody class="text-center">
                                    @forelse ($currencies as $key => $currency)
                                        <tr>
                                            <td>{{ $key + 1 }}</td>
                                            <td>
                                                {{ $currency->name }}
                                                @if ($currency->default_currencies == 1)
                                                    <span class="badge badge-pill badge-primary">
                                                        {{ __('Default') }}
                                                    </span>
                                                @endif
                                            </td>
                                            <td>{{ $currency->code }}</td>
                                            <td>{{ $currency->symbol }}</td>
                                            <td>{{ Str::ucfirst($currency->symbol_position) }}</td>
                                            <td class="d-flex justify-content-center align-items-center">
                                                @if ($currency->code == 'USD')
                                                    <a href="javascript:void(0)" class="btn btn-warning btn-sm mt-0 mr-2" data-toggle="tooltip" title="{{ __('you_can_not_delete_or_edit_this_currency') }}">
                                                        <i class="la la-cog"></i>
                                                    </a>
                                                @endif
                                                @if ($currency->code != 'USD')
                                                    <a href="{{ route('currency.edit', $currency->id) }}" class="btn btn-info btn-sm mt-0 mr-2">
                                                        <i class="la la-edit"></i>
                                                    </a>
                                                    <form action="{{ route('currency.destroy', $currency->id) }}" class="d-inline" method="POST">
                                                        @method('DELETE')
                                                        @csrf
                                                        <button data-toggle="tooltip" data-placement="top" title="{{ __('Delete Currency') }}" onclick="return confirm('{{ __('are_you_sure_want_to_delete_this_item') }}');" class="btn btn-sm bg-danger">
                                                            <i class="la la-trash"></i>
                                                        </button>
                                                    </form>
                                                @endif
                                            </td>
                                        </tr>
                                    @empty
                                        <tr>
                                            <td colspan="10" class="text-center">
                                                <h5 class="pt-3">No data</h5>
                                                <a class="btn btn-success mb-3" href="{{ route('currency.create') }}">
                                                    <i class="la la-plus-circle"></i>
                                                    Create Currency
                                                </a>
                                            </td>
                                        </tr>
                                    @endforelse
                                </tbody>
                            </table>
                        </table>
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