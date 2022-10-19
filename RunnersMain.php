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
$ev_name = $event['ev_name'];

$canEditRunners = CanEditRunners($event['ev_reg_status']);

$queryObj = new ComplexQueries();

?>

<body>

   <?php
require_once 'includes/navbar.inc.php';
OutputNavBar("Runners");
?>

   <br>
   <div class="container">
      <div class="col-xs-8">
         <div class="row">
            <button type="button" class="btn btn-danger" data-toggle="collapse" data-target="#redCellDescription">
               Runners with RED Cells?
            </button>
            <div id="redCellDescription" class="collapse">
               <br>
               <div class="panel panel-danger">
                  <div class="panel-heading">
                     <h3 class="panel-title">A Table cell with a RED background can mean the following:</h3>
                  </div>
                  <ul class="list-group">
                     <!-- <li class="list-group-item"><b>Qualifying Time</b> - If a runner's qualifying time is slower than the standard set forth by the race director,
                     this field will be highlighted in RED. Note: not all races have a minimal qualifying time, and this field only applies to runners competing as individuals, not part of a team.
                        This runner will not be allowed to participate unless granted permission to over-ride the qualifying time restriction.
                        Contact the Race Administrator for permission to do this! <br><br>
                        Once approved, you <b>must</b> modify the runner and check the "Overide Qualifying Time" option. After modifying the runner to
                        over-ride the time restriction, the runner will no longer by highlighted in RED and is valid to particate in race.<br><br>
                        Be sure to enter the time in hh:mm:ss format (do not enter milliseconds). So, if a runner has run 2 miles in 12:00, the time should be 00:12:00!
                     </li> -->
                     <li class="list-group-item"><b>Sex & Race</b> - If a runner's <em>Sex</em> and <em>Race</em> are highlighted in red, it means
                        you have a boy entered
                        into a designated girl's race or vice-a-versa. This <em>must</em> be corrected.
                     </li>
                  </ul>
               </div>
            </div>
         </div>
      </div>
      <div class="row"></br></br></div>



      <div class="row">
         <div class="col-xs-6">
            <div>
               <?php if ($canEditRunners) {?>
                  <a class="btn btn-primary" href="RunnersAddForm.php">Add Runner</a>
                  <!-- <a class="btn btn-primary btn-md" href="RunnersImportForm.php">Import Runners From CSV File</a> -->
               <?php }?>
            </div>
         </div>
         <div class="col-xs-6">
            <div class="pull-right">
               <a class="btn btn-primary" href="RunnersPrintForm.php">Printable Listing</a>
            </div>
         </div>
      </div>
      <div class="row"></br></div>
   </div>



   <!-- Display a table with all of the runners in them.
     For admin users, list all runners.
     For non-admin users, list runners just for their school
-->

   <style>
      table td.alertCell {
         background-color: #d9534f !important;
      }

      table td.alertTime {
         background-color: #d9534f !important;
      }
   </style>

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
                              <!-- <th>Qualifying Time<br>(hh:mm:ss format)</th> -->
                              <?php if ($canEditRunners) {?>
                                 <th>Change</th>
                                 <th>Delete</th>
                              <?php }?>
                           </tr>
                        </thead>
                        <tbody>
                           <?php
$racesObj = new RacesTable();
$eventsObj = new EventsTable();
$schoolsObj = new SchoolsTable();

$runners = GetRunnerListing();
$count = 0;
foreach ($runners as $runner) {
    $runner_id = $runner['runner_id'];
    $race_id = $runner['race_id'];
    $school_id = $runner['school_id'];
    $runnerSex = $runner['sex'];
    // $qual_time = $runner['qual_time'];
    //  $qual_time_or = $runner['qual_time_or'];
    //  $qual_time_or_indicator = $qual_time_or ? "*" : "";

    $schoolRec = $schoolsObj->Read($school_id);
    $schoolName = $schoolRec['name'];

    $raceRec = $racesObj->Read($race_id);
    $raceDistance = $raceRec['distance'];
    $race_description = $raceRec['description'];
    $raceSex = $raceRec['sex'];
    // $race_qual_time = $raceRec['qual_time'];

    // See if we should alert this runner's time...
    $school_count = $queryObj->ReadRunnerCountForSchoolByRace($school_id, $race_id);
    // $time_diff = CompareHHMMSSTimes($qual_time, $race_qual_time);
    $timeWarn = ""; //  (($time_diff < 0) && ($school_count <= 4) && !$qual_time_or) ? "alertTime" : "";

    $sexWarn = "";
    $title = "";
    if ($runnerSex != $raceSex) {
        $sexWarn = "alertCell";
        $title = "Either runner's Sex is wrong, or the race is wrong";
    }

    $event_id = $raceRec['event_id'];
    $eventRec = $eventsObj->Read($event_id);
    $eventName = $eventRec['ev_name'];

    $count++;
    echo "<tr title=\"$title\">";
    echo "<td>" . $count . "</td>";
    echo "<td>" . $schoolName . "</td>";
    echo "<td>" . $runner['first_name'] . "</td>";
    echo "<td>" . $runner['last_name'] . "</td>";
    echo "<td>" . $runner['grade'] . "</td>";
    echo "<td class=\"$sexWarn\">" . $runner['sex'] . "</td>";
    echo "<td class=\"$sexWarn\">" . $race_description . "</td>";
    /*  echo "<td class=\"$timeWarn\">" . $runner['qual_time'] . $qual_time_or_indicator . "</td>"; */

    if ($canEditRunners) {
        echo "<td>" . "<a class=\"btn btn-primary btn-xs\" href=\"RunnersModifyForm.php?runner_id=$runner_id\"><span>Change</span></a>" . "</td>";
        echo "<td>" . "<a class=\"btn btn-primary btn-xs\" href=\"RunnersDeleteForm.php?runner_id=$runner_id\"><span>Delete</span></a>" . "</td>";
    }
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