<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Auth extends Model
{
    protected $table = 'ss_customers';
    protected $fillable = [
            'username','email','mobile_no',' password','gender','can_login','user_type'
    ];
}
