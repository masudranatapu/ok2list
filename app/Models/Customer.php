<?php

namespace App\Models;

use DB;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;

class Customer extends Model
{

    use Notifiable;
    public $timestamps      = false;
    // const CREATED_AT     = 'create_dttm';
    // const UPDATED_AT     = 'update_dttm';


      protected $table = 'ss_customers';


    protected $fillable = [
        'name', 'email', 'password','google_id','random_token',
    ];

    protected $hidden = [
        'password', 'remember_token',
    ];

    public function package(){
        return $this->hasOne('App\Models\Package', 'pk_no', 'package_id');
    }










}
