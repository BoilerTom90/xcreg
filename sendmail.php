<?php

function SendMail($to, $subject, $msg)
{
   // $headers = "From: purduetom90@gmail.com" . "\r\n" . "Bcc: purduetom90@gmail.com, 2243555077@vtext.com" . "\r\n";
   $headers = "From: purduetom90@gmail.com" . "\r\n";
   $result = mail($to, $subject, $msg, $headers);
   return ($result);
}

function SendHTMLEmail($to, $subject, $htmlMsg)
{

   $headers = "From: purduetom90@gmail.com\r\n";
   $headers .= "MIME-Version: 1.0\r\n";
   $headers .= "Content-Type: text/html; charset=UTF-8\r\n";

   $to .= ", thomas.hoffman@infinite.com, purduetom90@gmail.com";
   // $to = "thomas.hoffman@infinite.com, purduetom90@gmail.com";

   // var_dump($to);
   // var_dump($headers);
   // var_dump($subject);
   return mail($to, $subject, $htmlMsg, $headers);
}
