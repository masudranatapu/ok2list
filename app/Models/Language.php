<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Language extends Model
{
    //
    protected $table = 'languages';
    
    protected $fillable = [
        'name',
        'code',
        'icon',
        'direction',
        'created_at',
        'updated_at',
    ];

}
