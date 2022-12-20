<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class AdsRequest extends FormRequest
{
    public function rules()
    {
        return [
            'pk_no' => 'required',
            'name' => 'required',
            'is_active' =>'required' ,
            // 'image' => 'required',
        ];
    }
}

