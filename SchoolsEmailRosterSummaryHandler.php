<?php

require_once('includes/checkLogin.inc.php'); // session is started in here
require_once('classes/DBAccess.php');
require_once('includes/adminusercheck.inc.php');
require_once('sendmail.php');


function doit($schools)
{
   $html = '';

   $event_id = PHPSession::Instance()->GetSessionVariable('event_id');
   $eventsObj = new EventsTable();
   $eventRec = $eventsObj->Read($event_id);
   $event_name = $eventRec['ev_name'];
   $html .= <<< EOT
		<!DOCTYPE html>
		<html>
			<head>
				<style>
					table {
    					border-collapse: collapse;
					}

					table, th, td {
		    			border: 1pt solid black;
					}

					td {
    					padding: 10px;
					}
				</style>
			</head>
		<body>
      <h2>$event_name</h2>
      <h3>Registered Runner Counts Per School</h3>
      <p>
      <p><emphasis>The table below represents the current count of runners that are registered for this meet. Please review
      your runner counts to ensure all runners are accounted for. To obtain an itemized list of runners for your
      school, please logon to registration web site and click on the "My Runners" link on the tap navigation bar.</emphasis></p>
      <br>
      <p>You are receiving this email because you have, or at one time had, used the XC registration web site on behalf of the schools listed.
      If you are no longer affiliated with any of the below schools, please reply to this email and I will delete your account.</p>
		<table>
			<thead>
				<tr>
					<td>School Name</td>
					<td>#Girls</td>
					<td>#Boys</td>
					<td>Total</td>
				</tr>
			</thead>
			<tbody>
EOT;

   $k = 0;
   $total_females = 0;
   $total_males = 0;
   $toArray = array();
   $runnersObj = new RunnersTable();
   foreach ($schools as $school) {
      $school_id = $school['id'];
      if ($school_id > 0) { // skip the admin school 

         $school_name = $school['name'];
         $girlRecs = $runnersObj->ReadByEventSchoolAndSex($event_id, $school_id, RunnerSexValues::Girl);
         $boyRecs = $runnersObj->ReadByEventSchoolAndSex($event_id, $school_id, RunnerSexValues::Boy);
         //var_dump($girlRecs); var_dump($boyRecs); 

         $num_females = empty($girlRecs) ? 0 : count($girlRecs);
         $num_males = empty($boyRecs) ? 0 : count($boyRecs);
         $total = $num_females + $num_males;
         $total_females += $num_females;
         $total_males += $num_males;

         if ($total > 0) {
            $k++;
            $html .= <<< EOT
               <tr>
                  <td>$school_name</td>
                  <td>$num_females</td>
                  <td>$num_males</td>
                  <td>$total</td>
               </tr>
EOT;
            $usersObj = new UsersTable();
            $user_recs = $usersObj->ReadBySchoolID($school_id);
            foreach ($user_recs as $key => $value) {
               if ($value['num_logins'] > 0) {
                  $toArray[] = $value['email'];
               }
            }
         }
      }
   }

   $total = $total_females + $total_males;
   $html .= <<< EOT
		<tr>
			<td>Totals</td>
			<td>$total_females</td>
			<td>$total_males</td>
			<td>$total</td>
		</tr>
EOT;

   $html .= <<< EOT
		</tbody>
		</table>
		</body>
      </html>
EOT;

   $to = implode(", ", $toArray);

   $subject = $event_name . " - Registered Runner Summary";
   SendHTMLEmail($to, $subject, $html);
   print $html;
}

$schoolsObj = new SchoolsTable();
$schools = $schoolsObj->ReadAll('name');
doit($schools);

exit;
