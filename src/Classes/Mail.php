<?php

namespace App\Classes;

use Mailjet\Client;
use Mailjet\Resources;

class Mail
{

    //private $api_key = 'a77f1c12c6dcbf48da3ea0a601523d8f'; pour le compte créé avec gmail
    //private $api_key_secret = '3b333e35eb191f6073b01e1d9ec573e8'; pour le compte créé avec gmail
    
    private $api_key = '92e4bfbcf8a288fa4667e6b747d1046d';
    private $api_key_secret = 'ba2b674adb88e0b6b41a24d7d8fce51f';

    public function send($to_email, $to_name, $subject, $content)
    {
        $mj = new Client($this->api_key, $this->api_key_secret, true,['version' => 'v3.1']);
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
        
        
        // $body = [
        //     'Messages' => [
        //         [
        //             'From' => [
        //                 'Email' => "gboubs@hotmail.com",
        //                 'Name' => "Samatakkay"
        //             ],
        //             'To' => [
        //                 [
        //                     'Email' => $to_email,
        //                     'Name' => $to_name
        //                 ]
        //             ],
        //             //'TemplateID' => 3069286,    avec le template du compte créé avec gmail
        //             'TemplateID' => 3070209,
        //             'TemplateLanguage' => true,
        //             'Subject' => $subject,
        //             'Variables' => [
        //                 'content' => $content 
        //             ]
        //         ]
        //     ]
        // ];
        $response = $mj->post(Resources::$Email, ['body' => $body]);
        $response->success();        
    }
}