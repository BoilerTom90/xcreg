<?php

require_once('includes/checkLogin.inc.php'); // session is started in here
require_once('includes/head.inc.php');
require_once('includes/adminusercheck.inc.php');
require_once('includes/status_msg.inc.php');
require_once('includes/event_id.inc.php');
require_once('classes/DBAccess.php');

?>

<body>

   <?php
   require_once('includes/navbar.inc.php');
   OutputNavBar("Races");
   ?>

   <?php
   $event_id = PHPSession::Instance()->GetSessionVariable('event_id');
   $eventObj = new EventsTable();
   $event = $eventObj->Read($event_id);
   $evName = $event['ev_name'];

   $raceObj = new RacesTable();
   $races = $raceObj->ReadByEvent($event_id);

   ?>

   <br />

   <div class="container">
      <div class="row">
         <div class="col-xs-6">
            <?php DisplayStatusMessage($status_msg); ?>
         </div>
      </div>
   </div>

   <div class="container">
      <div class="row">
         <div class="col-xs-12 col-md-7">
            <div class="panel panel-primary">
               <div class="panel-heading">
                  Race Listing for Event: <span class="label label-warning"><?php echo $evName ?></span>
               </div>
               <div class="panel-body">
                  <div class="row">
                     <div class="col-xs-12">
                        <div class="table-responsive">
                           <table class="table table-condensed table-bordered table-hover set-bg" id="sortable-table">
                              <thead>
                                 <tr>
                                    <th>Distance</th>
                                    <th>Description</th>
                                    <th>Sex</th>
                                    <th>Qualifying Time</th>
                                    <th>#Runners</th>
                                    <th>Delete</th>
                                    <th>Modify</th>
                                    <th>Box Assignments</th>
                                 </tr>
                              </thead>
                              <tbody>
                                 <?php
                                 $raceObj = new RacesTable();
                                 $races = $raceObj->ReadByEvent($event_id);
                                 if (empty($races)) {
                                    echo "<tr><td colspan=5>No Races yet for this event!</td></tr>";
                                 } else {
                                    foreach ($races as $race) {
                                       $id = $race['id'];
                                       $distance = $race['distance'];
                                       $sex = $race['sex'];
                                       $qual_time = $race['qual_time'];
                                       $description = $race['description'];

                                       $runnersObj = new RunnersTable();
                                       $runners = $runnersObj->ReadByRaceID($id);
                                       $numRunners = count($runners);

                                       echo "<tr>";
                                       echo "<td>" . $distance . "</td>";
                                       echo "<td>" . $description . "</td>";
                                       echo "<td>" . $sex . "</td>";
                                       echo "<td>" . $qual_time . "</td>";
                                       echo "<td>" . $numRunners . "</td>";
                                       if ($numRunners > 0) {
                                          echo "<td>Prohibited <span class=\"badge\">$numRunners</span></td>";
                                       } else {
                                          echo "<td><a class=\"btn btn-primary btn-xs\" href=\"RacesDeleteHandler.php?race_id=$id&event_id=$event_id\">Delete</a></td>";
                                       }
                                       echo "<td>" . "<a class=\"btn btn-primary btn-xs\" href=\"RacesModifyForm.php?race_id=$id\">Modify</a>" . "</td>";
                                       echo "<td>" . "<a class=\"btn btn-primary btn-xs\" target=_blank href=\"BoxAssignmentHandler.php?race_id=$id&event_id=$event_id\">Display</a></td>";
                                       echo "</tr>";
                                    }
                                 }
                                 ?>
                              </tbody>
                           </table>
                        </div>
                     </div>
                  </div>
               </div> <!-- panel-body -->
            </div> <!-- panel default -->
         </div> <!-- left column -->
         <div class="col-xs-12 col-md-5">
            <div class="container-fluid">
               <div class="row">
                  <div class="col-xs-12">
                     <div class="panel panel-primary">
                        <div class="panel-heading">
                           <strong class="">Add Race</strong>
                        </div>
                        <div class="panel-body">
                           <form class="form-horizontal" role="form" method="post" action="RacesAddHandler.php?event_id=<?php echo $event_id; ?>">

                              <div class="form-group">
                                 <label for="distance" class="col-sm-4 control-label">Distance</label>
                                 <div class="col-sm-8">
                                    <input type="number" class="form-control" name="distance" id="distance" placeholder="Distance" step=0.01 autofocus required>
                                 </div>
                              </div>

                              <div class="form-group">
                                 <label for="sex" class="col-sm-4 control-label">Sex</label>
                                 <div class="col-sm-8">
                                    <label class="radio-inline"><input type="radio" name="sex" value="<?php echo RunnerSexValues::Boy; ?>" required>Boy</label>
                                    <label class="radio-inline"><input type="radio" name="sex" value="<?php echo RunnerSexValues::Girl; ?>" required>Girl</label>
                                 </div>
                              </div>

                              <div class="form-group">
                                 <label for="qual_time" class="col-sm-4 control-label">Qualifying Time (hh:mm:ss)</label>
                                 <div class="col-sm-8">
                                    <input type="text" class="form-control" name="qual_time" id="qual_time" placeholder="Qualifying Time (hh:mm:ss)" pattern="[0-9][0-9]:[0-9][0-9]:[0-9][0-9]" autofocus required>
                                 </div>
                              </div>

                              <div class="form-group">
                                 <label for="description" class="col-sm-4 control-label">Description</label>
                                 <div class="col-sm-8">
                                    <input type="text" class="form-control" name="description" id="description" placeholder="Description (e.g. Boys 1.0 Mile)" maxlength=25 required>
                                 </div>
                              </div>
                              <hr />
                              <div class="form-group last">
                                 <div class="col-sm-offset-4 col-sm-4">
                                    <button type="submit" name="button" value="add" class="btn btn-primary btn-md">Submit</button>
                                 </div>
                                 <div class="col-sm-4">
                                    <input type="reset" class="form-control" name="reset_form" id="reset_form">
                                 </div>
                              </div>
                           </form>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>

      </div> <!-- Outer Row -->
   </div> <!-- Outer Container -->

   <?php

   require_once('includes/footer.inc.php');

   ?>