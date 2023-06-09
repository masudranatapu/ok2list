<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Currency extends Model
{
    //

    protected $table = 'currencies';
    
    protected $fillable = [
        'name',
        'code',
        'symbol',
        'symbol_position',
        'conversion_rate',
        'created_at',
        'updated_at',
    ];
    
}
