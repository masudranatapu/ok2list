@extends('admin.layout.master')

@section('Web Setting', 'open')
@section('site-setting', 'active')

@push('custom_css')
    <link rel="stylesheet" type="text/css" href="{{ asset('app-assets/vendors/css/forms/selects/select2.min.css') }}">
@endpush

@section('Category', 'active')
@section('title') {{ __('web_settings') }} @endsection
@section('page-name') {{ __('web_settings') }} @endsection

@section('breadcrumb')
    <li class="breadcrumb-item">
        <a href="{{ route('admin.dashboard') }}">{{ __('admin_breadcrumb_title') }}</a>
    </li>
    <li class="breadcrumb-item active">{{ __('web_settings') }}</li>
@endsection

@section('content')

    <div class="card">
        <div class="card-header">
            <ul class="nav nav-pills" id="pills-tab" role="tablist">
                <li class="nav-item" role="presentation">
                    <a class="nav-link active" id="basic-tab" data-toggle="pill" href="#basic" role="tab"
                        aria-controls="basic" aria-selected="true">Basic</a>
                </li>
                <li class="nav-item" role="presentation">
                    <a class="nav-link " id="basic-tab" data-toggle="pill" href="#social_media_links" role="tab"
                        aria-controls="basic" aria-selected="true">Social Media Links</a>
                </li>
                <li class="nav-item" role="presentation">
                    <a class="nav-link " id="basic-tab" data-toggle="pill" href="#logo" role="tab"
                        aria-controls="basic" aria-selected="true">Logo</a>
                </li>
                <li class="nav-item" role="presentation">
                    <a class="nav-link " id="basic-tab" data-toggle="pill" href="#payment" role="tab"
                        aria-controls="basic" aria-selected="true">Payments</a>
                </li>
            </ul>
        </div>
        <div class="card-body">
            <div class="tab-content" id="pills-tabContent">
                <div class="tab-pane fade show active" id="basic" role="tabpanel" aria-labelledby="basic-tab">
                    <form action="{{ route('website.update', $setting->id) }}" method="post">
                        @csrf
                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-2">
                                    <label class="form-label">Site Email</label>
                                    <input type="email" name="website_email" value="{{ $setting->website_email }}"
                                        class="form-control">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-2">
                                    <label class="form-label">Phone Number</label>
                                    <input type="number" name="phone" value="{{ $setting->phone }}" class="form-control"
                                        placeholder="Phone number">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-2">
                                    <label class="form-label">Address</label>
                                    <textarea name="address" class="form-control" placeholder="Address" cols="30" rows="4">{{ $setting->address }}</textarea>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-2">
                                    <label class="form-label">Map Address</label>
                                    <textarea name="map_address" placeholder="Map address" class="form-control" cols="30" rows="4">{{ $setting->map_address }}</textarea>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-2">
                                    <label class="form-label">Email Verification</label>
                                    <select name="email_verification" class="form-control">
                                        <option value="1" @if($setting->email_verification == 1) selected @endif>Yes</option>
                                        <option value="0" @if($setting->email_verification == 0) selected @endif>No</option>
                                    </select>
                                </div>
                            </div>
                            {{-- <div class="col-md-6">
                                <div class="mb-2">
                                    <label class="form-label">Android App Link</label>
                                    <input type="text" name="android_app_link" value="{{$setting->android_app_link}}" placeholder="Addroid app link" class="form-control">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-2">
                                    <label class="form-label">IOS App Link</label>
                                    <input type="text" name="ios_app_link" placeholder="IOS app link" value="{{$setting->ios_app_link}}" class="form-control">
                                </div>
                            </div> --}}

                            <div class="col-12 text-center mt-2">
                                <button type="submit" class="btn btn-primary">Update Settings</button>
                            </div>
                        </div>
                    </form>
                </div>

                <div class="tab-pane fade " id="social_media_links" role="tabpanel" aria-labelledby="basic-tab">
                    <form action="{{ route('website.update.socile', $setting->id) }}" method="post">
                        @csrf
                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-2">
                                    <label class="form-label">Facebook</label>
                                    <input type="text" name="facebook_link" class="form-control"
                                        value="{{ $setting->facebook_link }}" placeholder="https:://www.facebook.com">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-2">
                                    <label class="form-label">Twitter</label>
                                    <input type="text" name="twitter_link" class="form-control"
                                        value="{{ $setting->twitter_link }}" placeholder="https:://www.twitter.com">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-2">
                                    <label class="form-label">Instagram</label>
                                    <input type="text" name="instagram_link" class="form-control"
                                        value="{{ $setting->instagram_link }}" placeholder="https:://www.instagram.com">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-2">
                                    <label class="form-label">Linkedin</label>
                                    <input type="text" name="linkedin_link" class="form-control"
                                        value="{{ $setting->linkedin_link }}" placeholder="https:://www.linkedin.com">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-2">
                                    <label class="form-label">Whatsapp</label>
                                    <input type="text" name="whatsapp_link" class="form-control"
                                        value="{{ $setting->whatsapp_link }}" placeholder="https:://www.whatsapp.com">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-2">
                                    <label class="form-label">Youtube</label>
                                    <input type="text" name="youtube_link" class="form-control"
                                        value="{{ $setting->youtube_link }}" placeholder="https:://www.youtube.com">
                                </div>
                            </div>
                            <div class="col-12 text-center mt-2">
                                <button type="submit" class="btn btn-primary">Update Settings</button>
                            </div>
                        </div>
                    </form>
                </div>

                <div class="tab-pane fade " id="logo" role="tabpanel" aria-labelledby="basic-tab">
                    {!! Form::open([
                        'route' => 'admin.site-setting.store',
                        'method' => 'post',
                        'class' => 'form-horizontal',
                        'files' => true,
                        'novalidate',
                    ]) !!}
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group {!! $errors->has('logo') ? 'error' : '' !!}">
                                <label class="form-label">Logo</label>
                                <div class="controls">
                                    <div class="mb-2">
                                        <img src="{{ asset($setting->logo) }}" alt="" class="img-thumbnail">
                                    </div>
                                    <input type="file" name="logo" class="form-control">
                                </div>
                            </div>
                        </div>
                        {{-- <div class="col-md-6">
                                <div class="form-group {!! $errors->has('favicon') ? 'error' : '' !!}">
                                    <label class="form-label">Favicon</label>
                                    <div class="controls">
                                        <div class="mb-2">
                                             <img src="{{asset($setting->favicon)}}" alt="" class="img-thumbnail">
                                        </div>
                                        <input type="file" name="favicon" class="form-control">
                                    </div>
                                </div>
                            </div> --}}
                        <div class="col-md-6">
                            <div class="form-group {!! $errors->has('website_title') ? 'error' : '' !!}">
                                <label>Website Title</label>
                                <div class="controls">
                                    {!! Form::text('website_title', $setting->website_title ?? '', [
                                        'class' => 'form-control mb-1',
                                        'placeholder' => 'Website Title',
                                    ]) !!}
                                    {!! $errors->first('website_title', '<label class="help-block text-danger">:message</label>') !!}
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group {!! $errors->has('meta_description') ? 'error' : '' !!}">
                                <label>Meta Description</label>
                                <div class="controls">
                                    {!! Form::text('meta_description', $setting->meta_description ?? '', [
                                        'class' => 'form-control mb-1',
                                        'placeholder' => 'Meta Description',
                                    ]) !!}
                                    {!! $errors->first('meta_description', '<label class="help-block text-danger">:message</label>') !!}
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group {!! $errors->has('meta_keyword') ? 'error' : '' !!}">
                                <label>Meta Keyword</label>
                                <div class="controls">
                                    {!! Form::text('meta_keyword', $setting->meta_keyword ?? '', [
                                        'class' => 'form-control mb-1',
                                        'placeholder' => 'Meta Keyword',
                                        'tabindex' => 3,
                                    ]) !!}
                                    {!! $errors->first('meta_keyword', '<label class="help-block text-danger">:message</label>') !!}
                                </div>
                            </div>
                        </div>
                        <div class="col-12 text-center  pb-4">
                            <button type="submit" class="btn btn-primary">Update Settings</button>
                        </div>
                    </div>
                    {!! Form::close() !!}
                </div>
                <div class="tab-pane fade " id="payment" role="tabpanel" aria-labelledby="basic-tab">
                    <form action="{{ route('website.update.payment', $setting->id) }}" method="post">
                        @csrf


                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-2">
                                    <label class="form-label">Paystack Public Key</label>
                                    <input type="text" name="paystack_public_key"
                                        value="{{ $setting->paystack_public_key }}" class="form-control"
                                        placeholder="Public Key" required>
                                    @error('paystack_public_key')
                                        <p class="text-danger">{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-2">
                                    <label class="form-label">Paystack Secret Key</label>
                                    <input type="text" name="paystack_secret_key"
                                        value="{{ $setting->paystack_secret_key }}" class="form-control"
                                        placeholder="Secret Key">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-2">
                                    <label class="form-label">Paystack Currency</label>
                                    <select name="paystack_curency" id="paystack_curency" class="form-control" required>
                                        <option value="">Select One</option>
                                        <option value="USD"
                                            {{ $setting->paystack_curency == 'USD' ? 'selected' : '' }}>USD</option>
                                        <option value="NGN"
                                            {{ $setting->paystack_curency == 'NGN' ? 'selected' : '' }}>NGN</option>
                                        <option value="ZAR"
                                            {{ $setting->paystack_curency == 'ZAR' ? 'selected' : '' }}>ZAR</option>
                                    </select>
                                    @error('paystack_curency')
                                        <p class="text-danger">{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>
                        </div>
                        <div class="col-12 text-center mt-2">
                            <button type="submit" class="btn btn-primary">Update Settings</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

@endsection
