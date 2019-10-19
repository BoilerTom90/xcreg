<?php

function SendMail($to, $subject, $msg)
{
   // $headers = "From: purduetom90@gmail.com" . "\r\n" . "Bcc: purduetom90@gmail.com, 2243555077@vtext.com" . "\r\n";
   $headers = "From: purduetom90@gmail.com" . "\r\n";
   $result = mail($to, $subject, $msg, $headers);
   return ($result);
}

function SendHTMLEmail($toArray, $subject, $htmlMsg)
{
   $headers = "From: purduetom90@gmail.com\r\n";
   $headers .= "cc: purduetom90@gmail.com\r\n";
   $headers .= "MIME-Version: 1.0\r\n";
   $headers .= "Content-Type: text/html; charset=UTF-8\r\n";

   // fatcow allows at most 50 recipients per email when sending via a script.
   // for now, just send one email per recipient.

   // var_dump($to);
   // var_dump($headers);
   // var_dump($subject);

   foreach ($toArray as $key => $to) {
      mail($to, $subject, $htmlMsg, $headers);
   }
}
