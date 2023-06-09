@extends('admin.layout.master')

@section('Web Setting', 'open')

@section('quick_rules', 'active')

@section('title') {{ __('quick_rules_title') }} @endsection
@section('page-name') {{ __('quick_rules_title') }} @endsection

@section('breadcrumb')
    <li class="breadcrumb-item"><a href="#">{{ __('breadcrumb_title') }}</a></li>
    <li class="breadcrumb-item active">{{ __('quick_rules_title') }} </li>
@endsection

@push('custom_css')
    <link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
@endpush('custom_css')

@section('content')
    <div class="content-body">
        <section id="pagination">
            <div class="row">
                <form action="{{ route('admin.quick.rulesupdate', $quickrules->id) }}" method="POST">
                    @csrf
                    <div class="col-md-12">
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
                            <div class="card-content collapse show">
                                <div class="card-body card-dashboard">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="package">{{ __('title') }}</label>
                                                <input type="text" class="form-control" name="title_en"
                                                    value="{{ $quickrules->title_en }}">
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="package">Sub-Title En</label>
                                                <textarea class="form-control" rows="5" name="sub_title_en">{{ $quickrules->sub_title_en }}</textarea>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="package">Rule One En</label>
                                                <input type="text" class="form-control" name="one_en"
                                                    value="{{ $quickrules->one_en }}">
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="package">Rule Two En</label>
                                                <input type="text" class="form-control" name="two_en"
                                                    value="{{ $quickrules->two_en }}">
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="package">Rule Three En</label>
                                                <input type="text" class="form-control" name="three_en"
                                                    value="{{ $quickrules->three_en }}">
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="package">Rule Four En</label>
                                                <input type="text" class="form-control" name="four_en"
                                                    value="{{ $quickrules->four_en }}">
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="package">Rule Five En</label>
                                                <input type="text" class="form-control" name="five_en"
                                                    value="{{ $quickrules->five_en }}">
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="package">Rule Six En</label>
                                                <input type="text" class="form-control" name="six_en"
                                                    value="{{ $quickrules->six_en }}">
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="package">Rule Seven En</label>
                                                <input type="text" class="form-control" name="seven_en"
                                                    value="{{ $quickrules->seven_en }}">
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="package">Rule Eight En</label>
                                                <input type="text" class="form-control" name="eight_en"
                                                    value="{{ $quickrules->eight_en }}">
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="package">Rule Nine En</label>
                                                <input type="text" class="form-control" name="nine_en"
                                                    value="{{ $quickrules->nine_en }}">
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="package">Rule Ten En</label>
                                                <input type="text" class="form-control" name="ten_en"
                                                    value="{{ $quickrules->ten_en }}">
                                            </div>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="form-actions text-center mt-3">
                                        <button type="submit" class="btn btn-success mr-1">
                                            Update
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </section>
    </div>
@endsection

@push('custom_js')
    <script src="{{ asset('app-assets/vendors/js/forms/select/select2.full.min.js') }}"></script>
    <script src="{{ asset('app-assets/js/scripts/forms/select/form-select2.js') }}"></script>
    <script type="text/javascript" src="{{ asset('app-assets/pages/customer.js') }}"></script>
    <script src="https://cdn.ckeditor.com/4.15.1/standard/ckeditor.js"></script>
    <script>
        CKEDITOR.replace('desc');
        CKEDITOR.replace('desc1');
        CKEDITOR.replace('desc2');
        CKEDITOR.replace('desc3');
    </script>
@endpush('custom_js')
