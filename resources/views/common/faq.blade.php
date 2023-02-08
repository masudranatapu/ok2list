@extends('layouts.app')
@section('content')
<section id="main" class="clearfix page">
    <div class="container">
        <div class="faq-page">
            <div class="breadcrumb-section">
                <!-- breadcrumb -->
                <ol class="breadcrumb">
                    <li><a href="{{ url('/') }}">Home</a></li>
                    <li>{{ __('faq') }}</li>
                </ol><!-- breadcrumb -->
            </div>

            <!--  @if (isset($data['faq_page1']) && $data['faq_page1'] != null)
    <div class="">
                                                 <div class="ads_banner text-center mb-4">
                                                     <a href="{{ $data['faq_page1']->link }}" target="_blank" title="{{ $data['faq_page1']->name }}"><img src="{{ fileExit($data['faq_page1']->photo) }}" class="w-100" alt="{{ $data['faq_page1']->name }}" style="height: 96px;"></a>
                                                 </div>
                                             </div>
    @endif -->


            <div class="tr-accordion" id="accordion">
                @if (isset($data['faqs']))
                @foreach ($data['faqs'] as $row)
                <div class="card">
                    <div class="card-header" id="heading-1">
                        <button class="<?php if ($loop->iteration != 1) {
                                        echo 'collapsed';
                                    } ?>" data-toggle="collapse" data-target="#collapse-1{{ $loop->iteration }}" <?php
                            if ($loop->iteration == 1) {
                            echo "aria-expanded='true'";
                            } else {
                            echo "aria-expanded='false'";
                            } ?>
                            aria-controls="collapse-1">
                            {{ $row->question }}
                        </button>
                    </div>

                    <div id="collapse-1{{ $loop->iteration }}" class="collapse <?php if ($loop->iteration == 1) {
                                    echo 'show';
                                } else {
                                    echo '';
                                } ?>" aria-labelledby="heading-1" data-parent="#accordion">
                        <div class="card-body">
                            <p>{{ $row->answer }}</p>
                        </div>
                    </div>
                </div>
                @endforeach
                @endif
            </div><!-- /.accordion -->

            <!-- @if (isset($data['faq_page1']) && $data['faq_page1'] != null)
    <div class="">
                                                 <div class="ads_banner text-center mb-4">
                                                     <a href="{{ $data['faq_page1']->link }}" target="_blank" title="{{ $data['faq_page1']->name }}"><img src="{{ fileExit($data['faq_page1']->photo) }}" class="w-100" alt="{{ $data['faq_page1']->name }}" style="height: 96px;"></a>
                                                 </div>
                                             </div>
    @endif -->

        </div><!-- faq-page -->
    </div><!-- container -->

    <section id="something-sell" class="clearfix parallax-section"
        style="background-image: url('{{ asset('post-bg.jpg') }}');">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 text-center">
                    <h2 class="title">{{ __('did_not_find_your_answer_yet?') }}</h2>
                    <h4>{{ __('send_us_a_note_to_help_center') }}</h4>
                    <a href="{{ route('contact-us') }}" class="btn btn-primary">{{ __('contact_us') }}</a>
                </div>
            </div>
        </div>
    </section>

</section>


@endsection

@push('custom_footer_script')
@endpush