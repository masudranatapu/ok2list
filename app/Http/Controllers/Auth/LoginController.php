<?php

namespace App\Http\Controllers\Auth;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use App\User;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Support\Facades\Auth;
use Laravel\Socialite\Facades\Socialite;
use Illuminate\Support\Facades\Mail;
use App\Mail\WellComeMail;
use Carbon\Carbon;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;
    protected $redirectTo = RouteServiceProvider::HOME;


    public function __construct()
    {
        $this->middleware('guest')->except('logout');
        // $this->middleware('guest:customer')->except('logout');
        // $this->middleware('guest:admin')->except('logout');
    }

    public function showLoginForm()
    {

        return view('auth.login');
    }


    public function redirectTo()
    {
        if (request()->has('referer')) {
            if (request()->get('referer') == 'package') {
                if (request()->get('pakid')) {
                    // return redirect()->route('payment.gateway');
                    $this->redirectTo = '/payment/gateway?pakid=' . request()->get('pakid');
                }
            } else {

                $this->redirectTo = request()->get('referer');
            }
        }

        return $this->redirectTo ?? '/';

    }


    public function redirectToProvider()
    {
        return Socialite::driver('facebook')->redirect();
    }


    public function handleProviderCallback()
    {
        if (request()->get('error')) {

            return redirect()->to('/');
        }

        $getInfo = Socialite::driver('facebook')->user();

        $user = $this->createUser($getInfo);

        auth()->login($user);

        $user = Auth::user();

        $password = 'N/A';

        $setting = setting();

        $details = [
            'subject' => 'Welcome to '.' ' .$setting->website_title,
            'greeting' => 'Hi ' . $user->name . ',',
            'body' => 'Welcome to'.' ' .$setting->website_title,
            'email' => 'Your email is : ' . $user->email,
            'password' => 'Your Password is : ' . $password,
            'thanks' => 'Thank you and stay with '.' '. $setting->website_title,
            'actionText' => 'Click Here to Visit',
            'actionURL' => route('home'),
            'site_url' => route('home'),
            'site_name' => $setting->website_title,
            'copyright' => Carbon::now()->format('Y') . ' ' .$setting->copyright . ' ' . $setting->website_title . ' ' . 'All rights reserved.',
        ];

        Mail::to($user->email)->send(new WellComeMail($details));
        return redirect()->to('/');

    }


    public function createUser($getInfo)
    {
        $user = User::where('email', $getInfo->email)->first();
        if (!$user) {
            $user = User::create([
                'name' => $getInfo->name,
                'email' => $getInfo->email,
                'is_verified' => 1,
                //'provider' => $provider,
                //'provider_id' => $getInfo->id
            ]);
        }
        return $user;
    }

    public function redirectToGoogle()
    {
        return Socialite::driver('google')->redirect();
    }


    public function handleGoogleCallback()
    {
        try {
            $user = Socialite::driver('google')->user();

            $finduser = User::where('google_id', $user->id)->first();

            if ($finduser) {
                Auth::login($finduser);
                return redirect('/');
            } else {

                $newUser = User::create([
                    'name' => $user->name,
                    'email' => $user->email,
                    'google_id' => $user->id,
                    'is_verified' => 1,
                    'password' => encrypt('12345678')
                ]);

                Auth::login($newUser);

                return redirect('/');
            }

        } catch (Exception $e) {

            return redirect('/');
        }

    }
}
