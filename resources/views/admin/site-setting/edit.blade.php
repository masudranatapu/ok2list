@extends('admin.layout.master')
@section('site-ads','active')
@section('breadcrumb')
<li class="breadcrumb-item"><a href="#">Dashboard</a>
</li>
<li class="breadcrumb-item active">Ads
</li>
@endsection
@section('content')
<div class="content-body">
<section id="pagination">
    <div class="row">
        <div class="col-md-12">
            <div class="card card-sm">
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

                    <form action="{{ route('site.ads.update', $data->pk_no) }}" method="post" enctype="multipart/form-data">
                        @csrf
                        @method('PUT')
                        <div class="row d-flex justify-content-center">
                            <div class="col-md-9 col-lg-6">
                                <div class="form-group">
                                    <label class="form-label">Position Name <span class="text-danger">*</span></label>
                                    <input type="text" name="position" value="{{ $data->name }}" class="form-control" placeholder="Enter position name">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Status <span class="text-danger">*</span></label>
                                    <select name="status" class="form-control">
                                        <option value="1" {{ $data->is_active == 1 ? 'selected' : ''}}>Active</option>
                                        <option value="0" {{ $data->is_active == 0 ? 'selected' : ''}}>Inactive</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <hr>

                        <div class="row d-flex justify-content-center">
                            <div class="col-md-9 col-lg-6">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>Photo Name</th>
                                            <th>File</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody class="input_fields_wrap">
                                        @if(isset($dataDetail) && count($dataDetail) > 0 )
                                        @foreach($dataDetail as $key => $row )
                                        <tr>
                                            <td>
                                                <input type="text" name="photo_name" class="form-control" value = "{{ $row->name ?? ''}}" required placeholder="Photo name">
                                            </td>
                                            <td>
                                                <img src="{{ asset('public/uploads/Ads') }}" width="150" />
                                                <input type="file" name="photo[]" value ="" accept="image/*" class="form-control" required>
                                            </td>
                                            <td>
                                                <div class = "parent" style="margin-top: 8px;">
                                                    <a href="javascript:void(0)" class="btn-sm btn-primary add_field_button"><i class="la la-plus"></i></a>
                                                </div>
                                            </td>
                                        </tr>
                                        @endforeach
                                        @endif
                                    </tbody>
                                </table>
                                <div class="pb-4 mt-3">
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
</div>

    <script type="text/javascript">
    $(document).ready(function() {
        var max_fields      = 10; //maximum input boxes allowed
        var wrapper         = $(".input_fields_wrap"); //Fields wrapper
        var add_button      = $(".add_field_button"); //Add button ID

        var x = 1; //initlal text box count
        $(add_button).click(function(e){ //on add input button click
            e.preventDefault();
            if(x < max_fields){ //max input box allowed
                x++; //text box increment
                $(wrapper).append('<tr class="customer_field"><td><input type="text" name="photo_name[]" class="form-control" required placeholder="Phone name"></td><td><input type="file" name="photo[]" class="form-control" required></td><td><div style="margin-top: 8px;"><a href="javascript:void(0)" class="btn-sm btn-danger remove_tr"><i class="la la-minus"></i></a></div></td></tr>'); //add input box
            }
        });


    });

    $(document).on('click', '.remove_tr', function(e){
        $(this).closest("tr").remove();
    })

    </script>


@endsection
