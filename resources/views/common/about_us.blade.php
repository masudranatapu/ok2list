@extends('layouts.app')

@section('content')
<section id="main" class="clearfix about-us page">
	<div class="container">
        <style>
            .about-us-images{
                width: 100%;
                height: 100%;
                display: flex;
                align-items: center;
                justify-content: center;
            }
        </style>
		<div class="breadcrumb-section">
			<ol class="breadcrumb">
				<li><a href="{{url('/')}}">Home</a></li>
				<li>@lang('web.about_us')</li>
			</ol>
		</div>
        @if(isset($data['about_us_page1']) && ($data['about_us_page1']) != null )
			<div class="">
				<div class="ads_banner text-center mb-4">
					<a href="{{ $data['about_us_page1']->link }}" target="_blank" title="{{ $data['about_us_page1']->name }}"><img src="{{ fileExit($data['about_us_page1']->photo) }}" class="w-100" alt="{{ $data['about_us_page1']->name }}" style="height: 96px;"></a>
				</div>
			</div>
         @endif
		<div class="section about">
			<div class="about-info">
				<div class="row">
					<div class="col-lg-6">
						<div class="about-us-images">
                            <span class="helper"></span>
							@if($data['about'])
								<img src="@if($data['about']->image) {{asset($data['about']->image)}} @else {{asset('assets/images/about-us/about.jpg')}} @endif" alt="About us Image" class="img">
							@endif
						</div>
					</div>
					<div class="col-lg-6">
						<div class="about-text">
							<h3>@lang('web.about_us') @lang('web.ok2list_title')</h3>
							<div class="description-paragraph">
								@if($data['about'])
									@if(app()->getLocale() == 'en')
										<p>{!! $data['about']->details_en !!}</p>
									@else
										<p>{!! $data['about']->details_sl !!}</p>
									@endif
								@endif
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="approach">
				<div class="row">
					<div class="col-md-4 text-center">
						<div class="our-approach">
							<h3>@lang('web.mission')</h3>
							@if($data['about'])
								@if(app()->getLocale() == 'en')
									<p>{!! $data['about']->mission_en !!}</p>
								@else
									<p>{!! $data['about']->mission_sl !!}</p>
								@endif
							@endif
						</div>
					</div>
					<div class="col-md-4 text-center">
						<div class="our-approach">
							<h3>@lang('web.vision')</h3>
							@if($data['about'])
								@if(app()->getLocale() == 'en')
									<p>{!! $data['about']->vision_en !!}</p>
								@else
									<p>{!! $data['about']->vision_sl !!}</p>
								@endif
							@endif
						</div>
					</div>
					<div class="col-md-4 text-center">
						<div class="our-approach">
							<h3>@lang('web.our_values')</h3>
							@if($data['about'])
								@if(app()->getLocale() == 'en')
									<p>{!! $data['about']->our_values_en !!}</p>
								@else
									<p>{!! $data['about']->our_values_sl !!}</p>
								@endif
							@endif
						</div>
					</div>
				</div>
			</div>
		</div>
        @if(isset($data['about_us_page2']) && ($data['about_us_page2']) != null )
			<div class="">
				<div class="ads_banner text-center mb-4">
					<a href="{{ $data['about_us_page2']->link }}" target="_blank" title="{{ $data['about_us_page2']->name }}"><img src="{{ fileExit($data['about_us_page2']->photo) }}" class="w-100" alt="{{ $data['about_us_page2']->name }}" style="height: 96px;"></a>
				</div>
			</div>
         @endif
	</div>
</section>
@endsection

@push('custom_footer_script')

@endpush
