<?php

namespace App\Http\Middleware;

use Closure;
use App\Services\Access;
use Redirect;
use Session;

class CheckPermission
{
    public function handle($request, Closure $next, $permission = null)
    {

        $access = new Access();

        if ($access->can($permission)) {
             return $next($request);
        }

        return redirect()->back()->with('flashMessageAlert','You do not have the permission to access the page !');
    }
}
