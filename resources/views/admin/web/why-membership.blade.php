@extends('admin.layout.master')

@section('Web Setting', 'open')

@section('why_membership', 'active')

@section('title')
    {{ __('why_membership_title') }}
@endsection

@section('page-name')
    {{ __('why_membership_title') }}
@endsection

@section('breadcrumb')
    <li class="breadcrumb-item"><a href="#">{{ __('admin_breadcrumb_title') }}</a></li>
    <li class="breadcrumb-item active">
        {{ __('why_membership_title') }}
    </li>
@endsection
<!--push from page-->
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
                            <div class="card-body card-dashboard">
                                <form action="{{ route('admin.why.membership.update', $membership->id) }}" method="POST">
                                    @csrf
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="package">{{ __('des') }}</label>
                                                <textarea cols="30" rows="5" class="form-control" name="desc" placeholder="Details English">{{ $membership->description }}</textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="form-actions text-center mt-3">
                                        <button type="submit" class="btn btn-success mr-1">
                                            {{ __('update') }}
                                        </button>
                                    </div>
                                </form>
                            </div>
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
