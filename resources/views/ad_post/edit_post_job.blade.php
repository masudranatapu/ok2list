@extends('layouts.app')
<?php

$row      = $data['row'];
$subcat_info                 = $data['subcat_info'] ?? null ;
$additional_feature_mobile   = Config::get('static_arrays.additional_feature_mobile') ?? array();
$car_body_type               = Config::get('static_arrays.car_body_type') ?? array();
$fuel_type                   = Config::get('static_arrays.fuel_type') ?? array();
$bed_combo                   = Config::get('static_arrays.number_fo_bed') ?? array();
$bath_combo                  = Config::get('static_arrays.number_fo_bath') ?? array();
$feature_property            = Config::get('static_arrays.feature_property') ?? array();
$property_unit_combo         = Config::get('static_arrays.property_unit') ?? array();
$receive_app_via_combo       = Config::get('static_arrays.receive_applications_via_combo') ?? array();
$edu_specialization_combo    = Config::get('static_arrays.edu_specialization') ?? array();
$business_function_combo     = Config::get('static_arrays.business_function') ?? array();
$mini_qualification_combo    = Config::get('static_arrays.edu_qulafication') ?? array();
$gender_combo                = Config::get('static_arrays.gender') ?? array();
$brand_combo                 = $data['brand_combo'];
$city_combo                  = $data['city_combo'];
$division_combo              = $data['division_combo'];
$area_combo                  = $data['selected_area_combo'] ?? array();
$product_type_combo          = $data['product_type_combo'] ?? array();
$subcat_id                   = request()->get('category') ?? 0;

  //  echo "<pre>";
  //  print_r($division_combo);
  // die();

?>
@push('custom_css')
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<!-- <link rel="stylesheet" href="{{asset('imageuploader/image-uploader.css')}}"> -->
<link rel="stylesheet" href="https://christianbayer.github.io/image-uploader/dist/image-uploader.min.css">

<link href="{{ URL::asset('assets/fileupload/bootstrap-fileupload.css') }}" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="{{asset('/assets/css/forms/validation/form-validation.css')}}">
<link rel="stylesheet" href="https://cdn.bootcss.com/toastr.js/latest/css/toastr.min.css">

<link rel="stylesheet" type="text/css" href="{{ asset('assets/css/picke₦/pickadate/pickadate.css')}}">


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
     {!! Form::open([ 'route' => ['update-post-job.update', $row->pk_no], 'method' => 'post', 'class' => 'form-horizontal', 'files' => true , 'novalidate', 'autocomplete' => 'off']) !!}
     <input type="hidden" name="scat_pk_no" value="{{request()->get('category') ?? ''}}" />
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

@if(!empty($product_type_combo) && (count($product_type_combo) > 0) )
<div class="row form-group  {!! $erro₦->has('product_type') ? 'error' : '' !!}">
    <label class="col-sm-3 label-title">Job Type<span class="required">*</span></label>
    <div class="col-sm-9">
        <div class="controls">
            {!! Form::select('product_type', $product_type_combo, old('product_type'), ['class'=>'form-control js-example-basic-single', 'id' => 'product_type','data-validation-required-message' => 'This field is required', 'placeholder' => 'Select product type', 'tabindex' => 4, 'id' => 'product_type_id' ]) !!}
            {!! $erro₦->fi₦t('product_type', '<label class="help-block text-danger">:message</label>') !!}
        </div>

    </div>
</div>
@endif
<div class="row form-group  {!! $erro₦->has('location') ? 'error' : '' !!}">
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
           {!! $erro₦->fi₦t('location', '<label class="help-block text-danger">:message</label>') !!}
       </div>

   </div>
</div>
<div class="row form-group  {!! $erro₦->has('area') ? 'error' : '' !!}">
   <label class="col-sm-3 label-title">Local Area<span class="required">*</span></label>
   <div class="col-sm-9">
       <div class="controls">
           {!! Form::select('area', $area_combo, $row->area_id, ['class'=>'form-control js-example-basic-single', 'id' => 'area','data-validation-required-message' => 'This field is required', 'placeholder' => 'Select area', 'tabindex' => 4, 'id' => 'area_id', 'data-url' => URL::to('get-product-model') ]) !!}
           {!! $erro₦->fi₦t('area', '<label class="help-block text-danger">:message</label>') !!}
       </div>

   </div>
