@extends('admin.layout.master')

@section('Web Setting', 'open')

@section('howto_sell_first', 'active')

@section('title')
    {{ __('howto_sell_title') }}
@endsection

@section('page-name')
    {{ __('howto_sell_title') }}
@endsection

@section('breadcrumb')
    <li class="breadcrumb-item"><a href="#">{{ __('breadcrumb_title') }}</a></li>
    <li class="breadcrumb-item active">{{ __('howto_sell_title') }} </li>
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

                        {!! Form::open([
                            'route' => 'admin.howtosell.fast.store',
                            'method' => 'post',
                            'class' => 'form-horizontal',
                            'files' => true,
                            'novalidate',
                            'autocomplete' => 'off',
                        ]) !!}

                        <div class="card-content collapse show">
                            <div class="card-body card-dashboard">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label for="package">{{ __('des') }}</label>
                                            <textarea name="desc">{!! $data['row']->description ?? null !!}</textarea>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label for="package">{{ __('des') }}</label>
                                            <textarea name="desc1">{!! $data['row']->description_sl ?? null !!}</textarea>
                                        </div>
                                    </div>
                                </div>
                                <hr>
                                <div class="form-actions text-center mt-3">
                                    <a href="">
                                        <button type="submit" class="btn btn-success mr-1">{{ __('update') }}</button>
                                    </a>
                                </div>
                            </div>
                        </div>
                        {!! Form::close() !!}
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card card-sm">
                        <div class="card-header">
                            <h4>{{ __('demo_image') }}</h4>
                        </div>
                        <div class="card-body">
                            <img width="650" height="1000" src="{{ asset('assets/images/about-us/about.jpg') }}"
                                alt="">
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
    <script src="https://cdn.ckeditor.com/4.15.1/standard/ckeditor.js"></script>
    <script>
        CKEDITOR.replace('desc');
        CKEDITOR.replace('desc1');
        // CKEDITOR.replace('desc2');
        // CKEDITOR.replace('desc3');
    </script>
@endpush('custom_js')
