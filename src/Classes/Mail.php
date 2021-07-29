<?php

namespace App\Classes;

use Mailjet\Client;
use Mailjet\Resources;

class Mail
{

    public function send($to_email, $to_name, $subject, $content)
    {
        $api_key='92e4bfbcf8a288fa4667e6b747d1046d';
        $api_key_secret='ba2b674adb88e0b6b41a24d7d8fce51f';
        $mj = new Client($api_key, $api_key_secret, true, ['version' => 'v3.1']);
        $body = [
            'Messages' => [
                [
                    'From' => [
                        'Email' => "gboubs@hotmail.com",
                        'Name' => "samatakkay"
                    ],
                    'To' => [
                        [
                            'Email' => $to_email,
                            'Name' => $to_name
                        ]
                    ],
                    'TemplateID' => 3070209,
                    'TemplateLanguage' => true,
                    'Subject' => $subject,
                    'Variables' => [
                        "content" => $content
                    ]
                ]
            ]
        ];
        
        $response = $mj->post(Resources::$Email, ['body' => $body]);
        $response->success();        
    }
}