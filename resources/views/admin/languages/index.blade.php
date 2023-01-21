@extends('admin.layout.master')

@section('title')
    {{ __('languages') }}
@endsection

@section('page-name')
    {{ __('languages') }}
@endsection

@section('breadcrumb')
    <li class="breadcrumb-item">
        <a href="{{ route('admin.dashboard') }}">{{ __('admin_breadcrumb_title') }}</a>
    </li>
    <li class="breadcrumb-item active">
        {{ __('languages') }}
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
                                        <h3>{{ __('languages') }} <span class="badge bg-success">{{ $languages->count() }}</span></h3>
                                    </div>
                                    <div class="col-md-9">
                                        <form action="{{ route('setDefault.Language') }}" method="POST">
                                            @csrf
                                            @method('put')
                                            <div class="row g-0">
                                                <div class="col-md-7 text-right">
                                                    <label style="margin-top: 0.7rem;"> {{ __('select_defualt_lang') }} :
                                                    </label>
                                                </div>
                                                <div class="col-md-5">
                                                    <select name="code" class="form-control"
                                                        onchange="this.form.submit()">
                                                        <option disabled selected>{{ __('language') }}</option>
                                                        @foreach ($languages as $language)
                                                            <option {{ $language->default_lang == 1 ? 'selected' : '' }}
                                                                value="{{ $language->code }}">
                                                                {{ $language->name }}({{ $language->code }})
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
                                <a href="{{ route('languages.create') }}" class="btn btn-success">
                                    <i class="la la-plus-circle"></i>
                                    {{ __('add_languages') }}
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <table class="table table-hover text-nowrap table-bordered">
                            <thead>
                                <tr>
                                    <th class="text-center">#</th>
                                    <th class="text-center">Name</th>
                                    <th class="text-center">Code</th>
                                    <th class="text-center">Direction</th>
                                    <th class="text-center">Flag</th>
                                    <th class="text-center">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse ($languages as $key => $language)
                                    <tr>
                                        <td class="text-center">{{ $key + 1 }}</td>
                                        <td class="text-center">
                                            {{ $language->name }}
                                            @if ($language->default_lang == 1)
                                                <span class="badge badge-pill badge-success">{{ __('default') }}</span>
                                            @endif
                                        </td>
                                        <td class="text-center">{{ $language->code }}</td>
                                        <td class="text-center">{{ $language->direction }}</td>
                                        <td class="text-center"><i class="flag-icon {{ $language->icon }}"></i></td>
                                        <td class="d-flex justify-content-center align-items-center">
                                            <a href="{{ route('Language.setting', $language->code) }}"
                                                class="btn btn-secondary btn-sm mr-2">
                                                <i class="la la-cog"></i>
                                            </a>
                                            @if ($language->code == 'en')
                                                <a href="javascript:void(0)" class="btn btn-warning btn-sm mt-0 mr-2"
                                                    data-toggle="tooltip" title="You can't delete or edit this language">
                                                    <i class="la la-lock"></i>
                                                </a>
                                            @endif
                                            @if ($language->code != 'en')
                                                <a href="{{ route('languages.edit', $language->id) }}"
                                                    class="btn btn-info btn-sm mt-0 mr-2">
                                                    <i class="la la-edit"></i>
                                                </a>
                                                @if ($language->code !== 'en')
                                                    <form action="{{ route('languages.destroy', $language->id) }}"
                                                        class="d-inline" method="POST">
                                                        @method('DELETE')
                                                        @csrf
                                                        <button data-toggle="tooltip" data-placement="top"
                                                            title="{{ __('delete_language') }}"
                                                            onclick="return confirm('{{ __('are_you_sure_want_to_delete_this_item?') }}');"
                                                            class="btn btn-sm bg-danger text-white">
                                                            <i class="la la-trash"></i>
                                                        </button>
                                                    </form>
                                                @endif
                                            @endif
                                        </td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td colspan="10" class="text-center">
                                            <h5 class="pt-3">{{ __('no_data') }}</h5>
                                            <a class="btn btn-success mb-3" href="{{ route('languages.create') }}">
                                                <i class="la la-plus-circle"></i>
                                                {{ __('add_languages') }}
                                            </a>
                                        </td>
                                    </tr>
                                @endforelse
                            </tbody>
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
