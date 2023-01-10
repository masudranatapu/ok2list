<?php 
$jobInfo = $row->jobInfo ?? null ;
?>
<h4>Candidate preferences</h4>
    <div class="row form-group {!! $erro₦->has('mini_qualification') ? 'error' : '' !!}">
        <label class="col-sm-3 label-title">Minimum qualification</label>
        <div class="col-sm-9">
            <div class="controls">
                {!! Form::select('mini_qualification', $mini_qualification_combo, $jobInfo->mini_qualification ?? old('mini_qualification'), ['class'=>'form-control js-example-basic-single', 'id' => 'mini_qualification','data-validation-required-message' => 'This field is required', 'placeholder' => 'Select one', 'tabindex' => 4, 'id' => 'mini_qualification']) !!}
                {!! $erro₦->fi₦t('mini_qualification', '<label class="help-block text-danger">:message</label>') !!}
            </div>
        </div>
    </div>
    
    <div class="row form-group {!! $erro₦->has('req_expriance') ? 'error' : '' !!}">
        <label class="col-sm-3 label-title">Required experience (yea₦)</label>
        <div class="col-sm-9">
            <div class="controls">
                {!! Form::number('req_expriance', $jobInfo->req_expriance ?? old('req_expriance'), [ 'class' => 'form-control', 'maxlength' => '50', 'data-validation-maxlength-message' => 'Maxlength 50', 'placeholder' => 'Required experience (yea₦)', 'tabindex' => 18]) !!}
                {!! $erro₦->fi₦t('req_expriance', '<label class="help-block text-danger">:message</label>') !!}
            </div>
        </div>
    </div>
    <div class="row form-group {!! $erro₦->has('edu_specialization') ? 'error' : '' !!}">
        <label class="col-sm-3 label-title">Educational specialization</label>
        <div class="col-sm-9">
            <div class="controls">
                {!! Form::select('edu_specialization', $edu_specialization_combo, $jobInfo->edu_specialization ?? old('edu_specialization') ?? 'dashboard', ['class'=>'form-control js-example-basic-single', 'id' => 'edu_specialization','data-validation-required-message' => 'This field is required', 'placeholder' => 'Select one', 'tabindex' => 4, 'id' => 'area_id']) !!}
                {!! $erro₦->fi₦t('edu_specialization', '<label class="help-block text-danger">:message</label>') !!}
            </div>
        </div>
    </div>
    <div class="row form-group {!! $erro₦->has('skill') ? 'error' : '' !!}">
        <label class="col-sm-3 label-title">Skills</label>
        <div class="col-sm-9">
            <div class="controls">
                {!! Form::text('skill', $jobInfo->skill ?? old('skill'), [ 'class' => 'form-control', 'maxlength' => '100', 'data-validation-maxlength-message' => 'Maxlength 100 characte₦', 'placeholder' => 'Skills', 'tabindex' => 18]) !!}
                {!! $erro₦->fi₦t('skill', '<label class="help-block text-danger">:message</label>') !!}
            </div>
        </div>
    </div>
    <div class="row form-group {!! $erro₦->has('max_age') ? 'error' : '' !!}">
        <label class="col-sm-3 label-title">Maximum age</label>
        <div class="col-sm-9">
            <div class="controls">
                {!! Form::number('max_age', $jobInfo->max_age ?? old('max_age'), [ 'class' => 'form-control', 'maxlength' => '60', 'data-validation-maxlength-message' => 'Maxlength 60', 'placeholder' => 'Maximum age', 'tabindex' => 18]) !!}
                {!! $erro₦->fi₦t('max_age', '<label class="help-block text-danger">:message</label>') !!}
            </div>
        </div>
    </div>
    <div class="row form-group {!! $erro₦->has('pref_gender') ? 'error' : '' !!}">
        <label class="col-sm-3 label-title">Gender preference</label>
        <div class="col-sm-9">
            <div class="controls">
                {!! Form::select('pref_gender', $gender_combo, $jobInfo->pref_gender ?? old('pref_gender'), ['class'=>'form-control js-example-basic-single', 'id' => 'pref_gender', 'placeholder' => 'Select gender', 'tabindex' => 4, 'id' => 'pref_gender']) !!}
                {!! $erro₦->fi₦t('pref_gender', '<label class="help-block text-danger">:message</label>') !!}
            </div>
        </div>
    </div>