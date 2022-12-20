    <div class="section our-location">
        <div class="container">
            <div class="cities">
            <div class="section-title">
                <h1>@lang('web.best_rated_locations')</h1>
            </div>
            <!-- row -->
            <div class="row">
                 <!-- Dhaka Division -->
                  @if($data['cities'] && count($data['cities']) > 0 )
                        @foreach($data['cities'] as $key => $city )

                        @if ($key > 7)
                            @break
                        @endif
                <div class="col-6 col-md-4 col-lg-3 mb-4 text-center">
                    <a href="{{route('ads.list', ['area' => $city->url_slug])}}" title="Ad post for {{$city->name}}">
                      <div class="location text-center">
                        <h3>{{number_format($city->total_post)}}</h3>
                        <h4><i class="fa fa-map-marker"></i>{{$city->name}}</h4>
                    </div>
                    </a>
                </div>
                   @endforeach
                @endif
            </div><!-- row -->
        </div>
    </div>
</div>
