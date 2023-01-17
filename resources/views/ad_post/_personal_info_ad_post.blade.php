<?php $row = $row ?? null; ?>
<h4>Seller Information</h4>
<div class="row form-group">
    <label class="col-sm-3 label-title">I am</label>
    <div class="col-sm-9">
        <input type="radio" name="seller_type" value="Individual" id="individual"
            {{ Auth::user()->seller_type == 'Individual' ? 'checked' : '' }}>
        <label for="individual">Individual</label>
        <input type="radio" name="seller_type" value="Dealer" id="dealer"
            {{ Auth::user()->seller_type == 'Dealer' ? 'checked' : '' }}>
        <label for="dealer">Dealer</label>
    </div>
</div>
<div class="row form-group {!! $errors->has('name') ? 'error' : '' !!}">
    <label class="col-sm-3 label-title">Your Name<span class="required">*</span></label>
    <div class="col-sm-9">
        <div class="controls">
            {!! Form::text('name', Auth::user()->name, [
                'class' => 'form-control',
                'data-validation-required-message' => 'This field is required',
                'maxlength' => '50',
                'data-validation-maxlength-message' => 'Maxlength 50 characters',
                'placeholder' => 'Enter name',
                'readonly' => 'true',
                'tabindex' => 17,
            ]) !!}
            {!! $errors->first('name', '<label class="help-block text-danger">:message</label>') !!}
        </div>
    </div>
</div>
<div class="row form-group {!! $errors->has('email') ? 'error' : '' !!}">
    <label class="col-sm-3 label-title">Your Email ID<span class="required">*</span></label>
    <div class="col-sm-9">
        <div class="controls">
            {!! Form::text('email', Auth::user()->email, [
                'class' => 'form-control',
                'data-validation-required-message' => 'This field is required',
                'readonly' => 'true',
                'maxlength' => '50',
                'data-validation-maxlength-message' => 'Maxlength 50 characters',
                'placeholder' => 'Enter email',
                'tabindex' => 18,
            ]) !!}
            {!! $errors->first('email', '<label class="help-block text-danger">:message</label>') !!}
        </div>
    </div>
</div>
<div class="row form-group {!! $errors->has('mobile1') ? 'error' : '' !!}">
    <label class="col-sm-3 label-title">Mobile Number<span class="required">*</span></label>
    <div class="col-sm-9">
        <div id="number_otp_div1" class="mb-1">Enter the OTP sent to <span id="number_otp_1"></span> <button
                type="button" id="edit_number_otp_1" class="text-info" disabled="true">Edit</button> </div>
        <div class="controls check_div_otp1">
            <div class="input-group ">
                {!! Form::number('mobile1', $row->mobile ?? Auth::user()->mobile1, [
                    'class' => 'form-control',
                    'id' => 'mobile1',
                    'data-validation-required-message' => 'This field is required',
                    'minlength' => '11',
                    'maxlength' => '11',
                    'data-validation-minlength-message' => 'Minimum 11 digit',
                    'data-validation-maxlength-message' => 'Maximum 11 digit',
                    'placeholder' => 'Enter mobile number (11 digit)',
                    'tabindex' => 19,
                    'autocomplete' => 'off',
                    Auth::user()->mobile1_is_verified == '1' ? 'readonly' : '',
                ]) !!}
                <div class="input-group-append cp">

                    {{-- <span style="@if (Auth::user()->mobile1_is_verified == '1') display: block; @else  display: none;  @endif" class="input-group-text otp_verified1" data-sl="1" data-url="{{URL::to('check-otp')}}" >Verified</span> --}}

                    {{-- <span style="@if (Auth::user()->mobile1_is_verified == 0) display: block; @else  display: none;  @endif" class="input-group-text check_otp check_otp_add1" data-sl="1" data-url="{{URL::to('check-otp')}}">Add</span> --}}

                </div>
            </div>
            {!! $errors->first('mobile1', '<label class="help-block text-danger">:message</label>') !!}
        </div>
        <div class="controls verify_div_otp1">
            {{-- <div class="input-group">
                <input type="number" name="otp_1" class="form-control" autocomplete="off" placeholder="Enter OTP (4 digits)" maxlength="4" id="otp_1" />
                <div class="input-group-append cp">
                    <span class="input-group-text verify_otp"  data-url="{{URL::to('verify-otp')}}" data-sl="1">Verify</span>
                </div>
            </div> --}}
            {{-- <div class="text-success mt-1 "><button type="button" class="check_otp text-success" id="resent_otp1" data-sl="1" data-url="{{URL::to('check-otp')}}"  disabled="true">Resent OTP </button> <span id="counter1"></span></div> --}}
        </div>

        <label for="is_hide_mobile"
            class="@if ($row != null) {{ $row->is_hide_mobile1 == '1' ? 'checked' : '' }} @endif"><input
                type="checkbox" name="is_hide_mobile" value="1" id="is_hide_mobile"
                @if ($row != null) {{ $row->is_hide_mobile1 == '1' ? 'checked' : '' }} @endif> Hide Phone
            Number </label>
        @if (Auth::user()->mobile1_is_verified == '1')
            <button type="button" class="text-primary btn btn-sm btn-default edit_mobile1">Edit</button>
        @endif
        <span class="error err_mobile1 text-info" style="display: none; display: block;"></span>
    </div>
