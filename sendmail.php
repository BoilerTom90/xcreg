<?php

function SendMail($to, $subject, $msg)
{
   // $headers = "From: purduetom90@gmail.com" . "\r\n" . "Bcc: purduetom90@gmail.com, 2243555077@vtext.com" . "\r\n";
   $headers = "From: purduetom90@gmail.com" . "\r\n";
   $result = mail($to,$subject,$msg,$headers);
   return($result);
}
?>