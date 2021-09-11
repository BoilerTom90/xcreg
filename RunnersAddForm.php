<?php

require_once('includes/checkLogin.inc.php'); // session is started in here

require_once('classes/DBAccess.php');
require_once('classes/Constants.php');
require_once('includes/event_id.inc.php');
require_once('utils.php');


?>

<?php
require_once('includes/navbar.inc.php');
OutputNavBar("Runners");

$event_id = PHPSession::Instance()->GetSessionVariable('event_id');
$evObj = new EventsTable();
$event = $evObj->Read($event_id);
$canEditRunners = CanEditRunners($event['ev_reg_status']);
if (!$canEditRunners) {
   $sts = "Not authorized to add runners!";
   header("location: index.php?status_msg=$sts");
   exit;
}

require_once('includes/head.inc.php');

$school_id = PHPSession::Instance()->GetSessionVariable('school_id');
?>

<br />
<div class="container">
   <div class="row">
      <div class="col-xs-3"></div>
      <div class="col-xs-9">
         <div class="btn-group">
            <a class="btn btn-primary" href="RunnersMain.php">Cancel</a>
         </div>
      </div>
   </div>
   <div class="row"></br></div>
</div>

<div class="container">
   <div class="row">
      <div class="col-xs-3"></div>
      <div class="col-xs-6 col-md-offsetx-7">
         <div class="panel panel-primary">
            <div class="panel-heading"> <strong class="">Add Runner</strong>
            </div>
            <div class="panel-body">
               <form class="form-horizontal" role="form" method="post" action="RunnersAddHandler.php">

                  <div class="form-group">
                     <label for="school_id" class="col-sm-3 control-label">School</label>
                     <div class="col-sm-9">
                        <select id="school_id" name="school_id" class="form-control" required>
                           <?php OutputSchoolChoices($school_id); ?>
                        </select>
                     </div>
                  </div>

                  <div class="form-group">
                     <label for="first_name" class="col-sm-3 control-label">First Name</label>
                     <div class="col-sm-9">
                        <input type="text" class="form-control" maxlength="25" id="first_name" name="first_name" placeholder="First Name (25 chars max)" pattern="[A-Za-z0-9 -\.']{1,25}" title="Enter First Name" data-toggle="popover" data-trigger="focus" data-content="Accepts up to 25 characters: alphanumeric, space, hyphen, apostrophe or period." required>
                     </div>
                  </div>

                  <div class="form-group">
                     <label for="last_name" class="col-sm-3 control-label">Last Name</label>
                     <div class="col-sm-9">
                        <input type="text" class="form-control" maxlength="25" id="last_name" name="last_name" placeholder="Last Name (25 chars max)" pattern="[A-Za-z0-9 -\.']{1,25}" title="Enter Last Name" data-toggle="popover" data-trigger="focus" data-content="Accepts up to 25 characters: alphanumeric, space, hyphen, apostrophe or period." required>
                     </div>
                  </div>

                  <div class="form-group">
                     <label for="grade" class="col-sm-3 control-label">Grade</label>
                     <div class="col-sm-9">
                        <input type="number" class="form-control" min="3" max="8" id="grade" name="grade" placeholder="grade (3-8)" title="Enter Grade" data-toggle="popover" data-trigger="focus" data-content="Accepts a number between 3 and 8" required>
                     </div>
                  </div>

                  <div class="form-group">
                     <label for="sex" class="col-sm-3 control-label">Sex</label>
                     <div class="col-sm-9">
                        <label class="radio-inline"><input type="radio" name="sex" value="<?php echo RunnerSexValues::Boy ?>" required>Boy</label>
                        <label class="radio-inline"><input type="radio" name="sex" value="<?php echo RunnerSexValues::Girl ?>" required>Girl</label>
                     </div>
                  </div>

                  <div class="form-group">
                     <label for="race_id" class="col-sm-3 control-label">Race</label>
                     <div class="col-sm-9">
                        <select id="race_id" name="race_id" class="form-control" required>
                           <?php OutputRaceChoices(PHPSession::Instance()->GetSessionVariable('event_id')); ?>
                        </select>
                     </div>
                  </div>

                  <div class="form-group">
                     <label for="qual_time" class="col-sm-3 control-label">Qualifying Time (hh:mm:ss)</label>
                     <div class="col-sm-9">
                        <input type="text" class="form-control" id="qual_time" 
                        name="qual_time" pattern="[0]{2}:[0-9]{2}:[0-9]{2}" value="00:00:00" placeholder="Qualifying Time (hh:mm:ss)" 
                        title="Enter runners qualifying time for this race distance. Use 00:00:00 if time not required." data-toggle="popover" data-trigger="focus" data-content="Time must be in hh:mm:ss format" required>
                     </div>
                  </div>


                  <hr />
                  <div class="form-group last">
                     <div class="col-sm-offset-2 col-sm-9">
                        <button type="submit" name="button" value="add" class="btn btn-primary btn-md">Submit</button>
                     </div>
                  </div>
               </form>
            </div>
         </div>
      </div>
      <div class="col-xs-3"></div>
   </div>
</div>

<script>
   $(document).ready(function() {

      // $selected_event_id = $('#event_id option:selected').val();
      // // alert("Selected Event ID: " + $selected_event_id);

      // $('#event_id').change(function() {
      //    $selected_event_id = $('#event_id option:selected').val();
      // });

   });
</script>


<?php
require_once('includes/footer.inc.php');
?>