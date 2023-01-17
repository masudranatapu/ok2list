<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Session;

class Language
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        // if (Session()->has('applocale')) {
        //     App::setLocale(Session()->get('applocale'));
        // }
        // else {
        //     App::setLocale('en');
        // }
        // return $next($request);
        
        if (session()->has('set_lang')) {
            app()->setLocale(session('set_lang'));
        } else {
            app()->setLocale(env('APP_DEFAULT_LANGUAGE'));
        }

        return $next($request);

    }
}
