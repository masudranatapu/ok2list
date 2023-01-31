<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;

class Auth extends Model
{
    use Notifiable;

    protected $table = 'ss_customers';
    protected $fillable = [
            'username','email','mobile_no',' password','gender','can_login','user_type'
    ];
}