</div>
<div class="row form-group {!! $errors->has('mobile2') ? 'error' : '' !!}">
    <label class="col-sm-3 label-title">Mobile Number (optional)</label>
    <div class="col-sm-9">
        <div id="number_otp_div2" class="mb-1">Enter the OTP sent to <span id="number_otp_2"></span> <button
                type="button" id="edit_number_otp_2" class="text-info" disabled="true">Edit</button> </div>
        <div class="controls check_div_otp2">
            <div class="input-group ">
                {!! Form::number('mobile2', $row->mobile2 ?? Auth::user()->mobile2, [
                    'class' => 'form-control',
                    'id' => 'mobile2',
                    'minlength' => '11',
                    'maxlength' => '11',
                    'data-validation-minlength-message' => 'Minimum 11 digit',
                    'data-validation-maxlength-message' => 'Maximum 11 digit',
                    'placeholder' => 'Enter mobile number (11 digit)',
                    'tabindex' => 20,
                    'autocomplete' => 'off',
                    Auth::user()->mobile2_is_verified == '1' ? 'readonly' : '',
                ]) !!}
                <div class="input-group-append cp">

                    <span style="@if (Auth::user()->mobile2_is_verified == '1') display: block; @else  display: none; @endif"
                        class="input-group-text " data-sl="2" data-url="{{ URL::to('check-otp') }}">Verified</span>

                    {{-- <span style="@if (Auth::user()->mobile2_is_verified == 0) display: block; @else  display: none;  @endif" class="input-group-text check_otp check_otp_add1" data-sl="2" data-url="{{URL::to('check-otp')}}">Add</span> --}}

                </div>
            </div>
            {!! $errors->first('mobile2', '<label class="help-block text-danger">:message</label>') !!}
        </div>
        <div class="controls verify_div_otp2">
            <div class="input-group">
                <input type="number" name="otp_2" class="form-control" autocomplete="off"
                    placeholder="Enter OTP (4 digits)" maxlength="4" id="otp_2" />
                <div class="input-group-append cp">
                    <span class="input-group-text verify_otp" data-url="{{ URL::to('verify-otp') }}"
                        data-sl="2">Verify</span>
                </div>
            </div>
            <div class="text-success mt-1 "><button type="button" class="check_otp text-success" id="resent_otp2"
                    data-sl="2" data-url="{{ URL::to('check-otp') }}" disabled="true" data-sl="2">Resent OTP
                </button> <span id="counter2"></span></div>
        </div>
        <label for="is_hide_mobile2"
            class="@if ($row != null) {{ $row->is_hide_mobile2 == '1' ? 'checked' : '' }} @endif">
            <input type="checkbox" name="is_hide_mobile2" value="1" id="is_hide_mobile2"
                @if ($row != null) {{ $row->is_hide_mobile2 == '1' ? 'checked' : '' }} @endif> Hide Phone
            Number
        </label>
        @if (Auth::user()->mobile2_is_verified == '1')
            <button type="button" class="text-primary btn btn-sm btn-default edit_mobile2">Edit</button>
        @endif
        <span class="error err_mobile2 text-info" style="display: none; display: block;"></span>
    </div>
