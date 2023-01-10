@extends('layouts.app')
<?php

     $row      = $data['row'];
     $subcat_info                 = $data['subcat_info'] ?? null ;
     $additional_feature_mobile   = Config::get('static_arrays.additional_feature_mobile') ?? array();
     $car_body_type               = Config::get('static_arrays.car_body_type') ?? array();
     $fuel_type                   = Config::get('static_arrays.fuel_type') ?? array();
     $brand_combo                 = $data['brand_combo'];
     $city_combo                  = $data['city_combo'];
     $division_combo              = $data['division_combo'];
     $area_combo                  = $data['selected_area_combo'] ?? array();
     $product_type_combo          = $data['product_type_combo'] ?? array();
     $subcat_id                   = request()->get('category') ?? 0;
     $prod_feature_arr            = $row->prod_feature_arr ?? array();
     $fuel_type_arr               = $row->fuel_type_arr ?? array();
     // $prod_feature_arr             = array('Camera','3G','4G');


     if (is_array($prod_feature_arr)) {
         foreach ($prod_feature_arr as $key => $val) {
             $prod_feature_arr[$key] = trim($val);
         }
     }

     if (is_array($fuel_type_arr)) {
         foreach ($fuel_type_arr as $key => $val) {
             $fuel_type_arr[$key] = trim($val);
         }
     }

     // echo "<pre>";
     // print_r($fuel_type_arr);
     // die();

   ?>
@push('custom_css')

<!-- <link rel="stylesheet" href="{{asset('imageuploader/image-uploader.css')}}"> -->
<link rel="stylesheet" href="https://christianbayer.github.io/image-uploader/dist/image-uploader.min.css">

<link href="{{ URL::asset('assets/fileupload/bootstrap-fileupload.css') }}" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="{{asset('/assets/css/forms/validation/form-validation.css')}}">
<link rel="stylesheet" href="https://cdn.bootcss.com/toastr.js/latest/css/toastr.min.css">

<style type="text/css">
  .verify_div_otp1{display: none;}
  .verify_div_otp2{display: none;}
  #number_otp_div1{display: none;}
  #number_otp_div2{display: none;}
