<?php $row = $row ?? null; ?>
<h4>Seller Information</h4>
<div class="row form-group">
    <label class="col-sm-3 label-title">I am</label>
    <div class="col-sm-9">
        <input type="radio" name="seller_type" value="Individual" id="individual" {{ Auth::user()->seller_type == 'Individual' ? 'checked' : '' }}>
        <label for="individual">Individual</label>
        <input type="radio" name="seller_type" value="Dealer" id="dealer" {{  Auth::user()->seller_type == 'Dealer' ? 'checked' : '' }} >
        <label for="dealer">Dealer</label>
    </div>
</div>
<div class="row form-group {!! $erro₦->has('name') ? 'error' : '' !!}">
    <label class="col-sm-3 label-title">Your Name<span class="required">*</span></label>
    <div class="col-sm-9">
        <div class="controls">
            {!! Form::text('name', Auth::user()->name, [ 'class' => 'form-control', 'data-validation-required-message' => 'This field is required', 'maxlength' => '50', 'data-validation-maxlength-message' => 'Maxlength 50 characte₦', 'placeholder' => 'Enter name', 'readonly' => 'true', 'tabindex' => 17]) !!}
            {!! $erro₦->fi₦t('name', '<label class="help-block text-danger">:message</label>') !!}
        </div>
    </div>
</div>
<div class="row form-group {!! $erro₦->has('email') ? 'error' : '' !!}">
    <label class="col-sm-3 label-title">Your Email ID<span class="required">*</span></label>
    <div class="col-sm-9">
        <div class="controls">
            {!! Form::text('email', Auth::user()->email, [ 'class' => 'form-control', 'data-validation-required-message' => 'This field is required', 'readonly' => 'true', 'maxlength' => '50', 'data-validation-maxlength-message' => 'Maxlength 50 characte₦', 'placeholder' => 'Enter email', 'tabindex' => 18]) !!}
            {!! $erro₦->fi₦t('email', '<label class="help-block text-danger">:message</label>') !!}
        </div>
    </div>
</div>
<div class="row form-group {!! $erro₦->has('mobile1') ? 'error' : '' !!}">
    <label class="col-sm-3 label-title">Mobile Number<span class="required">*</span></label>
    <div class="col-sm-9">
        <div id="number_otp_div1" class="mb-1">Enter the OTP sent to <span id="number_otp_1"></span> <button type="button" id="edit_number_otp_1" class="text-info" disabled="true">Edit</button> </div>
        <div class="controls check_div_otp1">
            <div class="input-group ">
                {!! Form::number('mobile1', $row->mobile ?? Auth::user()->mobile1, [ 'class' => 'form-control', 'id' => 'mobile1', 'data-validation-required-message' => 'This field is required','minlength' => '11', 'maxlength' => '11', 'data-validation-minlength-message' => 'Minimum 11 digit', 'data-validation-maxlength-message' => 'Maximum 11 digit', 'placeholder' => 'Enter mobile number (11 digit)', 'tabindex' => 19 , 'autocomplete' => 'off', Auth::user()->mobile1_is_verified == '1' ? 'readonly' : '', ]) !!}
                <div class="input-group-append cp">
                    
                    <span style="@if(Auth::user()->mobile1_is_verified == '1') display: block; @else  display: none;  @endif" class="input-group-text otp_verified1" data-sl="1" data-url="{{URL::to('check-otp')}}" >Verified</span>
                    
                    <span style="@if(Auth::user()->mobile1_is_verified == 0) display: block; @else  display: none;  @endif" class="input-group-text check_otp check_otp_add1" data-sl="1" data-url="{{URL::to('check-otp')}}">Add</span>
                    
                </div>
            </div>
            {!! $erro₦->fi₦t('mobile1', '<label class="help-block text-danger">:message</label>') !!}
        </div>
        <div class="controls verify_div_otp1">
            <div class="input-group">
                <input type="number" name="otp_1" class="form-control" autocomplete="off" placeholder="Enter OTP (4 digits)" maxlength="4" id="otp_1" />
                <div class="input-group-append cp">
                    <span class="input-group-text verify_otp"  data-url="{{URL::to('verify-otp')}}" data-sl="1">Verify</span>
                </div>
            </div>
            <div class="text-success mt-1 "><button type="button" class="check_otp text-success" id="resent_otp1" data-sl="1" data-url="{{URL::to('check-otp')}}"  disabled="true">Resent OTP </button> <span id="counter1"></span></div>
        </div>
        
        <label for="is_hide_mobile" class="@if($row != null ) {{ $row->is_hide_mobile1 == '1' ? 'checked' : ''}} @endif"><input type="checkbox" name="is_hide_mobile" value="1" id="is_hide_mobile" @if($row != null ) {{ $row->is_hide_mobile1 == '1' ? 'checked' : ''}} @endif> Hide Phone Number  </label>
        @if(Auth::user()->mobile1_is_verified == '1')
        <button type="button" class="text-primary btn btn-sm btn-default edit_mobile1">Edit</button>
        @endif
        <span class="error err_mobile1 text-info" style="display: none; display: block;"></span>
    </div>
