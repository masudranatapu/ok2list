@extends('admin.layout.master')

@section('Customer Management', 'open')
@section('package_list', 'active')

@section('title') {{ __('editpackage') }} @endsection
@section('page-name') {{ __('editpackage') }} @endsection

@section('breadcrumb')
    <li class="breadcrumb-item"><a href="#">{{ __('breadcrumb_title') }}</a></li>
    <li class="breadcrumb-item active">{{ __('editpackage') }} </li>
@endsection
<!--push from page-->
@push('custom_css')
    <link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
@endpush('custom_css')

@section('content')
    @php
        $row = $data['data'];
    @endphp
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
                            <form action="{{ route('admin.package.update', $row->pk_no) }}" method="post">
                                @csrf
                                <div class="card-body card-dashboard">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="package">{{ __('package_name') }}</label>
                                                <input type="text" class="form-control" value="{{ $row->title }}"
                                                    name="title" placeholder="Package Name" required>
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="package">{{ __('package_price') }} (₦)</label>
                                                <input type="number" class="form-control"
                                                    value="{{ $row->price_per_month }}" name="price_per_month"
                                                    placeholder="Package Price" required>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="sms_feature">{{ __('SMS_Feature') }}</label>
                                                <select name="sms_feature" id="sms_feature" class="form-control" required>
                                                    <option value="1"
                                                        @php if ($row['sms_feature'] == 1) { echo "selected"; } @endphp>{{ __('yes') }}
                                                    </option>
                                                    <option value="0"
                                                        @php if ($row['sms_feature'] == 0) { echo "selected"; } @endphp>{{ __('no') }}
                                                    </option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="package">{{ __('email_feature') }}</label>
                                                <select name="email_feature" class="form-control" id="" required>
                                                    <option value="1"
                                                        @php if ($row['email_feature'] == 1) { echo "selected"; } @endphp>
                                                        {{ __('yes') }}</option>
                                                    <option value="0"
                                                        @php if ($row['email_feature'] == 0) { echo "selected"; } @endphp>{{ __('no') }}
                                                    </option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="shop_page">{{ __('Shop_Page') }}</label>
                                                <select name="shop_page" class="form-control" id="shop_page" required>
                                                    <option value="1"
                                                        @php if ($row['shop_page'] == 1) { echo "selected"; } @endphp>{{ __('yes') }}
                                                    </option>
                                                    <option value="0"
                                                        @php if ($row['shop_page'] == 0) { echo "selected"; } @endphp>{{ __('no') }}
                                                    </option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="analytics">{{ __('analytice') }}</label>
                                                <select name="analytics" class="form-control" id="analytics" required>
                                                    <option value="1"
                                                        @php if ($row['analytics'] == 1) { echo "selected"; } @endphp>{{ __('yes') }}
                                                    </option>
                                                    <option value="0"
                                                        @php if ($row['analytics'] == 0) { echo "selected"; } @endphp>{{ __('no') }}
                                                    </option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="package">{{ __('limit_per_month') }}</label>
                                                <input type="number" class="form-control"
                                                    value="{{ $row->ad_limit_in_montrh }}" name="ad_limit_in_montrh"
                                                    placeholder="{{ __('limit_per_month') }}">
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="package">{{ __('p_duration') }}</label>
                                                <input type="number" class="form-control"
                                                    value="{{ $row->package_duration }}" name="package_duration"
                                                    placeholder="{{ __('p_duration') }}">
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="package">{{ __('support_duration') }}</label>
                                                <input type="text" class="form-control"
                                                    value="{{ $row->support_duration }}" name="support_duration"
                                                    placeholder="{{ __('support_duration') }}">
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="package">{{ __('dis_pro') }}</label>
                                                <input type="number" class="form-control"
                                                    value="{{ $row->discount_on_promotion }}" name="discount_on_promotion"
                                                    placeholder="{{ __('dis_pro') }}">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-actions text-center mt-3">
                                        <a href="">
                                            <button type="submit" class="btn btn-success mr-1">
                                                {{ __('submit') }}
                                            </button>
                                        </a>
                                        <a href="">
                                            <button type="button" class="btn btn-warning mr-1">
                                                <i class="ft-x"></i>{{ __('btn_cancle') }}
                                            </button>
                                        </a>
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
<!--push from page-->
@push('custom_js')
    <script src="{{ asset('app-assets/vendors/js/forms/select/select2.full.min.js') }}"></script>
    <script src="{{ asset('app-assets/js/scripts/forms/select/form-select2.js') }}"></script>
    <script type="text/javascript" src="{{ asset('app-assets/pages/customer.js') }}"></script>

    <script type="text/javascript"></script>
@endpush('custom_js')