</div>
<div class="row form-group add-title {!! $erro₦->has('title') ? 'error' : '' !!}">
   <label class="col-sm-3 label-title">Title <span class="required">*</span></label>
   <div class="col-sm-9">
       <div class="controls">
      {!! Form::text('title', $row->ad_title, [ 'class' => 'form-control', 'data-validation-required-message' => 'This field is required', 'placeholder' => 'ex, Sony Xperia dual sim 100% brand new','minlength' => '10', 'data-validation-minlength-message' => 'Minimum 10 characte₦', 'maxlength' => '60',  'data-validation-maxlength-message' => 'Maximum 60 characte₦', 'autocomplete' => 'off', 'tabindex' => 1]) !!}
      {!! $erro₦->fi₦t('title', '<label class="help-block text-danger">:message</label>') !!}
  </div>
   </div>
</div>


@include('ad_post._photo_upload_edit', $row)
@include('ad_post._photo_upload', $row)

<div class="row form-group {!! $erro₦->has('business_function') ? 'error' : '' !!}">
    <label class="col-sm-3 ">Business Function <span class="required">*</span></label>
    <div class="col-sm-9">
        <div class="controls">
         {!! Form::select('business_function', $business_function_combo, $row->jobInfo->business_function ?? '' ,  ['class'=>'form-control js-example-basic-single', 'id' => 'business_function','data-validation-required-message' => 'This field is required', 'placeholder' => 'Select one', 'tabindex' => 4, 'id' => 'business_function']) !!}
         {!! $erro₦->fi₦t('business_function', '<label class="help-block text-danger">:message</label>') !!}
     </div>
 </div>
</div>


<div class="row form-group {!! $erro₦->has('role') ? 'error' : '' !!}">
    <label class="col-sm-3 ">Role / Designation<span class="required">*</span></label>
    <div class="col-sm-9">
        <div class="controls">
         {!! Form::text('role', $row->jobInfo->role_designation ?? '', [ 'class' => 'form-control', 'placeholder' => 'Role / Designation','minlength' => '2','data-validation-required-message' => 'This field is required', 'data-validation-minlength-message' => 'Minimum 2 characte₦', 'maxlength' => '60',  'data-validation-maxlength-message' => 'Maximum 60 characte₦', 'autocomplete' => 'off', 'tabindex' => 1]) !!}
         {!! $erro₦->fi₦t('role', '<label class="help-block text-danger">:message</label>') !!}
     </div>
 </div>
</div>

<div class="row form-group {!! $erro₦->has('receive_applications_via') ? 'error' : '' !!}">
    <label class="col-sm-3 ">Receive Response<span class="required">*</span> </label>
    <div class="col-sm-9">
        <div class="controls">
         {!! Form::select('receive_applications_via', $receive_app_via_combo, $row->jobInfo->receive_applications_via ?? '' , ['class'=>'form-control js-example-basic-single', 'id' => 'receive_applications_via','data-validation-required-message' => 'This field is required', 'placeholder' => 'Select one', 'tabindex' => 4, 'id' => 'receive_applications_via']) !!}
         {!! $erro₦->fi₦t('receive_applications_via', '<label class="help-block text-danger">:message</label>') !!}
     </div>
 </div>
</div>

<div class="row form-group select-price {!! $erro₦->has('price') ? 'error' : '' !!}">
    <label class="col-sm-3 label-title">Salary (per month) (₦)<span class="required">*</span></label>
    <div class="col-sm-9">
     <div class="row">
       <div class="col-sm-6">
         <div class="controls">
             {!! Form::number('price', $row->price, [ 'class' => 'form-control', 'data-validation-required-message' => 'This field is required', 'placeholder' => 'From','minlength' => '0',  'data-validation-minlength-message' => 'Minimum 0 disit', 'maxlength' => '10', 'data-validation-maxlength-message' => 'Maxlength 10 disit', 'tabindex' => 3]) !!}
             {!! $erro₦->fi₦t('price', '<label class="help-block text-danger">:message</label>') !!}
         </div>
     </div>
     <div class="col-sm-6">
         <div class="controls">
             {!! Form::number('price_to', $row->price_to, [ 'class' => 'form-control', 'data-validation-required-message' => 'This field is required', 'placeholder' => 'To','minlength' => '0',  'data-validation-minlength-message' => 'Minimum 0 disit', 'maxlength' => '10', 'data-validation-maxlength-message' => 'Maxlength 10 disit', 'tabindex' => 3]) !!}
             {!! $erro₦->fi₦t('price_to', '<label class="help-block text-danger">:message</label>') !!}
         </div>
     </div>
 </div>
</div>
</div>