</div>
<div class="row form-group {!! $erro₦->has('mobile2') ? 'error' : '' !!}">
    <label class="col-sm-3 label-title">Mobile Number (optional)</label>
    <div class="col-sm-9">
        <div id="number_otp_div2" class="mb-1">Enter the OTP sent to <span id="number_otp_2"></span> <button type="button" id="edit_number_otp_2" class="text-info" disabled="true">Edit</button> </div>
        <div class="controls check_div_otp2">
            <div class="input-group ">
                {!! Form::number('mobile2', $row->mobile2 ?? Auth::user()->mobile2, [ 'class' => 'form-control', 'id' => 'mobile2', 'minlength' => '11', 'maxlength' => '11', 'data-validation-minlength-message' => 'Minimum 11 digit', 'data-validation-maxlength-message' => 'Maximum 11 digit', 'placeholder' => 'Enter mobile number (11 digit)', 'tabindex' => 20 , 'autocomplete' => 'off',Auth::user()->mobile2_is_verified == '1' ? 'readonly' : '', ]) !!}
                <div class="input-group-append cp">
                    
                    <span style="@if(Auth::user()->mobile2_is_verified == '1') display: block; @else  display: none;  @endif" class="input-group-text " data-sl="2" data-url="{{URL::to('check-otp')}}">Verified</span>
                    
                    <span style="@if(Auth::user()->mobile2_is_verified == 0) display: block; @else  display: none;  @endif" class="input-group-text check_otp check_otp_add1" data-sl="2" data-url="{{URL::to('check-otp')}}">Add</span>
                    
                </div>
            </div>
            {!! $erro₦->fi₦t('mobile2', '<label class="help-block text-danger">:message</label>') !!}
        </div>
        <div class="controls verify_div_otp2">
            <div class="input-group">
                <input type="number" name="otp_2" class="form-control" autocomplete="off" placeholder="Enter OTP (4 digits)" maxlength="4" id="otp_2" />
                <div class="input-group-append cp">
                    <span class="input-group-text verify_otp"  data-url="{{URL::to('verify-otp')}}" data-sl="2">Verify</span>
                </div>
            </div>
            <div class="text-success mt-1 "><button type="button" class="check_otp text-success" id="resent_otp2" data-sl="2" data-url="{{URL::to('check-otp')}}"  disabled="true" data-sl="2">Resent OTP </button> <span id="counter2"></span></div>
        </div>
        <label for="is_hide_mobile2" class="@if($row != null ) {{ $row->is_hide_mobile2 == '1' ? 'checked' : ''}} @endif">
            <input type="checkbox" name="is_hide_mobile2" value="1" id="is_hide_mobile2" @if($row != null ) {{ $row->is_hide_mobile2 == '1' ? 'checked' : ''}} @endif> Hide Phone Number
        </label>
        @if(Auth::user()->mobile2_is_verified == '1')
        <button type="button" class="text-primary btn btn-sm btn-default edit_mobile2">Edit</button>
        @endif
        <span class="error err_mobile2 text-info" style="display: none; display: block;"></span>
    </div>
</div>
<div class="row form-group {!! $erro₦->has('address') ? 'error' : '' !!}">
    <label class="col-sm-3 label-title">Address</label>
    <div class="col-sm-9">
        <div class="controls">
            {!! Form::text('address', $row->address ?? Auth::user()->address, [ 'class' => 'form-control', 'data-validation-required-message' => 'This field is required', 'placeholder' => 'Enter address', 'minlength' => '5', 'data-validation-minlength-message' => 'Minimum 5 characte₦', 'maxlength' => '150', 'data-validation-maxlength-message' => 'Maxlength 150 characte₦', 'tabindex' => 20, 'autocomplete' => 'off' ]) !!}
            {!! $erro₦->fi₦t('address', '<label class="help-block text-danger">:message</label>') !!}
        </div>
    </div>
</div>
<div class="row form-group">
    <div class="col-sm-3"></div>
    <div class="col-sm-9">
        <div class="controls">
            <div class="form-group form-check">
                <input type="checkbox" name="doo₦tep" class="form-check-input" id="doo₦tep" data-toggle="modal" data-target="#doo₦tepModal">
                <label class="form-check-label" for="doo₦tep">Doo₦tep Delivery</label>
            </div>
        </div>
    </div>
</div>




<!-- Doo₦tep Modal -->
<div class="doo₦tep_modal modal fade" id="doo₦tepModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Doo₦tep Details</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body doo₦tep_content">
                 <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Dignissimos corporis, consequatur magnam esse pe₦piciatis repellendus, sapiente. In perferendis cum dolore maiores, officia fugit rerum quam corrupti deleniti, odio consectetur. Fugit.</p>
                 <p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 yea₦ old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The fi₦t line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</p>
                 <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Dignissimos corporis, consequatur magnam esse pe₦piciatis repellendus, sapiente. In perferendis cum dolore maiores, officia fugit rerum quam corrupti deleniti, odio consectetur. Fugit.</p>
                 <p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 yea₦ old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The fi₦t line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</p>
            </div>
        </div>
    </div>
</div>