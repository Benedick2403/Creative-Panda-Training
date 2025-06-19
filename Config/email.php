<?php
class EmailConfig {
public $gmail = array(
    'host' => 'ssl://smtp.gmail.com',
    'port' => 465,
    'username' => 'yourgmail@gmail.com',
    'password' => 'your_app_password', // generated from Google App Passwords
    'transport' => 'Smtp',
    'from' => array('yourgmail@gmail.com' => 'Your App Name')
);
}