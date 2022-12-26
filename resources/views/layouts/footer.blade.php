@php
    $setting = setting();
@endphp
<footer id="footer" class="clearfix">
    <section class="footer-top clearfix">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-6">
                    <div class="footer-widget">
                        <h3>
                            @if (app()->getLocale() == 'sl')
                                {{ $setting->section_one_name_sl }}
                            @else
                                {{ $setting->section_one_name_en }}
                            @endif
                        </h3>
                        <ul>
                            <li><a href="{{ route('about-us') }}">
                                    @if (app()->getLocale() == 'sl')
                                        {{ $setting->about_sl }}
                                    @else
                                        {{ $setting->about_en }}
                                    @endif
                                </a></li>
                            <li><a href="{{ route('contact-us') }}">
                                    @if (app()->getLocale() == 'sl')
                                        {{ $setting->contact_us_sl }}
                                    @else
                                        {{ $setting->contact_us_en }}
                                    @endif
                                </a></li>
                            <li><a href="{{ route('terms-conditions') }}">
                                    @if (app()->getLocale() == 'sl')
                                        {{ $setting->terms_conditions_sl }}
                                    @else
                                        {{ $setting->terms_conditions_en }}
                                    @endif
                                </a></li>
                            <li><a href="{{ route('privacy-policy') }}">
                                    @if (app()->getLocale() == 'sl')
                                        {{ $setting->privacy_policy_sl }}
                                    @else
                                        {{ $setting->privacy_policy_en }}
                                    @endif
                                </a></li>
                            <!-- <li><a href="{{ route('site-map') }}">
                                    @if (app()->getLocale() == 'sl')
                                        {{ $setting->sitemap_sl }}
                                    @else
                                        {{ $setting->sitemap_en }}
                                    @endif
                                </a></li> -->

                            <li><a href="{{ route('doorstep-delivery') }}">Doorstep Delivery
                                </a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-3 col-6">
                    <div class="footer-widget">
                        <h3>
                            @if (app()->getLocale() == 'sl')
                                {{ $setting->section_two_sl }}
                            @else
                                {{ $setting->section_two_en }}
                            @endif
                        </h3>
                        <ul>
                            <!-- <li><a href="{{ route('how-to-sell-fast') }}">
                                    @if (app()->getLocale() == 'sl')
                                        {{ $setting->how_to_sell_fast_sl }}
                                    @else
                                        {{ $setting->how_to_sell_fast_en }}
                                    @endif
                                </a></li> -->
                            <li><a href="{{ route('get-membership') }}">
                                    @if (app()->getLocale() == 'sl')
                                        {{ $setting->membership_sl }}
                                    @else
                                        {{ $setting->membership_en }}
                                    @endif
                                </a></li>
                            <li><a href="{{ route('promote-ads') }}">
                                    @if (app()->getLocale() == 'sl')
                                        {{ $setting->promote_your_ad_sl }}
                                    @else
                                        {{ $setting->promote_your_ad_en }}
                                    @endif
                                </a></li>
                           <!--  <li><a href="{{ route('promotions') }}">
                                    @if (app()->getLocale() == 'sl')
                                        {{ $setting->promotions_sl }}
                                    @else
                                        {{ $setting->promotions_en }}
                                    @endif
                                </a></li> -->
                            <li><a href="{{ route('faq') }}">
                                    @if (app()->getLocale() == 'sl')
                                        {{ $setting->faq_sl }}
                                    @else
                                        {{ $setting->faq_en }}
                                    @endif
                                </a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="footer-widget social-widget">
                        <h3>
                            @if (app()->getLocale() == 'sl')
                                {{ $setting->section_three_name_sl }}
                            @else
                                {{ $setting->section_three_name_en }}
                            @endif
                        </h3>
                        <ul>
                            @if ($setting->facebook_link)
                                <li>
                                    <a target="_blank" href="{{ $setting->facebook_link }}"><i
                                            class="fa fa-facebook-official"></i>
                                        @if (app()->getLocale() == 'sl')
                                            {{ $setting->facebook_sl }}
                                        @else
                                            {{ $setting->facebook_en }}
                                        @endif
                                    </a>
                                </li>
                            @endif
                            @if ($setting->twitter_link)
                                <li>
                                    <a target="_blank" href="{{ $setting->twitter_link }}"><i
                                            class="fa fa-twitter-square"></i>
                                        @if (app()->getLocale() == 'sl')
                                            {{ $setting->twitter_sl }}
                                        @else
                                            {{ $setting->twitter_en }}
                                        @endif
                                    </a>
                                </li>
                            @endif
                            @if ($setting->instagram_link)
                                <li>
                                    <a target="_blank" href="{{ $setting->instagram_link }}"><i
                                            class="fa fa-instagram"></i>
                                        @if (app()->getLocale() == 'sl')
                                            {{ $setting->instagram_sl }}
                                        @else
                                            {{ $setting->instagram_en }}
                                        @endif
                                    </a>
                                </li>
                            @endif
                            @if ($setting->linkedin_link)
                                <li>
                                    <a target="_blank" href="{{ $setting->linkedin_link }}"><i
                                            class="fa fa-linkedin"></i>
                                        @if (app()->getLocale() == 'sl')
                                            {{ $setting->linkedin_sl }}
                                        @else
                                            {{ $setting->linkedin_en }}
                                        @endif
                                    </a>
                                </li>
                            @endif
                            @if ($setting->whatsapp_link)
                                <li>
                                    <a target="_blank" href="{{ $setting->whatsapp_link }}"><i
                                            class="fa fa-whatsapp"></i>
                                        @if (app()->getLocale() == 'sl')
                                            {{ $setting->whatsapp_sl }}
                                        @else
                                            {{ $setting->whatsapp_en }}
                                        @endif
                                    </a>
                                </li>
                            @endif
                            @if ($setting->youtube_link)
                                <li>
                                    <a target="_blank" href="{{ $setting->youtube_link }}"><i
                                            class="fa fa-youtube-play"></i>
                                        @if (app()->getLocale() == 'sl')
                                            {{ $setting->youtube_sl }}
                                        @else
                                            {{ $setting->youtube_en }}
                                        @endif
                                    </a>
                                </li>
                            @endif
                        </ul>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="footer-widget news-letter">
                        <h3>
                            @if (app()->getLocale() == 'sl')
                                {{ $setting->section_four_sl }}
                            @else
                                {{ $setting->section_four_en }}
                            @endif
                        </h3>
                        <p>
                            @if (app()->getLocale() == 'sl')
                                {{ $setting->content_sl }}
                            @else
                                {{ $setting->content_en }}
                            @endif
                        </p>
                        {!! Form::open([
                            'route' => 'subscribe',
                            'method' => 'post',
                            'class' => 'form-contact',
                            'files' => false,
                            'novalidate',
                            'autocomplete' => 'off',
                        ]) !!}
                        <div class="form-group">
                            <div class="controls">
                                {!! Form::email('email', old('email'), [
                                    'class' => 'form-control',
                                    'id' => 'email',
                                    'placeholder' => 'email...',
                                    'data-validation-required-message' => 'This field is required',
                                    'tabindex' => 5,
                                ]) !!}
                                {!! $errors->first('email', '<label class="help-block text-danger">:message</label>') !!}
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary">@lang('web.subscriptbe')</button>
                        {!! Form::close() !!}
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div class="footer-bottom clearfix text-center">
        <div class="container">
            <p>{{ __($setting->copyright) }} {{ date('Y') }} </p>
        </div>
    </div>
</footer>
