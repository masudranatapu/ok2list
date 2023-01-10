@extends('admin.layout.master')

@section('Web Setting','open')

@push('custom_css')

@endpush('custom_css')

@section('footer','active')

@section('title')
    @lang('web_setting.footer_title')
@endsection

@section('page-name')
    @lang('web_setting.footer_title')
@endsection

@section('breadcrumb')
    <li class="breadcrumb-item"><a href="javascript:;">@lang('admin_role.breadcrumb_title')</a></li>
    <li class="breadcrumb-item active">@lang('web_setting.footer_title')    </li>
@endsection

@section('content')
    <div class="content-body">
        <section id="pagination">
            <div class="row">
                <div class="col-md-12">
                    <div class="card pb-2">
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
                                <form action="{{route('admin.footer.update', $site_settings->id)}}" method="POST">
                                    @csrf
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="card">
                                                <div class="card-header">
                                                    <h3>Section One</h3>
                                                </div>
                                                <div class="card-body">
                                                    <div class="row">
                                                        <div class="col-md-6 mb-2">
                                                            <div class="form-group">
                                                                <label for="">Section One Name En</label>
                                                                <input type="text" class="form-control" value="{{$site_settings->section_one_name_en }}" name="section_one_name_en">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 mb-2">
                                                            <div class="form-group">
                                                                <label for="">Section One Name Sl</label>
                                                                <input type="text" class="form-control" value="{{$site_settings->section_one_name_sl }}" name="section_one_name_sl">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <div class="form-group">
                                                                        <label>About En</label>
                                                                        <input type="text" class="form-control" value="{{$site_settings->about_en }}" name="about_en">
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12">
                                                                    <div class="form-group">
                                                                        <label>Contact Us En</label>
                                                                        <input type="text" class="form-control" value="{{$site_settings->contact_us_en }}" name="contact_us_en">
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12">
                                                                    <div class="form-group">
                                                                        <label>Terms & Conditions En</label>
                                                                        <input type="text" class="form-control" value="{{$site_settings->terms_conditions_en }}" name="terms_conditions_en">
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12">
                                                                    <div class="form-group">
                                                                        <label>Privacy Policy En</label>
                                                                        <input type="text" class="form-control" value="{{$site_settings->privacy_policy_en }}" name="privacy_policy_en">
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12">
                                                                    <div class="form-group">
                                                                        <label>Sitemap En</label>
                                                                        <input type="text" class="form-control" value="{{$site_settings->sitemap_en }}" name="sitemap_en">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <div class="form-group">
                                                                        <label>About SL</label>
                                                                        <input type="text" class="form-control" value="{{$site_settings->about_sl }}" name="about_sl">
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12">
                                                                    <div class="form-group">
                                                                        <label>Contact Us SL</label>
                                                                        <input type="text" class="form-control" value="{{$site_settings->contact_us_sl }}" name="contact_us_sl">
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12">
                                                                    <div class="form-group">
                                                                        <label>Terms & Conditions SL</label>
                                                                        <input type="text" class="form-control" value="{{$site_settings->terms_conditions_sl }}" name="terms_conditions_sl">
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12">
                                                                    <div class="form-group">
                                                                        <label>Privacy Policy SL</label>
                                                                        <input type="text" class="form-control" value="{{$site_settings->privacy_policy_sl }}" name="privacy_policy_sl">
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12">
                                                                    <div class="form-group">
                                                                        <label>Sitemap SL</label>
                                                                        <input type="text" class="form-control" value="{{$site_settings->sitemap_sl }}" name="sitemap_sl">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="card">
                                                <div class="card-header">
                                                    <h3>Section Two</h3>
                                                </div>
                                                <div class="card-body">
                                                    <div class="row">
                                                        <div class="col-md-6 mb-2">
                                                            <div class="form-group">
                                                                <label for="">Section Two Name En</label>
                                                                <input type="text" class="form-control" value="{{$site_settings->section_two_en }}" name="section_two_en">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 mb-2">
                                                            <div class="form-group">
                                                                <label for="">Section Two Name SL</label>
                                                                <input type="text" class="form-control" value="{{$site_settings->section_two_sl }}" name="section_two_sl">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <div class="form-group">
                                                                        <label>How To Sell Fast En</label>
                                                                        <input type="text" class="form-control" value="{{$site_settings->how_to_sell_fast_en }}" name="how_to_sell_fast_en">
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12">
                                                                    <div class="form-group">
                                                                        <label>MembeRship En</label>
                                                                        <input type="text" class="form-control" value="{{$site_settings->membeRship_en }}" name="membeRship_en">
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12">
                                                                    <div class="form-group">
                                                                        <label>Promote Your Ad En</label>
                                                                        <input type="text" class="form-control" value="{{$site_settings->promote_your_ad_en }}" name="promote_your_ad_en">
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12">
                                                                    <div class="form-group">
                                                                        <label>Promotions En</label>
                                                                        <input type="text" class="form-control" value="{{$site_settings->promotions_en }}" name="promotions_en">
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12">
                                                                    <div class="form-group">
                                                                        <label>FAQ En</label>
                                                                        <input type="text" class="form-control" value="{{$site_settings->faq_en }}" name="faq_en">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <div class="form-group">
                                                                        <label>How To Sell Fast SL</label>
                                                                        <input type="text" class="form-control" value="{{$site_settings->how_to_sell_fast_sl }}" name="how_to_sell_fast_sl">
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12">
                                                                    <div class="form-group">
                                                                        <label>MembeRship SL</label>
                                                                        <input type="text" class="form-control" value="{{$site_settings->membeRship_sl }}" name="membeRship_sl">
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12">
                                                                    <div class="form-group">
                                                                        <label>Promote Your Ad SL</label>
                                                                        <input type="text" class="form-control" value="{{$site_settings->promote_your_ad_sl }}" name="promote_your_ad_sl">
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12">
                                                                    <div class="form-group">
                                                                        <label>Promotions SL</label>
                                                                        <input type="text" class="form-control" value="{{$site_settings->promotions_sl }}" name="promotions_sl">
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12">
                                                                    <div class="form-group">
                                                                        <label>FAQ SL</label>
                                                                        <input type="text" class="form-control" value="{{$site_settings->faq_sl }}" name="faq_sl">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="card">
                                                <div class="card-header">
                                                    <h3>Section Three</h3>
                                                </div>
                                                <div class="card-body">
                                                    <div class="row">
                                                        <div class="col-md-6 mb-2">
                                                            <div class="form-group">
                                                                <label for="">Section Three name En</label>
                                                                <input type="text" class="form-control" value="{{$site_settings->section_three_name_en }}" name="section_three_name_en">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 mb-2">
                                                            <div class="form-group">
                                                                <label for="">Section Three name SL</label>
                                                                <input type="text" class="form-control" value="{{$site_settings->section_three_name_sl }}" name="section_three_name_sl">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <div class="col-md-12">
                                                                        <div class="form-group">
                                                                            <label>Facebook En</label>
                                                                            <input type="text" class="form-control" value="{{$site_settings->facebook_en }}" name="facebook_en">
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-12">
                                                                        <div class="form-group">
                                                                            <label>Instagram En</label>
                                                                            <input type="text" class="form-control" value="{{$site_settings->instagram_en }}" name="instagram_en">
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-12">
                                                                        <div class="form-group">
                                                                            <label>Twitter En</label>
                                                                            <input type="text" class="form-control" value="{{$site_settings->twitter_en }}" name="twitter_en">
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-12">
                                                                        <div class="form-group">
                                                                            <label>Linkedin En</label>
                                                                            <input type="text" class="form-control" value="{{$site_settings->linkedin_en }}" name="linkedin_en">
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-12">
                                                                        <div class="form-group">
                                                                            <label>Whatsapp En</label>
                                                                            <input type="text" class="form-control" value="{{$site_settings->whatsapp_en }}" name="whatsapp_en">
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-12">
                                                                        <div class="form-group">
                                                                            <label>Youtube En</label>
                                                                            <input type="text" class="form-control" value="{{$site_settings->youtube_en }}" name="youtube_en">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="col-md-12">
                                                                        <div class="form-group">
                                                                            <label>Facebook  Sl</label>
                                                                            <input type="text" class="form-control" value="{{$site_settings->facebook_sl }}" name="facebook_sl">
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-12">
                                                                        <div class="form-group">
                                                                            <label>Instagram Sl</label>
                                                                            <input type="text" class="form-control" value="{{$site_settings->instagram_sl }}" name="instagram_sl">
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-12">
                                                                        <div class="form-group">
                                                                            <label>Twitter Sl</label>
                                                                            <input type="text" class="form-control" value="{{$site_settings->twitter_sl }}" name="twitter_sl">
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-12">
                                                                        <div class="form-group">
                                                                            <label>Linkedin Sl</label>
                                                                            <input type="text" class="form-control" value="{{$site_settings->linkedin_sl }}" name="linkedin_sl">
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-12">
                                                                        <div class="form-group">
                                                                            <label>Whatsapp Sl</label>
                                                                            <input type="text" class="form-control" value="{{$site_settings->whatsapp_sl }}" name="whatsapp_sl">
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-12">
                                                                        <div class="form-group">
                                                                            <label>Youtube Sl</label>
                                                                            <input type="text" class="form-control" value="{{$site_settings->youtube_sl }}" name="youtube_sl">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <div class="form-group">
                                                                        <label>Facebook Link</label>
                                                                        <input type="text" class="form-control" value="{{$site_settings->facebook_link }}" name="facebook_link">
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12">
                                                                    <div class="form-group">
                                                                        <label>Instagram Link</label>
                                                                        <input type="text" class="form-control" value="{{$site_settings->instagram_link }}" name="instagram_link">
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12">
                                                                    <div class="form-group">
                                                                        <label>Twitter Link</label>
                                                                        <input type="text" class="form-control" value="{{$site_settings->twitter_link }}" name="twitter_link">
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12">
                                                                    <div class="form-group">
                                                                        <label>Linkedin Link</label>
                                                                        <input type="text" class="form-control" value="{{$site_settings->linkedin_link }}" name="linkedin_link">
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12">
                                                                    <div class="form-group">
                                                                        <label>Whatsapp Link</label>
                                                                        <input type="text" class="form-control" value="{{$site_settings->whatsapp_link }}" name="whatsapp_link">
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12">
                                                                    <div class="form-group">
                                                                        <label>Youtube Link</label>
                                                                        <input type="text" class="form-control" value="{{$site_settings->youtube_link }}" name="youtube_link">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="card">
                                                <div class="card-header">
                                                    <h3>Section Four</h3>
                                                </div>
                                                <div class="card-body">
                                                    <div class="row">
                                                        <div class="col-md-6 mb-2">
                                                            <div class="form-group">
                                                                <label for="">Section Four Name En</label>
                                                                <input type="text" class="form-control" value="{{$site_settings->section_four_en }}" name="section_four_en">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 mb-2">
                                                            <div class="form-group">
                                                                <label for="">Section Four Name SL</label>
                                                                <input type="text" class="form-control" value="{{$site_settings->section_four_sl }}" name="section_four_sl">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <div class="form-group">
                                                                        <label>Content En</label>
                                                                        <input type="text" class="form-control" value="{{$site_settings->content_en }}" name="content_en">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <div class="form-group">
                                                                        <label>Content Sl</label>
                                                                        <input type="text" class="form-control" value="{{$site_settings->content_sl }}" name="content_sl">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-actions text-center mt-3">
                                        <button type="submit" class="btn btn-success mr-1">
                                            Update
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

@endpush('custom_js')