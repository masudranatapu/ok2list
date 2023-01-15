@extends('admin.layout.master')

@section('title')
    Edit Languages
@endsection

@section('page-name')
    Edit Languages
@endsection

@section('breadcrumb')
    <li class="breadcrumb-item">
        <a href="{{ route('admin.dashboard') }}">
            Dashboard
        </a>
    </li>
    <li class="breadcrumb-item active">
        Edit Languages
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
                                <h3>Edit Languages</h3>
                            </div>
                            <div class="col-lg-6 col-md-12 text-right">
                                <a href="{{ route('languages.index') }}" class="btn btn-success">
                                    <i class="la la-arrow-left"></i>
                                    Back
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6 offset-md-3">
                                <form class="form-horizontal" action="{{ route('languages.update', $languages->id) }}" method="POST">
                                    @csrf
                                    @method('PUT')
                                    <div class="form-group row">
                                        <label class="col-sm-3">Name <span class="text-danger">*</span></label>
                                        <div class="col-sm-9">
                                            <select name="name" class="select2bs4 w-100 @error('name') is-invalid @enderror">
                                                @foreach ($translations as $key => $country)
                                                    <option {{ $country['name'] == $languages->name ? 'selected' : '' }}
                                                        value="{{ $country['name'] }}"> {{ $country['name'] }}</option>
                                                @endforeach
                                            </select>
                                            @error('name')
                                                <span class="invalid-feedback" role="alert"><strong>{{ $message }}</strong></span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-3">Code  <span class="text-danger">*</span></label>
                                        <div class="col-sm-9">
                                            <select name="code" class="select2bs4 w-100 @error('code') is-invalid @enderror">
                                                @foreach ($translations as $key => $country)
                                                    <option {{ $key == $languages->code ? 'selected' : '' }}
                                                        value="{{ $key }}"> {{ $key }}</option>
                                                @endforeach
                                            </select>
                                            @error('code')
                                                <span class="invalid-feedback" role="alert"><strong>{{ $message }}</strong></span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-3">Direction  <span class="text-danger">*</span></label>
                                        <div class="col-sm-9">
                                            <select name="direction"
                                                class="form-control @error('direction') is-invalid @enderror">
                                                <option {{ $languages->direction == 'ltr' ? 'selected' : '' }} value="ltr">
                                                    LTR</option>
                                                <option {{ $languages->direction == 'rtl' ? 'selected' : '' }} value="rtl">
                                                    RTL</option>
                                            </select>
                                            @error('direction')
                                                <span class="invalid-feedback" role="alert"><strong>{{ $message }}</strong></span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-3">Flag  <span class="text-danger">*</span></label>
                                        <div class="col-sm-9">
                                            <input type="hidden" name="icon" id="icon"
                                                value="{{ old('icon', $languages->icon) }}" />
                                            <div id="target"></div>
                                            @error('icon')
                                                <span class="invalid-feedback d-block" role="alert"><strong>{{ $message }}</strong></span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="offset-sm-3 col-sm-4">
                                            <button type="submit" class="btn btn-success">
                                                <i class="fas fa-sync"></i>&nbsp; {{ __('update') }}</button>
                                        </div>
                                    </div>
    
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('custom_css')
    <link rel="stylesheet" href="{{ asset('backend') }}/bootstrap-iconpicker/dist/css/bootstrap-iconpicker.min.css" />
    <link rel="stylesheet" href="{{ asset('backend') }}/select2/css/select2.min.css">
    <link rel="stylesheet" href="{{ asset('backend') }}/select2-bootstrap4-theme/select2-bootstrap4.min.css">

    <style>
        .select2-results__option[aria-selected=true] {
            display: none;
        }
        .select2-container--bootstrap4 .select2-selection--multiple .select2-selection__choice {
            color: #fff;
            border: 1px solid #fff;
            background: #007bff;
            border-radius: 30px;
        }

        .select2-container--bootstrap4 .select2-selection--multiple .select2-selection__choice__remove {
            color: #fff;
        }

    </style>
@endpush

@push('custom_js')
    <script type="text/javascript" src="{{ asset('backend') }}/bootstrap-iconpicker/dist/js/bootstrap-iconpicker.bundle.min.js"></script>
    <script src="{{ asset('backend') }}/select2/js/select2.full.min.js"></script>
    <script>
        //Initialize Select2 Elements
        $('.select2bs4').select2({
            theme: 'bootstrap4'
        })
        
        $('#target').iconpicker({
            align: 'left', // Only in div tag
            arrowClass: 'btn-danger',
            arrowPrevIconClass: 'la la-arrow-left',
            arrowNextIconClass: 'la la-arrow-right',
            cols: 15,
            footer: true,
            header: true,
            icon: '{{ $languages->icon }}',
            iconset: 'flagicon',
            labelHeader: '{0} of {1} pages',
            labelFooter: '{0} - {1} of {2} icons',
            placement: 'bottom', // Only in button tag
            rows: 5,
            search: true,
            searchText: 'Search',
            selectedClass: 'btn-success',
            unselectedClass: ''
        });

        $('#target').on('change', function(e) {
            $('#icon').val(e.icon)
        });
    </script>
@endpush