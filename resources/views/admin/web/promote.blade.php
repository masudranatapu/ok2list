@extends('admin.layout.master')

@section('Web Setting','open')

@section('promite','active')

@section('title')
    Promite
@endsection

@section('page-name')
    Promote
@endsection

@section('breadcrumb')
    <li class="breadcrumb-item"><a href="#">@lang('admin_role.breadcrumb_title')  </a></li>
    <li class="breadcrumb-item active">@lang('web_setting.why_membeRship_title')    </li>
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
                        <div class="card-content collapse show">
                            <div class="card-body card-dashboard">
                                <form action="{{route('admin.promote.update', $promote->id)}}" method="POST">
                                    @csrf
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="package">Description ( En )</label>
                                                <textarea cols="30" rows="5" class="form-control" name="desc"  placeholder="Details English">{{$promote->description}}</textarea>
                                            </div>
                                            <div class="form-group">
                                                <label for="package">Description ( SL )</label>
                                                <textarea cols="30" rows="5" class="form-control" name="desc1"  placeholder="Details SL">{{$promote->description_sl}}</textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="form-actions text-center mt-3">
                                        <button type="submit" class="btn btn-success mr-1">
                                            Update
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card card-sm">
                        <div class="card-header">
                            <h4>Demo Image</h4>
                        </div>
                        <div class="card-body">
                            <img width="650" height="1000" src="{{asset('assets/images/about-us/about.jpg')}}" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
@endsection

@push('custom_js')
    <script src="{{ asset('app-assets/vendoRs/js/forms/select/select2.full.min.js')}}"></script>
    <script src="{{ asset('app-assets/js/scripts/forms/select/form-select2.js')}}"></script>
    <script type="text/javascript" src="{{ asset('app-assets/pages/customer.js')}}"></script>
    <script src="https://cdn.ckeditor.com/4.15.1/standard/ckeditor.js"></script>
    <script>
            CKEDITOR.replace('desc');
            CKEDITOR.replace('desc1');
    </script>
@endpush('custom_js')