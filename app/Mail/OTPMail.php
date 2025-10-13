<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class OTPMail extends Mailable implements ShouldQueue
{
    use Queueable, SerializesModels;

    public $otp;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($otp)
    {
        $this->otp = $otp;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->subject('OTP for storelink')
            ->html("
                        <p>Hello,</p>
                        <p>Your One-Time Password (OTP) is: <strong>{$this->otp}</strong></p>
                        <p>Please use this code to complete your verification.</p>
                        <p>Thank you!</p>
                    ");
    }
}
