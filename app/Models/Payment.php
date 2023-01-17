<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Payment extends Model
{
    //
    protected $table = 'payments';
    
    protected $fillable = [
        'name',
        'slug',
        'image',
        'public_key',
        'secret_key',
        'live_mood',
        'status',
        'created_at',
        'updated_at',
    ];
}
