<?php
	$selected_area  = $data['area_query_display'] == null ? 'srilanka' : $data['area_query_display'] ;
?>
<div class="breadcrumb-section">
	<ol class="breadcrumb">
		<li><a href="{{ route('home') }}">@lang('web.home')</a></li>
		<li><a href="{{ route('ads.list') }}">@lang('web.all_ads')</a></li>
		@if(isset($data['category_name']) && ($data['category_name'] != null))
			<li>{{ $data['category_name'] }}</li>
		@endif
		@if(isset($data['get_area_query']) && ($data['get_area_query'] != null))
			<li>{{ $data['get_area_query'] }}</li>
		@endif
	</ol>
</div>

@if(isset($data['detail_page1']) && ($data['detail_page1']) != null )
	<div class="">
		<div class="ads_banner text-center mb-5">
			<a href="{{ $data['list_page1']->link }}" target="_blank" title="{{ $data['list_page1']->name }}"><img src="{{ fileExit($data['list_page1']->photo) }}" class="w-100" alt="{{ $data['list_page1']->name }}" style="height: 96px;"></a>
		</div>
	</div>
 @endif

 @if(isset($data['list_page1']) && ($data['list_page1']) != null )
	<div class="text-center mb-4">
		<a href="{{ $data['list_page1']->link }}" target="_blank" title="{{ $data['list_page1']->name }}"><img src="{{ fileExit($data['list_page1']->photo) }}" class="w-100" alt="{{ $data['list_page1']->name }}" style="height: 96px;"></a>
	</div>
@endif

<div class="banner">
	<div class="banner-form banner-form-full">
		<form onsubmit="event.preventDefault()">
			<i class="fa fa-map-marker"></i>
			<div class="dropdown category-dropdown select-category" data-toggle="modal" data-target="#divisioncitymodal">
				<span>{{ $selected_area }}</span>
			</div>
			<i class="fa fa-tag"></i>
			<div class="dropdown category-dropdown select-category" data-toggle="modal" data-target="#exampleModal">
				<span>{{ $data['category_query_display'] ?? 'Select Category' }}</span>
			</div>
			<input type="text" class="form-control banner_search" placeholder="Type Your key word" id="keywords" value="{{ request()->get('keywords') }}">
			<button type="button" class="form-control" value="Search" id="key_search">@lang('web.search')</button>
		</form>
	</div>
</div>