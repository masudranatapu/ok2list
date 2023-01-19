@extends('admin.layout.master')

@section('product_list', 'active')
@section('Product Management', 'open')

@section('title') {{ __('admin_product_view') }} @endsection
@section('page-name') {{ __('admin_product_view') }} @endsection

@section('breadcrumb')
    <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">{{ __('admin_breadcrumb_title') }}</a></li>
    <li class="breadcrumb-item active">{{ __('admin_breadcrumb_sub_title') }}</li>
@endsection

@push('custom_css')
    <style type="text/css">
        #scrollable-dropdown-menu .tt-menu {
            max-height: 260px;
            overflow-y: auto;
            width: 100%;
            border: 1px solid #333;
            border-radius: 5px;
        }
        #scrollable-dropdown-menu2 .tt-menu {
            max-height: 260px;
            overflow-y: auto;
            width: 100%;
            border: 1px solid #333;
            border-radius: 5px;

        }

        .twitter-typeahead {
            display: block !important;
            /*width: 90%;*/
        }
    </style>
@endpush('custom_css')

    <?php

        $roles = userRolePermissionArray();
        $type = request('type') ?? null;
        $row = $data['row'];

        // echo "<pre>";
        // print_r($row->allPhotos);
        // die();

    ?>

@section('content')
    <div class="content-body">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-content">
                        <div class="card-body">
                            {{-- <form action="{{route('product.update-url-slug')}}" method="post" novalidate>
                            @csrf
                            <div class="row form-group">
                                <label class="col-sm-3">URL Slug</label>
                                <div class="col-sm-9 user-type">
                                    <div class="input-group">
                                        <input type="hidden" name="prod_pk_no" value="{{$row->pk_no}}" />
                                        <input type="search" value="{{$row->url_slug}}" name="q" id="key_search" class="form-control search-input2" autocomplete="off" data-validation-required-message ="This field is required" />



                                        <div class="input-group-append">
                                            <button type="submit" class="btn btn-primary btn-xs" style="width: 40px;" type="button"><i class="la la-pencil"></i></button>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </form> --}}

                            {!! Form::open([
                                'route' => ['admin.product.update', $row->pk_no],
                                'method' => 'post',
                                'class' => 'form-horizontal',
                                'files' => true,
                            ]) !!}
                            <div class="row form-group">
                                <label class="col-sm-3">{{ __('url_slug') }}</label>
                                <div class="col-sm-9 user-type">
                                    <input type="search" value="{{ $row->url_slug }}" name="url_slug" id="key_search"
                                        class="form-control search-input2 noSpace" autocomplete="off"
                                        data-validation-required-message="This field is required" />

                                </div>
                            </div>
                            <div class="row form-group">
                                <label class="col-sm-3">{{ __('promotion_type') }}</label>
                                <div class="col-sm-9 user-type">
                                    <select class="form-control" name="promotion" disabled>
                                        <option value="" selected="">--select--</option>
                                        <option value="Top" {{ $row->promotion == 'Top' ? 'selected' : '' }}>Top</option>
                                        <option value="Feature" {{ $row->promotion == 'Feature' ? 'selected' : '' }}>Feature
                                        </option>
                                        <option value="Urgent" {{ $row->promotion == 'Urgent' ? 'selected' : '' }}>Urgent
                                        </option>
                                        <option value="Basic" {{ $row->promotion == 'Basic' ? 'selected' : '' }}>Free
                                        </option>
                                    </select>
                                </div>
                            </div>

                            <div class="row form-group">
                                <label class="col-sm-3">{{ __('post_for') }}</label>
                                <div class="col-sm-9 user-type">
                                    {{ $row->main_category }}
                                </div>
                            </div>
                            <div class="row form-group">
                                <label class="col-sm-3">{{ __('type_of_ad') }}</label>
                                <div class="col-sm-9 user-type">
                                    {{ $row->ad_type }}
                                </div>
                            </div>

                            <div class="row form-group add-title">
                                <label class="col-sm-3 label-title">{{ __('ad_title') }}</label>
                                <div class="col-sm-9">
                                    <input type="text" readonly="" class="form-control" id="text"
                                        value="{{ $row->ad_title }}">
                                </div>
                            </div>
                            {{-- <div class="row form-group add-title">
                        <label class="col-sm-3 label-title">Product Type</label>
                        <div class="col-sm-9">
                            <input type="text" readonly="" class="form-control" id="text" value="{{$row->prod_type}}">
                        </div>
                    </div> --}}
                            <div class="row form-group add-title">
                                <label class="col-sm-3 label-title">{{ __('city') }}</label>
                                <div class="col-sm-9">
                                    <input type="text" readonly="" class="form-control" id="text"
                                        value="{{ $row->area->city->name ?? $row->area->division->name }}">
                                </div>
                            </div>
                            <div class="row form-group add-title">
                                <label class="col-sm-3 label-title">{{ __('area') }}</label>
                                <div class="col-sm-9">
                                    <input type="text" readonly="" class="form-control" id="text"
                                        value="{{ $row->area->name ?? '' }}">
                                </div>
                            </div>
                            <div class="row form-group add-image">
                                <label class="col-sm-3 label-title">{{ __('ad_photos') }}</label>
                                <div class="col-sm-9 adsimgview">
                                    <div class="upload-section">
                                        @if ($row->allPhotos && count($row->allPhotos) > 0)
                                            @foreach ($row->allPhotos as $img)
                                                <a href="" target="_blank"><img class="img-thumbnail example-image"
                                                        src="{{ asset('uploads/product/' . $row->pk_no . '/' . $img->img_name) }}"
                                                        alt="" width="200" /></a>
                                            @endforeach
                                        @endif
                                    </div>
                                </div>
                            </div>
                            <div class="row form-group select-condition">
                                <label class="col-sm-3">{{ __('con') }}</label>
                                <div class="col-sm-9">
                                    {{ $row->using_condition }}
                                </div>
                            </div>
                            <div class="row form-group select-price">
                                <label class="col-sm-3 label-title">{{ __('price') }}</label>
                                <div class="col-sm-9">

                                    <input type="text" readonly="" value="{{ $row->price }}" class="form-control"
                                        id="text1">
                                    <div class="checkbox mt-2">
                                        <input type="radio" name="price" value="negotiable" id="negotiable"
                                            {{ $row->negotiable == 1 ? 'checked' : '' }}>
                                        <label for="negotiable">{{ __('negotiable') }} </label>
                                    </div>
                                </div>
                            </div>
                            <div class="row form-group brand-name">
                                <label class="col-sm-3 label-title">{{ __('category') }}</label>
                                <div class="col-sm-9">
                                    <input type="text" readonly="" class="form-control"
                                        value="{{ $row->category->name }}">
                                </div>
                            </div>
                            <div class="row form-group brand-name">
                                <label class="col-sm-3 label-title">{{ __('subcategory') }}</label>
                                <div class="col-sm-9">
                                    <input type="text" readonly="" class="form-control"
                                        value="{{ $row->subcategory->name }}">
                                </div>
                            </div>
                            <div class="row form-group brand-name">
                                <label class="col-sm-3 label-title">{{ __('brand_name') }}</label>
                                <div class="col-sm-9">
                                    <input type="text" readonly="" class="form-control"
                                        value="{{ $row->brand_name }}">
                                </div>
                            </div>
                            <div class="row form-group model-name">
                                <label class="col-sm-3 label-title">{{ __('model') }}</label>
                                <div class="col-sm-9">
                                    <input type="text" readonly="" class="form-control" id="model"
                                        value="{{ $row->model_name }}">
                                </div>
                            </div>
                            <div class="row form-group additional">
                                <label class="col-sm-3 label-title">{{ __('additional') }}</label>
                                <div class="col-sm-9">
                                    {{ $row->prod_feature }}
                                </div>
                            </div>
                            <div class="row form-group item-description">
                                <label class="col-sm-3 label-title">{{ __("des") }}</label>
                                <div class="col-sm-9">
                                    <textarea class="form-control" id="textarea" readonly="" rows="8">{{ $row->description }}</textarea>
                                </div>
                            </div>
                            <div class="row form-group brand-name">
                                <label class="col-sm-3 label-title">{{ __('date_time') }}</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control"
                                        value="{{ date('d M, Y : h :i A', strtotime($row->created_at)) }}">
                                </div>
                            </div>
                            <div class="section seller-info">
                                <h4>{{ __('seller_info') }}</h4>
                                <div class="row form-group">
                                    <label class="col-sm-3 label-title">{{ __('seller_type') }}</label>
                                    <div class="col-sm-9">
                                        {{ $row->customer->seller_type ?? '' }}
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <label class="col-sm-3 label-title"{{ __('name') }}</label>
                                    <div class="col-sm-9">
                                        <input type="text" readonly="" name="name" class="form-control"
                                            value="{{ $row->customer->name ?? '' }}">
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <label class="col-sm-3 label-title">{{ __('email') }}</label>
                                    <div class="col-sm-9">
                                        <input type="email" readonly="" name="email" class="form-control"
                                            value="{{ $row->customer->email ?? '' }}">
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <label class="col-sm-3 label-title">{{ __('admin_phone') }}</label>
                                    <div class="col-sm-9">
                                        <input type="text" readonly="" name="mobileNumber" class="form-control"
                                            value="{{ $row->customer->mobile1 ?? '' }}">
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <label class="col-sm-3 label-title">{{ __('admin_phone2') }}</label>
                                    <div class="col-sm-9">
                                        <input type="text" readonly="" name="mobileNumber" class="form-control"
                                            value="{{ $row->customer->mobile2 ?? '' }}">
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <label class="col-sm-3 label-title">{{ __('address') }}</label>
                                    <div class="col-sm-9">
                                        <input type="text" readonly="" name="address" class="form-control"
                                            value="{{ $row->address ?? '' }}">
                                    </div>
                                </div>

                                <div class="row form-group">
                                    <label class="col-sm-3 label-title">{{ __('is_rejected') }}</label>
                                    <div class="col-sm-9">
                                        <select class="form-control" name="is_delete">
                                            <option value="0" {{ $row->is_delete == 0 ? 'selected' : '' }}> {{ __('no') }}
                                            </option>
                                            <option value="1" {{ $row->is_delete == 1 ? 'selected' : '' }}> {{ __('yes') }}
                                            </option>
                                        </select>
                                    </div>
                                </div>

                                <div class="row form-group">
                                    <label class="col-sm-3 label-title">{{ __('status') }}</label>
                                    <div class="col-sm-9">
                                        <select class="form-control" name="is_active">
                                            <option value="0" {{ $row->is_active == 0 ? 'selected' : '' }}>{{ __('pending') }}
                                            </option>
                                            <option value="1" {{ $row->is_active == 1 ? 'selected' : '' }}>{{ __('active') }}
                                            </option>
                                            <option value="2" {{ $row->is_active == 2 ? 'selected' : '' }}>{{ __('expired') }}
                                            </option>
                                            <option value="3" {{ $row->is_active == 3 ? 'selected' : '' }}>{{ __('draft') }}
                                            </option>
                                        </select>
                                    </div>
                                </div>

                                <div class="row form-group rejected_reason">
                                    <label class="col-sm-3 label-title">{{ __('reason_rej') }}</label>
                                    <div class="col-sm-9">
                                        <textarea class="form-control rejected_reason" placeholder="why you will reject this ad ??" rows="8"
                                            name="rejected_reason">{{ $row->comments ?? '' }}</textarea>

                                    </div>
                                </div>

                                <div class="row form-group action_div">
                                    <label class="col-sm-3 label-title"></label>
                                    <div class="col-sm-9">
                                        {{-- <button type="submit" value="accept" onclick="return confirm('are you really sure ??')" name="submit_btn" class="btn btn-success">Accept</button> --}}
                                        <button type="submit" value=""
                                            class="btn btn-danger">{{ __('admin_update_product') }}</button>
                                    </div>
                                </div>

                                {!! Form::close() !!}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--/ Recent Transactions -->