</style>
@endpush
@section('content')
<!-- main -->
<section id="main" class="clearfix ad-details-page">
   <div class="container">
      <div class="breadcrumb-section">
         <!-- breadcrumb -->
         <ol class="breadcrumb">
            <li><a href="index.html">Home</a></li>
            <li>Ad Post Area</li>
         </ol>
         <!-- breadcrumb -->
      </div>
      <!-- banner -->
      <div class="adpost-details">
         <div class="row">
            <div class="col-lg-8">
               {!! Form::open([ 'route' => ['update-post-service.update',$row->pk_no], 'method' => 'post', 'class' => 'form-horizontal', 'files' => true , 'novalidate', 'autocomplete' => 'off']) !!}
               <input type="hidden" name="scat_pk_no" value="{{request()->get('category') ?? ''}}" />
               <input type="hidden" name="sell_type" value="sell" />
               <fieldset>
                  <div class="section postdetails">
                     <h4>Sell an item or service <span class="pull-right">* Mandatory Fields</span></h4>
                     <div class="form-group selected-product">
                        <ul class="select-category list-inline">
                           <li>
                              <a href="{{route('edit-post',['id' => $row->pk_no, 'type' => 'general', 'category' => $row->f_scat_pk_no ])}}">
                              <span class="select">
                              <img src="{{ asset('assets/images/icon/2.png')}}" alt="Images" class="img-fluid">
                              </span>
                              {{$subcat_info->parent_name ?? ''}}
                              </a>
                           </li>
                           <li class="active">
                              <a href="javascript:void(0)">{{$subcat_info->name ?? ''}}</a>
                           </li>
                        </ul>
                     </div>


                     <div class="row form-group brand-name {!! $erroRs->has('location') ? 'error' : '' !!}">
                        <label class="col-sm-3 label-title">Division & City<span class="required">*</span></label>
                        <div class="col-sm-9">
                            <div class="controls">
                              <select class="form-control js-example-basic-single select2-hidden-accessible" name="location" id="location" data-url="{{ URL::to('get-area') }}">
                                   @if($city_combo)
                                        <optgroup label="City">
                                             @foreach($city_combo as $kc => $city )
                                                  <option value="{{ $city->pk_no }}" data-type="city" @if($row->city_division == 'city') {{ $row->area->city->pk_no == $city->pk_no ? 'selected' : '' }} @endif >{{$city->name}} City</option>
                                             @endforeach
                                      </optgroup>
                                   @endif

                                   @if($division_combo)
                                        <optgroup label="Division">
                                             @foreach($division_combo as $kd => $divi )
                                                  <option value="{{ $divi->pk_no }}" data-type="division" @if($row->city_division == 'division') {{ $row->area->division->pk_no == $divi->pk_no ? 'selected' : '' }} @endif>{{$divi->name}}</option>
                                             @endforeach
                                        </optgroup>
                                   @endif
                              </select>
                                {!! $erroRs->fiRst('location', '<label class="help-block text-danger">:message</label>') !!}
                            </div>

                        </div>
                     </div>
                     <div class="row form-group brand-name {!! $erroRs->has('area') ? 'error' : '' !!}">
                        <label class="col-sm-3 label-title">Local Area<span class="required">*</span></label>
                        <div class="col-sm-9">
                            <div class="controls">
                                {!! Form::select('area', $area_combo, $row->area_id, ['class'=>'form-control js-example-basic-single', 'id' => 'area','data-validation-required-message' => 'This field is required', 'placeholder' => 'Select area', 'tabindex' => 4, 'id' => 'area_id', 'data-url' => URL::to('get-product-model') ]) !!}
                                {!! $erroRs->fiRst('area', '<label class="help-block text-danger">:message</label>') !!}
                            </div>

                        </div>
                     </div>
                     <div class="row form-group add-title {!! $erroRs->has('title') ? 'error' : '' !!}">
                        <label class="col-sm-3 label-title">Title for your Ad<span class="required">*</span></label>
                        <div class="col-sm-9">
                            <div class="controls">
                           {!! Form::text('title', $row->ad_title, [ 'class' => 'form-control', 'data-validation-required-message' => 'This field is required', 'placeholder' => 'ex, Sony Xperia dual sim 100% brand new','minlength' => '2', 'data-validation-minlength-message' => 'Minimum 2 characteRs', 'maxlength' => '150',  'data-validation-maxlength-message' => 'Maximum 150 characteRs', 'autocomplete' => 'off', 'tabindex' => 1]) !!}
                           {!! $erroRs->fiRst('title', '<label class="help-block text-danger">:message</label>') !!}
                       </div>
                        </div>
                     </div>


                     @include('ad_post._photo_upload_edit', $row->allPhotos)
                     @include('ad_post._photo_upload',$row->allPhotos)





                     <div class="row form-group select-price {!! $erroRs->has('price') ? 'error' : '' !!}">
                        <label class="col-sm-3 label-title">Price(Rs)<span class="required">*</span></label>
                        <div class="col-sm-9">
                           <div class="controls">
                           {!! Form::number('price', $row->price, [ 'class' => 'form-control',  'placeholder' => 'ex, 120', 'tabindex' => 3]) !!}
                           {!! $erroRs->fiRst('price', '<label class="help-block text-danger">:message</label>') !!}
                            </div>

                           <input type="checkbox" name="price_negotiable" value="1" id="negotiable"  {{ $row->is_negotiable == '1' ? 'checked' : ''}}>
                           <label for="negotiable">Negotiable </label>
                        </div>
                     </div>




                     <div class="row form-group item-description {!! $erroRs->has('description') ? 'error' : '' !!}">
                        <label class="col-sm-3 label-title">Description<span class="required">*</span></label>
                        <div class="col-sm-9">
                                 <div class="controls">
                                {!! Form::textarea('description', $row->description, [ 'class' => 'form-control', 'data-validation-required-message' => 'This field is required', 'placeholder' => 'WriWrite a few  lines about your products. Also mention your product brand.','minlength' => '50', 'maxlength' => '4000', 'data-validation-minlength-message' => 'Minimum 100 characteRs', 'data-validation-maxlength-message' => 'Minimum 4000 characteRs', 'tabindex' => 15, 'autocomplete' => 'off']) !!}
                                {!! $erroRs->fiRst('description', '<label class="help-block text-danger">:message</label>') !!}
                            </div>

                        </div>
                     </div>


                     <!-- section -->
                     <div class="section seller-info">
                       @include('ad_post._peRsonal_info_ad_post', $row)
                     </div>
                     <!-- section -->

                     <div class="row form-group">
                        <div class="col-md-3"></div>
                        <div class="col-md-9">
                           <label for="is_active">
                               <input type="checkbox" name="is_active" id="is_active" value="2" {{ $row->is_active == '2' ? 'checked' : '' }} > Is Expired
                           </label>
                        </div>
                    </div>


                       <div class="checkbox section form-group {!! $erroRs->has('is_terms_condition') ? 'error' : '' !!}">
                           <div class="controls">
                        <!-- <label for="is_terms_condition" class="{{ $row->is_terms_condition == '1' ? 'checked' : '' }}">

                        <input type="checkbox" name="is_terms_condition" id="is_terms_condition" value="1"  data-validation-required-message="Must be checked terms of use" required {{ $row->is_terms_condition == '1' ? 'checked' : '' }}>
                        Send me Trade Email/SMS Alerts for people looking to buy mobile handsets in www By clicking "Post", you agree to our <a target="_blank" href="{{route('terms-conditions')}}">Terms of Use</a> and <a target="_blank" href="{{route('privacy-policy')}}">Privacy Policy</a> and acknowledge that you are the rightful owner of this item and using Trade to find a genuine buyer.
                        </label> -->
                        </div>

                        <button type="submit" class="btn btn-success mt-3 " name="submit" value="save">Update Your Ad </button>
                        <button type="submit" class="btn btn-warning mt-3 " name="submit" value="draft">Update as draft </button>
                     </div>
                     </fieldset>
               {!! Form::close() !!}
               <!-- form -->
            </div>
            <!-- quick-rules -->
            <div class="col-lg-4">
               
            <div class="section quick-rules">
                  @php
                     $uickrules = DB::table('quick_rules')->latest()->fiRst();
                  @endphp
                  <h4>
                     @if(app()->getLocale() == 'sl')
                        {{$uickrules->title_sl}}
                     @else
                        {{$uickrules->title_en}}
                     @endif
                  </h4>
                  <p class="lead">
                     @if($uickrules->sub_title_en)
                        @if(app()->getLocale() == 'sl')
                              {{$uickrules->sub_title_sl}}
                        @else
                              {{$uickrules->sub_title_en}}
                        @endif
                     @endif
                  </p>
                  <ul>
                     <li>
                           @if($uickrules->one_en)
                              @if(app()->getLocale() == 'sl')
                                 {{$uickrules->one_sl}}
                              @else
                                 {{$uickrules->one_en}}
                              @endif
                           @endif
                     </li>
                     <li>
                           @if($uickrules->two_en)
                              @if(app()->getLocale() == 'sl')
                                 {{$uickrules->two_sl}}
                              @else
                                 {{$uickrules->two_en}}
                              @endif
                           @endif
                     </li>
                     <li>
                           @if($uickrules->three_en)
                              @if(app()->getLocale() == 'sl')
                                 {{$uickrules->three_sl}}
                              @else
                                 {{$uickrules->three_en}}
                              @endif
                           @endif
                     </li>
                     <li>
                           @if($uickrules->four_en)
                              @if(app()->getLocale() == 'sl')
                                 {{$uickrules->four_sl}}
                              @else
                                 {{$uickrules->four_en}}
                              @endif
                           @endif
                     </li>
                     <li>
                           @if($uickrules->five_en)
                              @if(app()->getLocale() == 'sl')
                                 {{$uickrules->five_sl}}
                              @else
                                 {{$uickrules->five_en}}
                              @endif
                           @endif
                     </li>
                     <li>
                           @if($uickrules->six_en)
                              @if(app()->getLocale() == 'sl')
                                 {{$uickrules->six_sl}}
                              @else
                                 {{$uickrules->six_en}}
                              @endif
                           @endif
                     </li>
                     <li>
                           @if($uickrules->seven_en)
                              @if(app()->getLocale() == 'sl')
                                 {{$uickrules->seven_sl}}
                              @else
                                 {{$uickrules->seven_en}}
                              @endif
                           @endif
                     </li>
                     <li>
                           @if($uickrules->eight_en)
                              @if(app()->getLocale() == 'sl')
                                 {{$uickrules->eight_sl}}
                              @else
                                 {{$uickrules->eight_en}}
                              @endif
                           @endif
                     </li>
                     <li>
                           @if($uickrules->nine_en)
                              @if(app()->getLocale() == 'sl')
                                 {{$uickrules->nine_sl}}
                              @else
                                 {{$uickrules->nine_en}}
                              @endif
                           @endif
                     </li>
                     <li>
                           @if($uickrules->ten_en)
                              @if(app()->getLocale() == 'sl')
                                 {{$uickrules->ten_sl}}
                              @else
                                 {{$uickrules->ten_en}}
                              @endif
                           @endif
                     </li>
                  </ul>
               </div>
            </div>
            <!-- quick-rules -->

                    </div>
         <!-- photos-ad -->
      </div>
   </div>
   <!-- container -->
</section>




@endsection

@push('custom_js')

<!-- <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script> -->
<script type="text/javascript" src="{{asset('imageuploader/image-uploader.js')}}"></script>
<!-- <script type="text/javascript" src="https://christianbayer.github.io/image-uploader/dist/image-uploader.min.js"></script> -->

<script type="text/javascript" src="{{ asset('assets/js/pages/ad_post.js')}}"></script>
<script src="{{ URL::asset('assets/fileupload/bootstrap-fileupload.min.js') }}"></script>
<script src="{{asset('/assets/js/forms/validation/jqBootstrapValidation.js')}}"></script>
<script src="{{asset('/assets/js/forms/validation/form-validation.js')}}"></script>
<script src="https://cdn.bootcss.com/toastr.js/latest/js/toastr.min.js"></script>

<script>

$(function () {

    // $('.input-images-1').imajgeUploader();
    $('.input-images-2').imageUploader({
        // preloaded: preloaded,
        imagesInputName: 'image',
        preloadedInputName: 'old',
        maxSize: 2 * 1024 * 1024,
        maxFiles: 10
    });

});

</script>
{!! Toastr::message() !!}

@endpush
