<?php 

require_once('includes/checkLogin.inc.php'); // session is started in here
require_once('includes/adminusercheck.inc.php');
require_once('includes/status_msg.inc.php');
require_once('includes/event_id.inc.php');
require_once('classes/Constants.php');
require_once('classes/DBAccess.php');
require_once('classes/StartingBoxes.php');

?>


<?php

if (!isset($_REQUEST) || !isset($_REQUEST['race_id']) || !isset($_REQUEST['event_id'])) {
   $sts = "Error! Invalid navigation to page.";
   header("location: RacesMainForm.php?status_msg=$sts&alert_category=alert-danger");
   exit;
}

$event_id = $_REQUEST['event_id'];
$race_id = $_REQUEST['race_id'];
$raceObj = $raceObj = new RacesTable();
$race = $raceObj->Read($race_id);
if (empty($race)) {
   $sts = "Race is no longer in the system.";
   header("location: RacesMainForm.php?status_msg=$sts&alert_category=alert-danger");
   exit;
}
if ($event_id != $race['event_id']) {
   $sts = "Ruh Roh Shaggy, Event ID in race record does not match event id in request.";
   header("location: RacesMainForm.php?status_msg=$sts&alert_category=alert-danger");
   exit;
}

if ($race['sex'] == RunnerSexValues::Boy) {
   $title = "Boys Race Box Assignments";
} else {
   $title = "Girls Race Box Assignments";
}

$dataObj = new ComplexQueries();
$data = $dataObj->ReadRunnerCountsGroupedByEventSchoolRace($event_id, $race_id);

$startingBoxObj = new StartingBoxes(30);
foreach ($data as $idx => $schoolRec) {
//   echo $idx . " -> " . $schoolRec['school_id'] . ":" . $schoolRec['count']  . "</br>";
   $startingBoxObj->addEntry($schoolRec['school_id'], $schoolRec['count']);
}
$startingBoxObj->prettyPrint($title);
// echo "hello";
?>
