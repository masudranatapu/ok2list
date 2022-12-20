<?php

namespace App\Http\Controllers\Admin;

use App\Http\Requests\Admin\LoginRequest;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use Auth;
use Illuminate\Contracts\Auth\Guard;
use App\Admin;
use Illuminate\Http\Request;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;

use Session;

class AdminAuthController extends Controller
{
    /**
     * the model instance
     * @var Admin
     */
    protected $user;
    /**
     * The Guard implementation.
     *
     * @var Authenticator
     */
    protected $auth;

    /**
     * Create a new authentication controller instance.
     *
     * @param  Authenticator  $auth
     * @return void
     */

    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function __construct(Guard $auth, Admin $user)
    {
        $this->user = $user;
        $this->auth = $auth;

        // $this->middleware('guest');
        // $this->middleware('guest:admin');
        // $this->middleware('guest:admin')->except('admin.logout');
        // $this->middleware('guest:blogger');
    }

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
      public function getLogin()
      {

          if (! $this->auth->check()) {
              return view('admin.auth.login');
          } else {
              return redirect()->route('admin.dashboard');
          }
      }

      /**
       * Show the form for creating a new resource.
       *
       * @return Response
       */
    public function getLogout() {

        Session::flush();
        $this->auth->logout();

        return redirect()->route('admin.login');
    }

    public function postLogin(LoginRequest $request)
    {
        $email = $request->input('email');
        $password = $request->input('password');

        $user = Admin::where(['email' => $email])->where(function ($query) {
            $query->where('user_type', 0);
        })->first();
// dd($user);
        if ($this->hasExist($user)) {
            // dd($this->auth);
            if (Auth::guard('admin')->attempt(['email' => $request->email, 'password' => $request->password], $request->get('remember'))) {

            // if ($this->auth->attempt(['email' => $email, 'password' => $password, 'user_type' => 0 ], $request->has('remember'))){
                //  $admin_user = AdminUser::where('member_id', get_logged_user_id())->first();
                //   session(['profile_pic' => $admin_user->profile_pic]);
                return redirect()->route('admin.dashboard');
            }

        }

        return redirect()->back()->withErrors([
            'email' => 'The credentials you entered did not match our records. Try again?',
        ]);

    }

    private function hasExist($user_array){
        if (! empty($user_array )) return true;

        return false;
    }

    public function getAgentLockScreen()
    {
        if (! $this->auth->check()) return redirect('/login');
        else if (Session::has('email')) return view('agent/auth/lock-screen')->withUser([
            'email' => Session::get('email'),
            'profile_pic' => Session::get('profile_pic'),
            'name' => get_logged_user_name(),
        ]);
        else return redirect('/');
    }

    public function getLockScreen()
    {
        if (! $this->auth->check()) return redirect('/admin/login');
        else if (Session::has('email')) return view('admin/auth/lock-screen')->withUser([
            'email' => Session::get('email'),
            'profile_pic' => Session::get('profile_pic'),
            'name' => get_logged_user_name(),
        ]);
        else return redirect('admin');
    }

    public function postLockScreen(LoginRequest $request)
    {
        $email = $request->input('email');
        if ($email == '') return redirect('/login');
        $password = $request->input('password');

        $user = Member::where(['email' => $email])->where(function ($query) {
            $query->where('user_type', 0)
                ->orWhere('user_type', 4);
        })->first();

        if ($this->hasExist($user)) {
            if ($this->auth->attempt(['email' => $email, 'password' => $password, 'user_type' => $user->user_type], $request->has('remember'))) {
                session([
                    'email'         => $email,
                    'last_active'   => date('Y-m-d H:i:s'),
                    'user_type'     => $user->user_type,
                    'has_company'   => 0
                ]);

                if ($user->user_type == '0') {
                    $admin_user = AdminUser::where('member_id', get_logged_user_id())->first();
                    session(['profile_pic' => $admin_user->profile_pic]);
                    return redirect('/admin');

                } else if ($user->user_type == '4') {
                    $agent_user = Agent::where('member_id', get_logged_user_id())->first();
                    session(['profile_pic' => $agent_user->profile_pic]);
                    session(['has_company' => $agent_user->has_company]);
                    return redirect('/');
                }
            }
        }

        return redirect()->back()->withErrors([
            'email' => 'The credentials you entered did not match our records. Try again?',
        ]);
    }
}
