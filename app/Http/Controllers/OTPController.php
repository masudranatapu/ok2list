<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use Auth;
use App\User;
use Exception;
use NotifyLk\Api\SmsApi;

class OTPController extends Controller
{

    public function __construct()
    {
       $this->middleware('auth');
    }


    public function checkOTP($mobile,$number_sl)
    {
        $response = false ;
        $otp_code = rand ( 1000 , 9999 );

        if (strlen($mobile) != 11 ) { $response = false ; }

        DB::beginTransaction();

        try {

            // $username = "ronymia";
            // $hash = "7ab63de834125a4428bf1d91c8eb3367";
            // $numbers = $mobile; //Recipient Phone Number multiple number must be separated by comma
            // $message = "Bangalio.com ভেরিফিকেশন কোডটি হলো ".$otp_code.". এটি ৫ মিনিট পর্যন্ত কার্যকর থাকবে।";


            // $params = array('app'=>'ws', 'u'=>$username, 'h'=>$hash, 'op'=>'pv', 'unicode'=>'1','to'=>$numbers, 'msg'=>$message);

            // $ch = curl_init();
            // curl_setopt($ch, CURLOPT_URL, "http://alphasms.biz/index.php?".http_build_query($params, "", "&"));
            // curl_setopt($ch, CURLOPT_HTTPHEADER, array("Content-Type:application/json", "Accept:application/json"));
            // curl_setopt($ch, CURLOPT_FOLLOWLOCATION, TRUE);
            // curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);

            // $response = curl_exec($ch);
            // curl_close ($ch);

        $api_instance = new SmsApi();
        $user_id = "23165"; // string | API User ID - Can be found in your settings page.
        $api_key = "MSIRt9m5uyB3oZX3zA3f"; // string | API Key - Can be found in your settings page.
        $message = "Welcome Your Confirmation Otp Code Is".$otp_code.". Powered by, Gogoads"; // string | Text of the message. 320 chars max.
        $to = $mobile; // string | Number to send the SMS. Better to use 9471XXXXXXX format.
        $sender_id = "NotifyDEMO"; // string | This is the from name recipient will see as the sender of the SMS. Use \\\"NotifyDemo\\\" if you have not ordered your own sender ID yet.
        $contact_fname = ""; // string | Contact First Name - This will be used while saving the phone number in your Notify contacts (optional).
        $contact_lname = ""; // string | Contact Last Name - This will be used while saving the phone number in your Notify contacts (optional).
        $contact_email = ""; // string | Contact Email Address - This will be used while saving the phone number in your Notify contacts (optional).
        $contact_address = ""; // string | Contact Physical Address - This will be used while saving the phone number in your Notify contacts (optional).
        $contact_group = 0; // int | A group ID to associate the saving contact with (optional).
        $type = null; // string | Message type. Provide as unicode to support unicode (optional).

        try {
            $api_instance->sendSMS($user_id, $api_key, $message, $to, $sender_id, $contact_fname, $contact_lname, $contact_email, $contact_address, $contact_group, $type);
        } catch (Exception $e) {
            echo 'Exception when calling SmsApi->sendSMS: ', $e->getMessage(), PHP_EOL;
        }



            if ($number_sl == 1) {
                User::where('id', Auth::user()->id)->update(['mobile1' => $mobile, 'mobile1_otp_code' => $otp_code, 'mobile1_is_verified' => 0]);
            }

            if ($number_sl == 2) {
                User::where('id', Auth::user()->id)->update(['mobile2' => $mobile, 'mobile2_otp_code' => $otp_code, 'mobile2_is_verified' => 0]);
            }

            $response = true ;

        } catch (\Exception $e) {
            DB::rollback();
            $response = false ;
        }

        DB::commit();

        return response()->json($otp_code);
    }


    public function verifyOTP($otp,$number_sl)
    {
        $response = false ;
        $otp_code = rand ( 1000 , 9999 );

        if (strlen($otp) != 4 )
            {
                $response = false ;
                return response()->json($response);
            }


        DB::beginTransaction();

        try {

            if ($number_sl == 1) {
                $user = User::where('id', Auth::user()->id)->where(['mobile1_otp_code' => $otp])->whereRaw('mobile1_otp_code_extime > NOW()')->first();
                if (!empty($user)) {
                    User::where('id', Auth::user()->id)->update(['mobile1_is_verified' => 1]);
                    $response = true ;
                }
            }

            if ($number_sl == 2) {
                $user = User::where('id', Auth::user()->id)->where(['mobile2_otp_code' => $otp])->whereRaw('mobile2_otp_code_extime > NOW()')->first();
                if (!empty($user)) {
                    User::where('id', Auth::user()->id)->update(['mobile2_is_verified' => 1]);
                    $response = true ;
                }
            }



        } catch (\Exception $e) {
            DB::rollback();
            $response = false ;
        }

        DB::commit();

        return response()->json($response);
    }






    public function getArea($location_id,$type)
    {
        $response = '<option value="">No data found</option>';

        if ($type == 'city') {
            $data = Area::where('city_pk_no',$location_id)->get();
        }elseif($type == 'division'){
            $data = Area::where('division_pk_no',$location_id)->get();
        }else{
            $data = null;
        }
        if ($data && count($data) > 0 ) {
            $response = '';
          foreach ($data as $key => $value) {
            $response .= '<option value="'.$value->pk_no.'">'.$value->name.'</option>';
          }
        }



        return response()->json($response);
    }







}











