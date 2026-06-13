<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;

class ApiToken
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {

        $lang = $request->header('Accept-Language') ?? 'en';
        
        $lang = strtolower(substr(trim(explode(',', explode(';', $lang)[0])[0]), 0, 2));

        $lang =  !in_array($lang, ['en', 'ar']) ? 'en': $lang;
        
        $request->headers->set('Accept-Language',$lang);
        
        
        App::setLocale($lang); // Set the application locale
        session(['locale' => $lang]); // Store locale in session for persistence
     

        // if($request->header('api-token') != 'elraghwa-elnakya212')
        //     return response()->json(null,404);

        return $next($request);
    }
}
