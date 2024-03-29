<?php

require_once 'includes/checkLogin.inc.php'; // session is started in here
require_once 'includes/event_id.inc.php'; //
require_once 'classes/DBAccess.php';

// the expected information from the form is in the $_REQUEST variable
//
// var_dump($_REQUEST);
// exit;

$school_id = $_REQUEST['school_id'];
$event_id = PHPSession::Instance()->GetSessionVariable('event_id');
$first_name = trim(strtoupper($_REQUEST['first_name']));
$last_name = trim(strtoupper($_REQUEST['last_name']));
$grade = $_REQUEST['grade'];
$sex = trim(strtoupper($_REQUEST['sex']));
$race_id = $_REQUEST['race_id'];
$qual_time = '00:00:00'; // $_REQUEST['qual_time'];

// Make sure the school name only has the allowed characters:
// A-Z, a-z, 0-9, ., -, space
$pattern = "#^[A-Za-z0-9 .\-']+$#";
$result = preg_match($pattern, $first_name);
if (!$result) {
    $sts = "First Name contains invalid characters. Only alphanumeric, space, period, apostrophe, and - are allowed.";
    header("location: RunnersMain.php?status_msg=$sts");
    exit;
}

$result = preg_match($pattern, $last_name);
if (!$result) {
    $sts = "Last Name contains invalid characters. Only alphanumeric, space, period, apostrophe, and - are allowed";
    header("location: RunnersMain.php?status_msg=$sts");
    exit;
}

$runnersObj = new RunnersTable();

// TEMP FIX:
// We need to limit the number of runners per school per race to 8.
// Ideally, this limit should be configurable per race per event, but that's a
// bigger impact which I don't have time for right now.
$temp = $runnersObj->ReadByEventRaceAndSchool($event_id, $race_id, $school_id);
$runnerCount = empty($temp) ? 0 : count($temp);
if ($runnerCount >= 8) {
    $sts = "You have met your limit of 8 runners for this race!";
    $alert_category = "alert-danger";
} else {
    $nextID = $runnersObj->MaxID() + 1;
    $num_rows_affected = $runnersObj->Insert($nextID, $school_id, $event_id, $race_id, $sex, $grade, $first_name, $last_name, $qual_time);
    if ($num_rows_affected >= 0) {
        $sts = "Runner successfully added.";
        $alert_category = 'alert-success';
    } else {
        $sts = "Runner NOT added: " . $runnersObj->LastError();
        $alert_category = "alert-danger";
    }
}

header("location: RunnersMain.php?status_msg=$sts&alert_category=$alert_category");
exit;
