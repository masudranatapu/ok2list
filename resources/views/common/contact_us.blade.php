@extends('layouts.app')

@push('custom_css')
	<link rel="stylesheet" href="https://cdn.bootcss.com/toastr.js/latest/css/toastr.min.css">
@endpush

@section('content')
@php
$link = DB::table('site_settings')->first();
@endphp

	<section id="main" class="clearfix contact-us">
		<div class="container">
			<!-- breadcrumb -->
			<ol class="breadcrumb">
				<li><a href="{{url('/')}}">Home</a></li>
				<li>@lang('web.contact_us')</li>
			</ol><!-- breadcrumb -->
			<!-- gmap -->
            <!-- @if(isset($data['contact_us_page1']) && ($data['contact_us_page1']) != null )
            <div class="">
                 <div class="ads_banner text-center mb-4">
                     <a href="{{ $data['contact_us_page1']->link }}" target="_blank" title="{{ $data['contact_us_page1']->name }}"><img src="{{ fileExit($data['contact_us_page1']->photo) }}" class="w-100" alt="{{ $data['contact_us_page1']->name }}" style="height: 96px;"></a>
                 </div>
             </div>
             @endif -->

            <div>

            </div>
			<div class="corporate-info">
				<div class="row">
					<!-- contact-info -->
					<div class="col-md-4">
						<div class="contact-info">

							<h2>@lang('web.corporate_info')</h2>
							<address>
								@if($link->website_email)
								<p><strong>Email: </strong><a href="mailto:{{$link->website_email}}">{{$link->website_email}}</a></p>
								@endif
								@if($link->address)
								<p><strong>Address: </strong> {!! $link->address !!}</p>
								@endif
							</address>
							<ul class="social">
                            	@if($link->facebook_link)
									<li><a target="_blank" href="{{$link->facebook_link}}"><i class="fa fa-facebook"></i></a></li>
								@endif
                            	@if($link->twitter_link)
									<li><a href="{{$link->twitter_link}}"><i class="fa fa-twitter"></i></a></li>
								@endif
                            	@if($link->instagram_link)
                                	<li><a href="{{$link->instagram_link}}"><i class="fa fa-instagram"></i></a></li>
								@endif
                            	@if($link->linkedin_link)
                                	<li><a href="{{$link->linkedin_link}}"><i class="fa fa-linkedin"></i></a></li>
								@endif
                            	@if($link->whatsapp_link)
                                	<li><a href="{{$link->whatsapp_link}}"><i class="fa fa-whatsapp"></i></a></li>
								@endif
                            	@if($link->youtube_link)
									<li><a href="{{$link->youtube_link}}"><i style="color: #c1272d;" class="fa fa-youtube-play"></i></a></li>
								@endif
							</ul>
							<address>
							@if($link->map_address)
									<p><strong>Address: </strong> {!! $link->map_address !!}</p>
								@endif
							</address>
						</div>
					</div><!-- contact-info -->

					<!-- feedback -->
					<div class="col-md-8">
						<div class="feedback">
							<h2>@lang('web.send_us_your_feedback')</h2>
								{!! Form::open([ 'route' => 'contact-us', 'method' => 'post', 'class' => 'form-contact', 'files' => false , 'novalidate', 'autocomplete' => 'off']) !!}
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<div class="controls">
											{!! Form::text('name', old('name'), ['class'=>'form-control', 'id' => 'name', 'placeholder' => 'Name', 'data-validation-required-message' => 'This field is required', 'maxlength' => '60', 'data-validation-maxlength-message' => 'Maxlength 60 characters', 'tabindex' => 5]) !!}
											{!! $errors->first('name', '<label class="help-block text-danger">:message</label>') !!}

											</div>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<div class="controls">
											{!! Form::email('email', old('email'), ['class'=>'form-control', 'id' => 'email', 'placeholder' => 'Email', 'data-validation-required-message' => 'This field is required', 'tabindex' => 5]) !!}
											{!! $errors->first('email', '<label class="help-block text-danger">:message</label>') !!}
											</div>
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<div class="controls">
											{!! Form::text('subject', old('subject'), ['class'=>'form-control', 'id' => 'subject', 'placeholder' => 'Subject', 'data-validation-required-message' => 'This field is required', 'tabindex' => 5]) !!}
											{!! $errors->first('subject', '<label class="help-block text-danger">:message</label>') !!}
											</div>
										</div>
									</div>
									<div class="col-sm-12">
										<div class="form-group">
											<div class="controls">
											{!! Form::textarea('message', old('message'), ['class'=>'form-control', 'id' => 'message', 'placeholder' => 'Message', 'data-validation-required-message' => 'This field is required', 'tabindex' => 5]) !!}
											{!! $errors->first('message', '<label class="help-block text-danger">:message</label>') !!}
											</div>
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
										<span style="display: inline;" id="random1"></span>
										<span style="display: inline;">&nbsp;+&nbsp;</span>
										<span style="display: inline;" id="random2"></span> = ?
										<div class="controls">
											{!! Form::number('capt', old('capt'), ['class'=>'form-control', 'id' => 'usernumber', 'placeholder' => 'Result', 'data-validation-required-message' => 'This field is required', 'oninput' => 'checkInputValCapt(this)', 'tabindex' => 5]) !!}
											{!! $errors->first('capt', '<label class="help-block text-danger">:message</label>') !!}
											</div>
										</div>
										<input type="hidden" name="randtotal" id="randtotal">
									</div>
								</div>
								<div class="form-group">
									<button type="submit" class="btn">Submit Your Message</button>
								</div>
							{!! Form::close() !!}
						</div>
					</div><!-- feedback -->
				</div><!-- row -->
			</div>

            <!-- @if(isset($data['contact_us_page2']) && ($data['contact_us_page2']) != null )
            <div class="">
                 <div class="ads_banner text-center mb-4 mt-4">
                     <a href="{{ $data['contact_us_page2']->link }}" target="_blank" title="{{ $data['contact_us_page2']->name }}"><img src="{{ fileExit($data['contact_us_page2']->photo) }}" class="w-100" alt="{{ $data['contact_us_page2']->name }}" style="height: 96px;"></a>
                 </div>
             </div>
             @endif -->
		</div><!-- container -->
	</section>

@endsection

@push('custom_js')
	<script src="{{asset('/assets/js/forms/validation/jqBootstrapValidation.js')}}"></script>
	<script src="{{asset('/assets/js/forms/validation/form-validation.js')}}"></script>
	<script src="https://cdn.bootcss.com/toastr.js/latest/js/toastr.min.js"></script>
	{!! Toastr::message() !!}
	<script>
		function differentProblem() {
		randomNum1 = Math.floor((Math.random()*10)+1);
		randomNum2 = Math.floor((Math.random()*10)+1);
		$("#random1").empty().append(randomNum1);
		$("#random2").empty().append(randomNum2);
		$("#usernumber").val("");
		}

		function checkInputValCapt(e){
		humanNumber = $(e).val();
		randomTotal = randomNum1 + randomNum2;
		$("#randtotal").val(randomTotal);
		if (randomTotal == humanNumber) {
			$(e).removeClass('err-input');
		}else{
			$(e).addClass('err-input');
		}
		}

		//Running a first time to get numbers set
		$(document).ready(function() {
			differentProblem();
		});

	</script>
@endpush
