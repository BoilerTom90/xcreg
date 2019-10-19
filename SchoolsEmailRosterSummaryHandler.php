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

               thead, tr.footer{
                  font-weight: bold;
                  color: black;
                  background:  #AAA9AD;
                  background: -webkit-radial-gradient(top, #AAA9AD, #FFFFFF);
                  background: -moz-radial-gradient(top,  #AAA9AD, #FFFFFF);
                  background: radial-gradient(to bottom,  #AAA9AD, #FFFFFF);
               }

					td {
    					padding: 10px;
               }
               
               tr.oddRow {
                  background: #FFF;
               }

               p {
                  max-width: 600px;
               }
				</style>
			</head>
		<body>
      <h2>$event_name</h2>
      <h3>Registered Runner Counts Per School</h3>
      <p>You are receiving this email because you have, or at one time had, used the XC 
      registration web site on behalf of one of the schools listed.
      If you are no longer affiliated with the event or school, 
      please send an email to the site administrator requesting to have
      your account removed from the system.</p>
      
      <p><emphasis>The table below is a summary of the schools and runners that are registered for this meet. Please review
      your school's runner counts for accuracy. To obtain a complete list of your school's runners, 
      please logon to registration web site and click on the "My Runners" link on the tap navigation bar.</emphasis></p>
      
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
   // $toArray[] = "thomas.hoffman@infinite.com";
   // $toArray[] = "purduetom90@gmail.com";

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
         $oddRow = "";

         if ($total > 0) {
            $k++;
            $oddRow = (($k % 2) == 0) ? "oddRow" : "";
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
      
      <tr class="footer">
			<td>Totals</td>
			<td>$total_females</td>
			<td>$total_males</td>
			<td>$total</td>
      </tr>
      </tbody>
      </table>
		</body>
      </html>
EOT;

   $subject = $event_name . " - Registered Runner Summary";
   SendHTMLEmail($toArray, $subject, $html);

   $html .= <<< EOT
      <hr style="color:black">
      This email was sent to the following email addresss: <p>explode(" ,", $toArray)</p>
EOT;
   print $html;
}

$schoolsObj = new SchoolsTable();
$schools = $schoolsObj->ReadAll('name');
doit($schools);

exit;
