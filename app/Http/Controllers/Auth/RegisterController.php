<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\Auth as ModelsAuth;
use App\Providers\RouteServiceProvider;
use App\User;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Notification;
use Illuminate\Support\Facades\Auth;
use Brian2694\Toastr\Facades\Toastr;
use App\Notifications\WellComeNotification;
use App\Payments;
use Carbon\Carbon;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\DB;
use App\Models\Customer;

class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers;

    /**
     * Where to redirect users after registration.
     *
     * @var string
     */
    protected $redirectTo = RouteServiceProvider::HOME;


    protected function redirectTo()
    {


        if (Auth::user()) {

            $user = Auth::user();

            $settings = DB::table('site_settings')->first();

            if($settings->email_verification == 0) {

                $user = Customer::where('id', $user->id)->first();
                $user->is_verified = 1;
                $user->update();

                Toastr::success('Welcome back to your account.', 'Success', ["positionClass" => "toast-top-right"]);
                return url('/dashboard-overview');

            }

            $password = Session::get('secret');

            $details = [
                'subject' => 'Welcome to Listorbuy.org',
                'greeting' => 'Hi ' . $user->name . ',',
                'body' => 'Welcome to Listorbuy.org',
                'email' => 'Your email is : ' . $user->email,
                'password' => 'Your Password is : ' . $password,
                'thanks' => 'Thank you for using Listorbuy.org',
                'actionText' => 'Click Here to Verify',
                'actionURL' => url('verify/user/' . $user->random_token),
                'user_id' => $user->id
            ];

             if (setting()->app_mode == "live") {
                //$user->notify(new WellComeNotification($details));
               // Notification::send($user, new WellComeNotification($details));

             }
        }
        $this->guard()->logout();

        //Toastr::success('Thanks for your Signup, Please Check Your mail and Verify', 'Success', ["positionClass" => "toast-top-right"]);
        Toastr::success('Thanks for your Signup, Login Please !!', 'Success', ["positionClass" => "toast-top-right"]);

        if (request()->input('referer') == null) {
            return url()->previous();
        } else {
            $draft_comm  = request()->get('draft_comm');
            Session::put('draft_comm', $draft_comm);
            return request()->get('referer');
        }
    }
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest');
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:ss_customers'],
            'password' => ['required', 'string', 'min:6'],
            'promotion' => ['nullable', 'integer'],
        ], [
            'email.unique' => 'This email already used',
        ]);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return \App\User
     */
    protected function create(array $data)
    {

        $packages = DB::table('ss_packages')->where('pk_no', 1)->first();

        Session::put('secret', $data['password']);

        $user  = User::create([
            'name'      => $data['name'],
            'email'     => $data['email'],
            'random_token' => Str::random(30),
            'password'  => Hash::make($data['password']),
            'package_id' => $packages->pk_no,
            'package_start_date' => Carbon::now(),
            'package_end_date' => Carbon::now()->addMonths(1),
        ]);

        $packageExpired = Carbon::now()->addMonths(1);

        Payments::create([
            'f_package_pk_no' => $packages->pk_no,
            'f_customer_pk_no' => $user->id,
            'status' => "Free",
            'add_limit' => $packages->ad_limit_in_montrh,
            'amount' => 0,
            'is_verified' => 1,
            'validated_on' => Carbon::now(),
            'created_by' => $user->id,
            'expired_on' => $packageExpired,
        ]);

        return $user;
    }
}
