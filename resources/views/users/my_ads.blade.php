@extends('layouts.app')

@push('custom_css')
    <link rel="stylesheet" href="https://cdn.bootcss.com/toastr.js/latest/css/toastr.min.css">
    <style type="text/css">
        .c-btn {
            color: #fff;
            font-weight: 400;
            font-size: 14px;
            background: #ee1d23;
            padding: 0px 10px;
            border-radius: 4px;
        }

        .c-btn:hover {
            color: #000;
        }

        .ad-info .item-price {
            display: inline-block;
            margin-bottom: 8px;
        }

        .promote {
            text-align: left;
        }
    </style>
@endpush

@section('content')
    <?php
    $rows = $data['my_ads'] ?? null;
    ?>
    <section id="main" class="clearfix myads-page">
        <div class="container">
            <div class="breadcrumb-section">
                <ol class="breadcrumb">
                    <li><a href="{{ url('/') }}">{{ __('home') }}</a></li>
                    <li>{{ __('ad_post') }}</li>
                </ol>
            </div>
            <div class="ads-info profile">
                <div class="row">
                    <div class="col-xl-3 text-center">
                        @include('users._user_dashboard_menu')
                    </div>
                    <div class="col-xl-9">
                        <div class="my-ads section">
                            <h2>{{ __('my_ads') }}</h2>
                            <!-- ad-item -->
                            @if ($rows && count($rows) > 0)
                                @foreach ($rows as $key => $row)
                                    <div class="ad-item row col-12">
                                        <div class="item-image-box col-lg-4">
                                            <div class="item-image">
                                                <a href="javascript:void(0)"><img src="{{ $row->img_path_thumb ?? '' }}"
                                                        alt="Image" class="img-fluid"
                                                        style="width: 100%; height: 150px;"></a>
                                            </div>
                                        </div>
                                        <div class="item-info col-lg-8">
                                            <div class="ad-info">
                                                <h3 class="item-price">₦ {{ number_format($row->price, 2) }} <a
                                                        href="{{ route('promoted-ads.create', $row->pk_no) }}">(Promote this
                                                        ad)</a></h3>

                                                @if ($row->is_delete == 1)
                                                    <a href="javascript:void(0)" class="pull-right c-btn"> Rejected</a>
                                                @else
                                                    @if ($row->is_active == 0)
                                                        <a href="javascript:void(0)" class="pull-right c-btn"> Pending</a>
                                                    @elseif($row->is_active == 1)
                                                        <a href="javascript:void(0)" class="pull-right c-btn">
                                                            {{ $row->promotion }} </a>
                                                    @elseif($row->is_active == 2)
                                                        <a href="javascript:void(0)"
                                                            class="pull-right c-btn btn-danger">Expired</a>
                                                    @elseif($row->is_active == 3)
                                                        <a href="javascript:void(0)"
                                                            class="pull-right c-btn btn-danger">Draft</a>
                                                    @endif
                                                @endif

                                                <h4 class="item-title"><a
                                                        href="{{ route('ad.details', ['pk_no' => $row->pk_no, 'url_slug' => $row->url_slug]) }}">{{ $row->ad_title ?? '' }}</a>
                                                </h4>
                                                <div class="item-cat">
                                                    <span><a
                                                            href="javascript:void(0)">{{ $row->category->name ?? '' }}</a></span>
                                                    /
                                                    <span><a
                                                            href="javascript:void(0)">{{ $row->subcategory->name ?? '' }}</a></span>
                                                </div>
                                            </div>
                                            @php
                                                $ss_packages = DB::table('ss_packages')
                                                    ->where('pk_no', Auth::user()->package_id)
                                                    ->first();
                                            @endphp
                                            <div class="ad-meta">
                                                <div class="meta-content">
                                                    <span class="dated" style="">Posted On: <a
                                                            href="#">{{ date('d M Y, H:i A ', strtotime($row->created_at)) }}</a></span>
                                                    @if ($ss_packages->analytics == 1)
                                                        <span class="visitors" title="Visitor">Visitor <i
                                                                class="fa fa-eye"></i> :
                                                            {{ $row->total_view ?? '0' }}</span>
                                                        <span class="visitors"> Like <i class="fa fa-thumbs-up"></i> :
                                                            {{ $row->total_like ?? '0' }}</span>
                                                    @endif
                                                </div>
                                                <div class="user-option pull-right">
                                                    {{-- <a class="edit-item" href="{{route('ad-expired',['id' => $row->pk_no])}}" data-toggle="tooltip" data-placement="top" title="Ad Expired"><i class="fa fa-pencil"></i></a> --}}
                                                    <a class="edit-item"
                                                        href="{{ route('edit-post', ['id' => $row->pk_no, 'subcategory' => $row->subcategory->url_slug, 'type' => $row->main_category, 'category' => $row->f_scat_pk_no]) }}"
                                                        data-toggle="tooltip" data-placement="top" title="Edit this ad"><i
                                                            class="fa fa-pencil"></i></a>
                                                    <a class="delete-item"
                                                        href="{{ route('my-ads.delete', [$row->pk_no]) }}"
                                                        data-toggle="tooltip" data-placement="top" title="Delete this ad"
                                                        onclick="return confirm('Are you sure ?')"><i
                                                            class="fa fa-times"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    @if ($row->is_active == 2)
                                        <p><b>Reason for reject :</b> <span class="text-danger">{{ $row->comments }}</span>
                                        </p>
                                    @endif
                                @endforeach
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="text-center">
                                            {{ $rows->appends(request()->query())->links() }}
                                        </div>
                                    </div>
                                </div>
                            @else
                                <p>{{ __('no_ads_available') }}</p>
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection

@push('custom_js')
    <script src="https://cdn.bootcss.com/toastr.js/latest/js/toastr.min.js"></script>
    {!! Toastr::message() !!}
@endpush
