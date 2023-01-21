@extends('admin.layout.master')

@section('title')
    {{ __('trans_languages') }}
@endsection

@section('page-name')
    {{ __('trans_languages') }}
@endsection

@section('breadcrumb')
    <li class="breadcrumb-item">
        <a href="{{ route('admin.dashboard') }}">{{ __('admin_breadcrumb_title') }}</a>
    </li>
    <li class="breadcrumb-item active">
        {{ __('trans_languages') }}
    </li>
@endsection

@section('content')
    <div class="content-body">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <div class="row">
                            <div class="col-lg-6 col-md-12 mb-2 mb-lg-0">
                                <h3>{{ __('trans_languages') }}</h3>
                            </div>
                            <div class="col-lg-6 col-md-12 text-right">
                                <a href="{{ route('languages.index') }}" class="btn btn-success">
                                    <i class="la la-arrow-left"></i>
                                    {{ __('back') }}
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <form action="{{ route('translation.update') }}" method="POST">
                            @csrf
                            <input type="hidden" name="lang_id" value="{{ $languages->id }}">
                            <div class="row">
                                <table class="table table-striped table-bordered">
                                    <tbody>
                                        @foreach ($translations as $key => $value)
                                            <tr>
                                                <td width="2%">{{ $loop->iteration }}</td>
                                                <td class="key">
                                                    {{ ucwords(str_replace('_', ' ', $key)) }}
                                                </td>
                                                <td>
                                                    <span class="d-flex">
                                                        <input type="text" class="form-control value" style="width:100%"
                                                            name="{{ $key }}" value="{{ $value }}">
                                                        <button type="button"
                                                            onclick="AutoTrans('{{ $key }}', '{{ $value }}', '{{ $languages->code }}')"
                                                            class="btn btn-sm ml-1 bg-info text-white">
                                                            Translate
                                                        </button>
                                                    </span>
                                                </td>
                                            </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                            <div class="row">
                                <div class="d-flex mx-auto">
                                    <button type="submit" class="lang-btn btn btn-success"><i
                                            class="fas fa-sync"></i>&nbsp; {{ __('update') }}</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('custom_css')
@endpush

@push('custom_js')
    <script>
        function AutoTrans(key, value, lang) {
            $.ajax({
                url: "{{ route('translation.update.auto') }}",
                type: "POST",
                data: {
                    lang: lang,
                    text: value,
                    _token: '{{ csrf_token() }}'
                },
                dataType: 'json',
                success: function(result) {
                    console.log(result);
                    $('input[name=' + key + ']').val(result);
                }
            });
        }

        //  for all

        function AutoTransAll(lang) {
            $('#translate_all').text('Translating...');
            $('.lang-btn').prop('disabled', true);

            $.ajax({
                url: "{{ route('translation.update.auto.all') }}",
                type: "POST",
                data: {
                    lang: lang,
                    _token: '{{ csrf_token() }}'
                },
                dataType: 'json',
                success: function(result) {
                    $.each(result.data, function(key, value) {
                        $('input[name=' + key + ']').val(value);
                    });

                    setTimeout(() => {
                        $('#translate_all').text('Translate All');
                        $('.lang-btn').prop('disabled', false);
                    }, 1000);
                },
                error: function(error) {
                    $('#translate_all').text('Translate All');
                    $('.lang-btn').prop('disabled', false);
                }
            });

        }
    </script>
@endpush
