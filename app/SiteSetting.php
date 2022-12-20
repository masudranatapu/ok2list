<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class SiteSetting extends Model
{
    //
    protected $fillable = [
        'website_title',
        'logo',
        'favicon',
        'meta_keyword',
        'meta_description',
        'website_email',
        'phone',
        'address',
        'map_address',
        'android_app_link',
        'ios_app_link',
        'facebook_link',
        'twitter_link',
        'instagram_link',
        'linkedin_link',
        'whatsapp_link',
        'youtube_link',
    ];
    
}
