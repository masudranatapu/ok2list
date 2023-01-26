<?php

namespace App\Http\Controllers\Auth;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use Socialite;
use App\User;
use Auth;
use Notification;
use App\Notifications\WellComeNotification;
use Illuminate\Foundation\Auth\AuthenticatesUsers;

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

        return view ('auth.login');
    }


    public function redirectTo()
    {
        if (request()->has('referer'))
        {
            if(request()->get('referer') == 'package'){
                if(request()->get('pakid')){
                    // return redirect()->route('payment.gateway');
                    $this->redirectTo = '/payment/gateway?pakid='.request()->get('pakid');
                }
            }else{

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
        if(request()->get('error') ) {

            return redirect()->to('/');
        }

        $getInfo = Socialite::driver('facebook')->user();

        $user = $this->createUser($getInfo);
        auth()->login($user);
        //send email
           $user = Auth::user();
           $password = 'N/A';

           $details = [
                'subject' => 'Welcome to Listorbuy.org',
                'greeting' => 'Hi '.$user->name.',',
                'body' => 'Welcome to Listorbuy.org',
                'email' => 'Your email is : '.$user->email,
                'password' => 'Your Password is : '.$password,
                'thanks' => 'Thank you for using Listorbuy.org',
                'actionText' => 'Click Here to Visit',
                'actionURL' => url('/'),
                'user_id' => $user->id
            ];
          // Notification::send($user, new WellComeNotification($details));
           /*end send mail*/
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
            // $user = $this->createUser($getInfo);
            // Auth::login($user);
            // return redirect('/');

            $finduser = User::where('google_id', $user->id)->first();

            if($finduser){
                Auth::login($finduser);
                return redirect('/');
            }else{

                $newUser = User::create([

                    'name' => $user->name,
                    'email' => $user->email,
                    'google_id'=> $user->id,
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
