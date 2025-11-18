<?php

namespace App\Http\Middleware;

use Closure;
use App\Http\Traits\ResponsesTrait;
use Tymon\JWTAuth\Http\Middleware\BaseMiddleware;
use App\Http\Traits\LoggedInUserTrait;

class IsProfileCompleted
{
    use ResponsesTrait, LoggedInUserTrait;
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next, ...$roles )
    {



        $user = $this->getLoggedInUser();
        if($user->is_profile_completed != 1)
            return $this->apiResponse(null,false,"your profile is not completed ",403);
    

        return $next($request);
    }
}
