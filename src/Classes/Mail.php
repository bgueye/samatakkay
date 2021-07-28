<?php

namespace App\Classes;

use Mailjet\Client;
use Mailjet\Resources;

class Mail
{

    public function send($to_email, $to_name, $subject, $content)
    {
        $mj = new Client(getenv('API_KEY'), getenv('API_KEY_SECRET'), true,['version' => 'v3.1']);
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