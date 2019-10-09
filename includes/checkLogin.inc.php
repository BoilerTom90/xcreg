<?php

require_once('classes/PHPSession.php');
PHPSession::Instance()->StartSession();

if (!PHPSession::Instance()->GetSessionVariable ('logged_on'))
{
   PHPSession::Instance()->EndSession();
	$last_error = "<span style=\"color:red\">Please Logon</span>";
	header("location: index.php?status_msg=$last_error");
   exit;
} 

$session_expire_time = PHPSession::Instance()->GetSessionVariable('session_expire_time');
if ($session_expire_time < time()) {
   PHPSession::Instance()->EndSession();
	$last_error = "<span style=\"color:red\">Your session has expired. Please Logon</span>";
	header("location: index.php?status_msg=$last_error");
   exit;
}

PHPSession::Instance()->SetSessionVariable('session_expire_time', time() + 30*60);
?>