@endsection
<!--push from page-->
@push('custom_js')
    <script src="https://cdnjs.cloudflare.com/ajax/libs/typeahead.js/0.11.1/typeahead.bundle.min.js"></script>

    <script type="text/javascript">
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
    </script>
    <script type="text/javascript">
        $('.noSpace').keyup(function() {
            this.value = this.value.replace(/\s/g, '');
        });


        $(document).on('click', '.rejectad', function() {

            $('.rejected_reason').removeClass('d-none');
            $('.action_div').toggleClass('d-none');
        });

        jQuery(document).ready(function($) {
            typeahead('customer');
        });

        function typeahead(type) {
            var get_url = $('#base_url').val();
            var engine = new Bloodhound({
                remote: {
                    url: get_url + '/product/get-url-slug?q=%QUERY%&type=' + type,
                    wildcard: '%QUERY%',
                    cache: false,
                },
                datumTokenizer: Bloodhound.tokenizers.whitespace('q'),
                queryTokenizer: Bloodhound.tokenizers.whitespace
            });

            $(".search-input2").typeahead({
                hint: true,
                highlight: true,
                minLength: 1,
            }, {
                source: engine.ttAdapter(),
                // This will be appended to "tt-dataset-" to form the class name of the suggestion menu.
                // display: 'NAME',
                // displayKey: 'IG_CODE',
                name: 'url_slug',
                displayKey: 'url_slug',
                // valueKey: 'IG_CODE',
                limit: 20,

                // the key from the array we want to display (name,id,email,etc...)
                templates: {
                    empty: [
                        '<div class="list-group search-results-dropdown"><div class="list-group-item">Nothing found.</div></div>'
                    ],
                    header: [
                        '<div class="list-group search-results-dropdown">'
                    ],
                    suggestion: function(data) {
                        return '<span class="list-group-item" style="cursor: pointer;">' + data.url_slug +
                            '</span>'
                    }
                }
            });
        }
    </script>
@endpush('custom_js')
