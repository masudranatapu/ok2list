<?php

namespace App\Http\Requests\Admin;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Hash;
use Validator;

class CustomerRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {

      
        if(request()->pk_no){
            $rules = [
                'name' => 'required|max:255',
                
            ];
        }else{
           $rules = [
                     'name'     => 'required|max:255',
                     'email'    => 'required|email|max:255|unique:users',
                     'password' => 'required|min:6'
                 ]; 
        }

      return $rules;
    }

    public function messages()
    {
        return [
            'name.required' => 'Please enter your customer name !'
            
        ];
    }
}