</div>
<div class="row form-group {!! $errors->has('address') ? 'error' : '' !!}">
    <label class="col-sm-3 label-title">Address</label>
    <div class="col-sm-9">
        <div class="controls">
            {!! Form::text('address', $row->address ?? Auth::user()->address, [
                'class' => 'form-control',
                'data-validation-required-message' => 'This field is required',
                'placeholder' => 'Enter address',
                'minlength' => '5',
                'data-validation-minlength-message' => 'Minimum 5 characters',
                'maxlength' => '150',
                'data-validation-maxlength-message' => 'Maxlength 150 characters',
                'tabindex' => 20,
                'autocomplete' => 'off',
            ]) !!}
            {!! $errors->first('address', '<label class="help-block text-danger">:message</label>') !!}
        </div>
    </div>
</div>
<div class="row form-group" style="margin-bottom: 0px;">
    <div class="col-sm-3"></div>
    <div class="col-sm-9">
        <div class="controls">
            <div class="form-group form-check">
                <input type="checkbox" name="doorstep_delivery" class="form-check-input doorstep-modal"
                    id="doorstep" value="1">
                <label class="form-check-label" for="doorstep">Doorstep Delivery </label>
            </div>
        </div>
    </div>
</div>
<input type="hidden" class="doorstep_agree" value="{{ $row->doorstep_delivery ?? '0' }}">
{{-- @dd($row) --}}




<!-- Doorstep Modal -->
<div class="doorstep_modal modal fade" id="doorstepModal" tabindex="-1" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Doorstep Details</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body doorstep_content">
                <h1 class="heading--2eONR undefined title--2CEq5 header-main--3f5qf block--3v-Ow">Quick, safe and easy
                    - from OK2LIST to your doorstep! </h1>
                <p class="sub-main--gAGCF">Buy from our trusted members directly on OK2LIST without leaving your home.
                    Just click on Order Online to place an order, <br /> and the item will be delivered to your
                    doorstep. </p>
                <p class="sub-info--2uOFM">When you buy using Doorstep Delivery, you are covered by our <span
                        class="buyer-info--9IxTA">Buyer Protection</span> program. </p>
                <p class="sub-info--2uOFM">This means that if the delivered item is not as described in the ad, it will
                    be replaced for FREE! </p>
            </div>



            <div class="modal-footer">
                <button type="button" class="btn btn-site btn_not_agree" data-dismiss="modal"
                    style="padding: 7px 15px">Don't Want</button>
                <button type="button" class="btn btn-primary agree_btn" style="padding: 7px 15px">I want to make my
                    product doorstep</button>
            </div>
        </div>
    </div>
</div>

@push('custom_js')
    <script>
        $(document).ready(function() {
            closeModal()
            function closeModal() {
                var door = $('.doorstep_agree').val();
                if (door == 1) {
                    $('#doorstep').attr('checked', true);
                } else {
                    $('#doorstep').removeAttr('checked');

                }
            }
            $('.doorstep-modal').change(function() {
                if ($(this).is(':checked')) {
                    $('#doorstepModal').modal('show')
                }
            });

            $('.btn_not_agree').click(function() {
                $('#doorstep').removeAttr('checked');
            });
            $('.agree_btn').click(function() {
                $('.doorstep_agree').val(1);
                $('#doorstepModal').modal('hide')
            });

            $('#doorstepModal').on('hide.bs.modal', function() {
                closeModal();
            })
        });
    </script>
@endpush