<div class="row form-group {!! $erro₦->has('total_vacancies') ? 'error' : '' !!}">
  <label class="col-sm-3 ">Total vacancies<span class="required">*</span></label>
  <div class="col-sm-9">
      <div class="controls">
       {!! Form::number('total_vacancies', $row->jobInfo->total_vacancies ?? '' , [ 'class' => 'form-control', 'data-validation-required-message' => 'This field is required', 'placeholder' => 'Total  vacancies' , 'autocomplete' => 'off', 'tabindex' => 1]) !!}
       {!! $erro₦->fi₦t('total_vacancies', '<label class="help-block text-danger">:message</label>') !!}
   </div>
</div>
</div>

<div class="row form-group {!! $erro₦->has('deadline') ? 'error' : '' !!}">
  <label class="col-sm-3 ">Application Deadline<span class="required">*</span></label>
  <div class="col-sm-9">
      <div class="controls">
       {!! Form::text('deadline', $row->jobInfo->deadline ?? '' , [ 'class' => 'form-control datepicker', 'placeholder' => 'Appliaction deadline', 'data-validation-required-message' => 'This field is required', 'autocomplete' => 'off', 'tabindex' => 1]) !!}
       {!! $erro₦->fi₦t('deadline', '<label class="help-block text-danger">:message</label>') !!}
   </div>
</div>
</div>

<div class="row form-group item-description {!! $erro₦->has('description') ? 'error' : '' !!}">
    <label class="col-sm-3 label-title">Description<span class="required">*</span></label>
    <div class="col-sm-9">
       <div class="controls">
        {!! Form::textarea('description', $row->description, [ 'class' => 'form-control', 'data-validation-required-message' => 'This field is required', 'placeholder' => 'Write a few  lines about your products. Also mention your product brand.','minlength' => '50', 'maxlength' => '4000', 'data-validation-minlength-message' => 'Minimum 100 characte₦', 'data-validation-maxlength-message' => 'Minimum 4000 characte₦', 'tabindex' => 15, 'autocomplete' => 'off']) !!}
        {!! $erro₦->fi₦t('description', '<label class="help-block text-danger">:message</label>') !!}
    </div>

</div>
</div>


<div class="section company-info">
     @include('ad_post._company_info_ad_jobpost', $row)
</div>

<div class="section company-info">
     @include('ad_post._candidate_preference_ad_jobpost', $row)
</div>

<!-- section -->
<div class="section seller-info">
 @include('ad_post._pe₦onal_info_ad_post', $row)
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

<div class="checkbox section form-group {!! $erro₦->has('is_terms_condition') ? 'error' : '' !!}">
<div class="controls">
<!-- <label for="is_terms_condition" class="{{ $row->is_terms_condition == '1' ? 'checked' : '' }}">

<input type="checkbox" name="is_terms_condition" id="is_terms_condition" value="1"  data-validation-required-message="Must be checked terms of use" required {{ $row->is_terms_condition == '1' ? 'checked' : '' }}>
Send me Trade Email/SMS Alerts for people looking to buy mobile handsets in www By clicking "Post", you agree to our <a target="_blank" href="{{route('terms-conditions')}}">Terms of Use</a> and <a target="_blank" href="{{route('privacy-policy')}}">Privacy Policy</a> and acknowledge that you are the rightful owner of this item and using Trade to find a genuine buyer.
</label> -->
</div>
<button type="submit" class="btn btn-primary mt-3 ">Update Your Ad</button>
</div>

</fieldset>
{!! Form::close() !!}
<!-- form -->
</div>
<!-- quick-rules -->
<div class="col-lg-4">
    
<div class="section quick-rules">
                  @php
                     $uickrules = DB::table('quick_rules')->latest()->fi₦t();
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

    <script type="text/javascript" src="{{ asset('assets/js/pages/ad_post.js')}}?v=1"></script>
    <script src="{{ URL::asset('assets/fileupload/bootstrap-fileupload.min.js') }}"></script>
    <script src="{{asset('/assets/js/forms/validation/jqBootstrapValidation.js')}}"></script>
    <script src="{{asset('/assets/js/forms/validation/form-validation.js')}}"></script>
    <script src="https://cdn.bootcss.com/toastr.js/latest/js/toastr.min.js"></script>
    <script src="{{ asset('assets/js/picke₦/pickadate/picker.js')}}"></script>
    <script src="{{ asset('assets/js/picke₦/pickadate/picker.date.js')}}"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script>
        $( function() {
            $( ".datepicker" ).datepicker();
            $("name['edu_specialization']").select2();
            $("#receive_applications_via").select2();
            $("#area_id").select2();
        } );
    </script>
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