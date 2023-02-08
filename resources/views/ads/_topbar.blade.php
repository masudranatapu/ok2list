<?php
$selected_area = $data['area_query_display'] == null ? 'srilanka' : $data['area_query_display'];
?>
<div class="breadcrumb-section">
    <ol class="breadcrumb">
        <li><a href="{{ route('home') }}">{{ __('home') }}</a></li>
        <li><a href="{{ route('ads.list') }}">{{ __('all_ads') }}</a></li>
        @if (isset($data['category_name']) && $data['category_name'] != null)
        <li>{{ $data['category_name'] }}</li>
        @endif
        @if (isset($data['get_area_query']) && $data['get_area_query'] != null)
        <li>{{ $data['get_area_query'] }}</li>
        @endif
    </ol>
</div>
<!-- @if (isset($data['detail_page1']) && $data['detail_page1'] != null)
<div class="">
  <div class="ads_banner text-center mb-5">
   <a href="{{ $data['list_page1']->link }}" target="_blank" title="{{ $data['list_page1']->name }}"><img src="{{ fileExit($data['list_page1']->photo) }}" class="w-100" alt="{{ $data['list_page1']->name }}" style="height: 96px;"></a>
  </div>
 </div>
@endif -->

<!--  @if (isset($data['list_page1']) && $data['list_page1'] != null)
<div class="text-center mb-4">
  <a href="{{ $data['list_page1']->link }}" target="_blank" title="{{ $data['list_page1']->name }}"><img src="{{ fileExit($data['list_page1']->photo) }}" class="w-100" alt="{{ $data['list_page1']->name }}" style="height: 96px;"></a>
 </div>
@endif -->

<div class="banner">
    <div class="list_page banner-form banner-form-full">
        <form onsubmit="event.preventDefault()">
            <div class="row no-gutters">
                <div class="col-md-6 col-lg-3">
                    <div class="dropdown category-dropdown select-category" data-toggle="modal"
                        data-target="#divisioncitymodal">
                        <i class="fa fa-map-marker"></i>
                        <span>{{ $selected_area }}</span>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">

                    <div class="dropdown category-dropdown select-category" data-toggle="modal"
                        data-target="#exampleModal">
                        <i class="fa fa-tag"></i>
                        <span>{{ $data['category_query_display'] ?? 'Select Category' }}</span>
                    </div>
                </div>
                <div class="col-lg-6">
                    <input type="text" class="form-control banner_search" placeholder="Type Your key word" id="keywords"
                        value="{{ request()->get('keywords') }}">
                    <button type="button" class="form-control" value="Search" id="key_search">{{ __('search')
                        }}</button>
                </div>
            </div>
        </form>
    </div>
</div>
