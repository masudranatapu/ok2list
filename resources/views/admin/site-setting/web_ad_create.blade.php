@extends('admin.layout.master')
@section('site-ads','active')
@section('breadcrumb')
<li class="breadcrumb-item"><a href="#">Dashboard</a>
</li>
<li class="breadcrumb-item active">Ads (Horizontal Banner Size: 1320*96px & Vartical Ads Size: 300*600px)
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

					<form action="{{ route('site.ads.store') }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        @method('post')
						<div class="row d-flex justify-content-center">
							<div class="col-md-9 col-lg-6">
								<div class="form-group">
									<label class="form-label">Position Name <span class="text-danger">*</span></label>
                                    <select name="position" class="form-control">
                                        @if(webAdList())
                                            @foreach(webAdList() as $key => $val )
                                                <option value="{{ $key }}" >{{ $val }}</option>
                                            @endforeach
                                        @endif
                                    </select>
								</div>
								<div class="form-group">
									<label class="form-label">Status <span class="text-danger">*</span></label>
									<select name="status" class="form-control">
										<option value="1">Active</option>
										<option value="0">Inactive</option>
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
                                            <th>Link</th>
											<th>File</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody class="input_fields_wrap">
										<tr>
											<td>
												<input type="text" name="photo_name[]" class="form-control" required placeholder="Photo name">
											</td>
                                            <td>
                                                <input type="url" name="link[]" class="form-control" placeholder="Ads Link">
                                            </td>
											<td>
												<input type="file" name="photo[]" class="form-control" required>
											</td>
											<td>
												<div class = "parent" style="margin-top: 8px;">
													<a href="javascript:void(0)" class="btn-sm btn-primary add_field_button"><i class="la la-plus"></i></a>
												</div>
											</td>
										</tr>
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
                 //add input box
                $(wrapper).append('<tr class="customer_field"><td><input type="text" name="photo_name[]" class="form-control" required placeholder="Photo name"></td><td><input type="url" name="link[]" class="form-control" placeholder="Ads Link"> </td> <td><input type="file" name="photo[]" class="form-control" required></><td><div style="margin-top: 8px;"><a href="javascript:void(0)" class="btn-sm btn-danger remove_tr"><i class="la la-minus"></i></a></div></td></tr>'); //add input box
            }
        });


    });

    $(document).on('click', '.remove_tr', function(e){
        $(this).closest("tr").remove();
    })

    </script>


@endsection
