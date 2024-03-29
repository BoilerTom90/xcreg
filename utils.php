<?php
require_once('sendmail.php');
require_once('classes/Constants.php');

function EmailAdmin($subject, $message) {
   SendMail("purduetom90@gmail.com", $subject, $message);
}

function NotifyAdmin($message) {
   SendMail("purduetom90@gmail.com", "XCREG", $message);
}


// Events are editable if the user is an Admin or the Event is in the Open State
function CanEditRunners($eventRegStatus) {
   $userRole = PHPSession::Instance()->GetSessionVariable('role') ? 
               PHPSession::Instance()->GetSessionVariable('role') : UserRoles::NonAdmin;
   if ($eventRegStatus == EventRegStatus::RegOpen) {
      return true;
   }

   if ($userRole == UserRoles::Admin) {
      return true;
   }
   return false;
}

function hhmmssToSeconds($t) {
   list($hh, $mm, $ss) = explode(":", $t);
   return (($ss) + ($mm * 60) + ($hh * 3600));
}

function CompareHHMMSSTimes($t1, $t2) {
   $t1Sec = hhmmssToSeconds($t1);
   $t2Sec = hhmmssToSeconds($t2);
   return $t2Sec - $t1Sec;
}
