<?php

require_once 'includes/checkLogin.inc.php'; // session is started in here
require_once 'includes/head.inc.php';
require_once 'includes/status_msg.inc.php';
require_once 'classes/Constants.php';
require_once 'includes/event_id.inc.php';
require_once 'utils.php';

$event_id = PHPSession::Instance()->GetSessionVariable('event_id');
$evObj = new EventsTable();
$event = $evObj->Read($event_id);
$ev_name = $event['ev_name']

?>

<body>

   <?php
require_once 'includes/navbar.inc.php';
OutputNavBar("AllRunners");
?>

   <!-- Display a table with all of the runners in them.
     For admin users, list all runners.
     For non-admin users, list runners just for their school
-->
   <br>
   <div class="container">
      <div class="panel panel-primary">
         <div class="panel-heading">Confirmed Runner Listing for Event: <span style="color:red; font-weight:bold; font-size:larger"><?php echo $ev_name; ?></span>
         </div>
         <div class="panel-body">
            <div class="row">
               <div class="col-xs-12">
                  <?php DisplayStatusMessage($status_msg);?>
                  <a href="#" data-toggle="tooltip" data-placement="right" title="Click on column heading to sort by that column!">Sorting Tip</a><br />
                  <div class="table-responsive">
                     <table class="table table-condensed table-bordered table-hover set-bg" id="sortable-table">
                        <thead>
                           <tr>
                              <th>#</th>
                              <th>School</th>
                              <th>First Name</th>
                              <th>Last Name</th>
                              <th>Grade</th>
                              <th>Sex</th>
                              <th>Race</th>
                              <!-- <th>Qualifying</br>Time</th> -->
                           </tr>
                        </thead>
                        <tbody>
                           <?php
$racesObj = new RacesTable();
$eventsObj = new EventsTable();
$schoolsObj = new SchoolsTable();

$runners = GetRunnerListing(true);
$count = 0;
foreach ($runners as $runner) {
    $runner_id = $runner['runner_id'];
    $race_id = $runner['race_id'];
    $school_id = $runner['school_id'];
    $runnerSex = $runner['sex'];
    // $qual_time = $runner['qual_time'];

    $schoolRec = $schoolsObj->Read($school_id);
    $schoolName = $schoolRec['name'];

    $raceRec = $racesObj->Read($race_id);
    $raceDistance = $raceRec['distance'];
    $race_description = $raceRec['description'];

    $count++;
    echo "<tr>";
    echo "<td>" . $count . "</td>";
    echo "<td>" . $schoolName . "</td>";
    echo "<td>" . $runner['first_name'] . "</td>";
    echo "<td>" . $runner['last_name'] . "</td>";
    echo "<td>" . $runner['grade'] . "</td>";
    echo "<td>" . $runner['sex'] . "</td>";
    echo "<td>" . $race_description . "</td>";
    // echo "<td>" . $qual_time . "</td>";
    echo "</tr>";
}
?>
                        </tbody>
                     </table>
                  </div>
               </div>
            </div>
         </div>


         <?php
require_once 'includes/footer.inc.php';
?>