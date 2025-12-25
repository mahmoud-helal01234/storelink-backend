<?php

namespace App\Http\Traits;

trait NotificationTrait
{

      function sendNotification($data_send=array(),$users=array(),$app = "client"){
        if($app == "store"){
            $appId = "5f7b8f35-5f56-40c2-936c-762d6ed404f8";
            $token = "os_v2_app_l55y6nk7kzamfe3moyww5vae7brwrbbm7oue7mfnaateho3avayymylimraca5bvjkgu7b45jfugqezt6jpo2noro5o3vpohc2st6ei";
        }else if($app == "client"){
            $appId = "8a237384-f99a-4417-8fde-ccb2f27302b7";
            $token = "os_v2_app_rirxhbhztjcbpd66zszpe4ycw6cxnaqsdnuusk5jestenvly2ghnu3v7lqz5uvlg3dcqnqsi7chwwb3mj2eqahbio57fb3sdkjtbciy";
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

    function sendAdminNotification($data_send=array(),$users=array()){
        $content = 
        [
            "ar" => $data_send["message"],
            "en" => $data_send["message_en"]
        ];
        $headings= 
        [
            "ar" => $data_send["title"],
            "en" => $data_send["title_en"]
        ]; //<---- this will add heading
        $fields = array(
            'app_id' => '12ebe886-23dd-45af-8818-7482aa148691',
            'data' => $data_send,
            'isAndroid'=>true,
            'isIos'=>true,
            'content_available'=>true,
            'small_icon'    => 'ic_launcher-web',
            //'large_icon' =>"ic_launcher_round.png",
            'contents' => $content,
            'headings'=> $headings //<---- include it to request
        );

        if(empty($users))
        {
            $fields['included_segments']=array('All');
        }else
        {
            $fields['include_player_ids']=$users;
            // $fields['include_player_ids']=["9cc0ff38-2067-430e-b5df-5492591c719d"];
            // $fields['include_player_ids']=["db55ca8d-3123-4a65-9e92-b2e4567f36ce"];
        }

        $fields = json_encode($fields);
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, "https://api.onesignal.com/notifications");
        curl_setopt($ch, CURLOPT_HTTPHEADER, array(
            'Content-Type: application/json; charset=utf-8',
            'Authorization: key NTFiOThjY2YtODE2Ny00NjM1LWJjMDktNGQwYTJhNDJhNWZm'
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
}
