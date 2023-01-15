<?php
use App\Models\AdminUser;
use App\Models\Auth as CustomAuth;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\App;
use Stichoza\GoogleTranslate\GoogleTranslate;

if (!function_exists('getAuthId')) {
    function getAuthId()
    {
        if (Auth::user()) {
            $user_session = Auth::user();

            return $user_session->id;
        }
    }
}

if (!function_exists('setting')) {
    function setting()
    {
        return $setting = DB::table('site_settings')->first();
    }
}


if (!function_exists('getDayDiff')) {
    function getDayDiff() {
        // Calculating the difference in timestamps
        $date2 = $date1 = null;
        $diff = strtotime($date2) - strtotime($date1);

        // 1 day = 24 hours
        // 24 * 60 * 60 = 86400 seconds
        return abs(round($diff / 86400));
    }
}

if (!function_exists('userRolePermissionArray')) {
    function userRolePermissionArray() {
        $roles = DB::table('role_permission as rp')
            ->select('rp.permissions')
            ->join('auth_role as ar','ar.role_id', '=', 'rp.role_id')
            ->where('ar.auth_id', getAuthId())
            ->first();
        if (! empty($roles)) {
            return explode(",", $roles->permissions);
        }

        return [];
    }
}

if (!function_exists('hasRoleToThisUser')) {
    /**
     * Helper to return the current login user id
     *
     * @return mixed
     */
    function hasRoleToThisUser($user_id)
    {
        return DB::table('auth_role')->where('auth_id', $user_id)->value('role_id');
    }
}

if (!function_exists('hasAccessAbility')) {
    function hasAccessAbility($permission_slug, $permission_array) {
        $user_id = getAuthId();
        if ($user_id == 1) return true;

        $role_id = hasRoleToThisUser($user_id);
        if ($role_id == 1) return true;

        if (! empty($permission_slug) && ! empty($permission_array)) {
            if (in_array($permission_slug, $permission_array)) {
                return true;
            }
        }

        return false;
    }
}

/*
 *PHP Array into a PHP Object
 */
if (!function_exists('array_to_object')) {
    function array_to_object($array) {
        return (object) $array;
    }
}

/*
 *PHP Object into a PHP Array
 */
if (!function_exists('object_to_array')) {
    function object_to_array($object) {
        return (array) $object;
    }
}
/*Print+Exit = print */
if (!function_exists('prixt')) {

    function prixt($data, $exit = 0)
    {
        echo "<pre>";
        print_r($data);
        if($exit == 1)
        {
            exit;
        }
    }
}


if (!function_exists('getProfile')) {

    function getProfile()
    {
        return DB::table('auths')->where('id', Auth::user()->id)->first();
    }
}



/*Print Validation Error List*/
if (!function_exists('vError')) {

    function vError($errors)
    {
        if ($errors->any()){
            foreach ($errors->all() as $error){
                echo '<li class="text-danger">'. $error .'</li>';
            }
        }
        else {
            echo 'Not found any validation error';
        }

    }
}

if (!function_exists('get_error_response')) {

    function get_error_response($code, $reason, $errors = [],  $error_as_string = '', $description = '')
    {
        if ($error_as_string == '') {
            $error_as_string = $reason;
        }

        if ($description == '') {
            $description = $reason;
        }

        return [
            'code'          => $code,
            'errors'        => $errors,
            'error_as_string'  => $error_as_string,
            'reason'        => $reason,
            'description'   => $description,
            'error_code'    => $code,
            'link'          => ''
        ];
    }
}


if (!function_exists('fileExit')) {
    function fileExit($path) {
        if($path){
            $ppath = public_path($path);
            if(file_exists($ppath)){
              return asset($path);
            } else {
                return asset('assets/images/no-photo.png');
           }
        }else{
            return asset('assets/images/no-photo.png');
        }

    }
}

if (!function_exists('webAdList')) {
    function webAdList() {
        return $list = [
            'about_us_page1'            => 'About us page 1',
            'about_us_page2'            => 'About us page 2',
            'contact_us_page1'          => 'Contact us page 1',
            'contact_us_page2'          => 'Contact us page 2',
            'detail_page1'              => 'Detail page 1',
            'detail_page2'              => 'Detail page 2',
            'detail_page3'              => 'Detail page 3',
            'home_page1'                => 'Home page 1',
            'home_page2'                => 'Home page 2',
            'home_page3'                => 'Home page 3',
            'faq_page1'                 => 'FAQ page 1',
            'faq_page2'                 => 'FAQ page 2',
            'how_to_sell_fast_page1'    => 'How to sell fast page 1',
            'how_to_sell_fast_page2'    => 'How to sell fast page 2',
            'list_page1'                => 'List page 1',
            'list_page2'                => 'List page 2',
            'list_page3'                => 'List page 3',
            'membership_page1'          => 'Membership page 1',
            'membership_page2'          => 'Membership page 2',
            'privacy_policy_page1'      => 'Privacy policy page 1',
            'privacy_policy_page2'      => 'Privacy policy page 2',
            'promote_your_ad_page1'     => 'Promote your ad page 1',
            'promote_your_ad_page2'     => 'Promote your ad page 2',
            'promotions_page1'          => 'Promotions page 1',
            'promotions_page2'          => 'Promotions page 2',
            'site_map_page1'            => 'Site map page 1',
            'site_map_page2'            => 'Site map page 2',
            'tc_page1'                  => 'Terms and Conditions page 1',
            'tc_page2'                  => 'Terms and Conditions page 2',
            'tc_page3'                  => 'Terms and Conditions page 3',



        ];
        // FAQ

    }
}

function envReplace($name, $value)
{
    $path = base_path('.env');
    if (file_exists($path)) {
        file_put_contents($path, str_replace(
            $name . '=' . env($name),
            $name . '=' . $value,
            file_get_contents($path)
        ));
    }

    if (file_exists(App::getCachedConfigPath())) {
        Artisan::call("config:cache");
    }
    
}

if (!function_exists('autoTransLation')) {

    function autoTransLation($lang, $text)
    {
        $tr = new GoogleTranslate($lang);
        $afterTrans = $tr->translate($text);
        return $afterTrans;
    }
    
}
