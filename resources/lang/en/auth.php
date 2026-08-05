<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Authentication Language Lines
    |--------------------------------------------------------------------------
    |
    | The following language lines are used during authentication for various
    | messages that we need to display to the user. You are free to modify
    | these language lines according to your application's requirements.
    |
    */

    'authorization' =>[
        'not_authorized' => 'You are not authorized to perform this action.',
        'not_belong_to_you' => 'This is not belong to you.',
    ],
    'email_not_active' => 'Success! we are activating your account',

    "email_registered_as_store" => "This email is already registered as a store",
    "email_registered_as_client" => "This email is already registered as a client",
    
    'failed' => 'These credentials do not match our records.',
    //'password' => 'The provided password is incorrect.',
    'throttle' => 'Too many login attempts. Please try again in :seconds seconds.',

];
