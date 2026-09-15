<?php

namespace App\Http\Traits;

trait NotificationTrait
{

      function sendNotification($data_send=array(),$users=array(),$app = "client"){
        if ($app == "store") { 
            $appId = env('STORE_OS_APP_ID');
            $token = env('STORE_OS_TOKEN'); 
        } elseif ($app == "client") { 
            $appId = env('CLIENT_OS_APP_ID'); 
            $token = env('CLIENT_OS_TOKEN'); 
        } else { 
            return response()->json([ 'error' => 'Invalid app type' ], 400); 
        }
        
        $content =
        [
            "ar" => $data_send["body_ar"],
            "en" => $data_send["body_en"]
        ];
        
        $headings=
        [
            "ar" => $data_send["title_ar"],
            "en" => $data_send["title_en"]
        ]; 
        

        $fields = array(
            'app_id' => $appId,
            'data' => $data_send,
            'isAndroid' => true,
            'isIos' => false, // set to true after ios creation
            'content_available' => true,
            'small_icon'    => 'ic_launcher-web',
            //'large_icon' =>"ic_launcher_round.png",
            'contents' => $content,
            'headings'=> $headings
        );
        
        if(empty($users))
        {
            $fields['included_segments']=array('All');
        } else
        {
            $fields['include_player_ids'] = $users;
        }

        $fields = json_encode($fields);
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, "https://api.onesignal.com/notifications");
        curl_setopt($ch, CURLOPT_HTTPHEADER, array(
            'Content-Type: application/json; charset=utf-8',
            'Authorization: key '. $token
        ));
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
        curl_setopt($ch, CURLOPT_HEADER, FALSE);
        curl_setopt($ch, CURLOPT_POST, TRUE);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $fields);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);

        $response = curl_exec($ch);
                // var_dump($response);

        curl_close($ch);

        return $response;
    }

    // function sendAdminNotification($data_send=array(),$users=array()){
    //     $content = 
    //     [
    //         "ar" => $data_send["message"],
    //         "en" => $data_send["message_en"]
    //     ];
    //     $headings= 
    //     [
    //         "ar" => $data_send["title"],
    //         "en" => $data_send["title_en"]
    //     ]; //<---- this will add heading
    //     $fields = array(
    //         'app_id' => '12ebe886-23dd-45af-8818-7482aa148691',
    //         'data' => $data_send,
    //         'isAndroid'=>true,
    //         'isIos'=>true,
    //         'content_available'=>true,
    //         'small_icon'    => 'ic_launcher-web',
    //         //'large_icon' =>"ic_launcher_round.png",
    //         'contents' => $content,
    //         'headings'=> $headings //<---- include it to request
    //     );

    //     if(empty($users))
    //     {
    //         $fields['included_segments']=array('All');
    //     }else
    //     {
    //         $fields['include_player_ids']=$users;
    //         // $fields['include_player_ids']=["9cc0ff38-2067-430e-b5df-5492591c719d"];
    //         // $fields['include_player_ids']=["db55ca8d-3123-4a65-9e92-b2e4567f36ce"];
    //     }

    //     $fields = json_encode($fields);
    //     $ch = curl_init();
    //     curl_setopt($ch, CURLOPT_URL, "https://api.onesignal.com/notifications");
    //     curl_setopt($ch, CURLOPT_HTTPHEADER, array(
    //         'Content-Type: application/json; charset=utf-8',
    //         'Authorization: key NTFiOThjY2YtODE2Ny00NjM1LWJjMDktNGQwYTJhNDJhNWZm'
    //     ));
    //     curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
    //     curl_setopt($ch, CURLOPT_HEADER, FALSE);
    //     curl_setopt($ch, CURLOPT_POST, TRUE);
    //     curl_setopt($ch, CURLOPT_POSTFIELDS, $fields);
    //     curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);

    //     $response = curl_exec($ch);
    //     var_dump($response);
    //     curl_close($ch);

    //     return $response;
    // }
}
