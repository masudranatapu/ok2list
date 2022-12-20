<?php

namespace App\Models;

use DB;
use App\Traits\RepoResponse;
use Illuminate\Support\Facades\Auth;
use Intervention\Image\Facades\Image;
use Illuminate\Database\Eloquent\Model;

class AdDetails extends Model
{
    use RepoResponse;

    protected $table        = 'prd_ad_details';
    protected $primaryKey   = 'pk_no';

    protected $fillable = [
        'pk_no',
        'name',
        'is_active',
        'photo',
        'path',
        'link',
    ];
}
