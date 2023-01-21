@extends('admin.layout.master')

@section('Web Setting', 'open')
@section('about_us', 'active')

@section('title') {{ __('about') }} @endsection
@section('page-name') {{ __('about') }} @endsection

@section('breadcrumb')
    <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">{{ __('admin_breadcrumb_title') }}</a>
    </li>
    <li class="breadcrumb-item active">{{ __('about') }} </li>
@endsection

@push('custom_css')
    <link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
@endpush('custom_css')

@section('content')
    <div class="content-body">
        <section id="pagination">
            <div class="row">
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
                            <form action="{{ route('admin.about.us.update', $about->id) }}" enctype="multipart/form-data"
                                method="POST">
                                @csrf
                                <div class="card-body card-dashboard">
                                    <div class="row">
                                        <div class="col-6">
                                            <div class="form-group">
                                                <label for="package">Main Image</label>
                                                <input type="file" class="form-control" name="image">
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="form-group">
                                                <img width="120" class="img-thumbnail" src="{{ asset($about->image) }}"
                                                    alt="about image">
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="package">Details</label>
                                                <textarea cols="30" rows="5" class="form-control" name="desc" placeholder="Details English">{{ $about->details_en }}</textarea>
                                            </div>
                                        </div>
                                        {{-- <div class="col-12">
                                            <div class="form-group">
                                                <label for="package">Details ( Sl )</label>
                                                <textarea cols="30" rows="5" class="form-control" name="desc1" placeholder="Details Sl">{{ $about->details_sl }}</textarea>
                                            </div>
                                        </div> --}}
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="package">Mission</label>
                                                <textarea cols="30" rows="5" class="form-control" name="mission_en" placeholder="Mission English">{{ $about->mission_en }}</textarea>
                                            </div>
                                        </div>
                                        {{-- <div class="col-12">
                                            <div class="form-group">
                                                <label for="package">Mission ( Sl )</label>
                                                <textarea cols="30" rows="5" class="form-control" name="mission_sl" placeholder="Mission Sl">{{ $about->mission_sl }}</textarea>
                                            </div>
                                        </div> --}}
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="package">Vision</label>
                                                <textarea cols="30" rows="5" class="form-control" name="vision_en" placeholder="Vision English">{{ $about->vision_en }}</textarea>
                                            </div>
                                        </div>
                                        {{-- <div class="col-12">
                                            <div class="form-group">
                                                <label for="package">Vision ( Sl )</label>
                                                <textarea cols="30" rows="5" class="form-control" name="vision_sl" placeholder="Vision SL">{{ $about->vision_sl }}</textarea>
                                            </div>
                                        </div> --}}
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="package">Our Values</label>
                                                <textarea cols="30" rows="5" class="form-control" name="our_values_en" placeholder="Our Values English">{{ $about->our_values_en }}</textarea>
                                            </div>
                                        </div>
                                        {{-- <div class="col-12">
                                            <div class="form-group">
                                                <label for="package">Our Values ( Sl )</label>
                                                <textarea cols="30" rows="5" class="form-control" name="our_values_sl" placeholder="Our Values Sl">{{ $about->our_values_sl }}</textarea>
                                            </div>
                                        </div> --}}
                                    </div>
                                    <hr>
                                    <div class="form-actions text-center mt-3">
                                        <button type="submit" class="btn btn-success mr-1">
                                            Update
                                        </button>
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

@push('custom_js')
    <script src="{{ asset('app-assets/vendors/js/forms/select/select2.full.min.js') }}"></script>
    <script src="{{ asset('app-assets/js/scripts/forms/select/form-select2.js') }}"></script>
    <script type="text/javascript" src="{{ asset('app-assets/pages/customer.js') }}"></script>
    <script src="https://cdn.ckeditor.com/4.15.1/standard/ckeditor.js"></script>
    <script>
        CKEDITOR.replace('desc');
        CKEDITOR.replace('desc1');
    </script>
@endpush('custom_js')
