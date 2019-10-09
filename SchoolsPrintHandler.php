<?php 

require_once('includes/checkLogin.inc.php'); // session is started in here
require_once('classes/DBAccess.php');
require_once('includes/adminusercheck.inc.php');


function PrintSchoolsTableFormat($schools)
{
   $event_id = PHPSession::Instance()->GetSessionVariable('event_id');
   $eventsObj = new EventsTable();
   $eventRec = $eventsObj->Read($event_id);
   $event_name = $eventRec['ev_name']; 
	print <<< EOT
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
		<h2>School Listing for event: $event_name</h2>
		<table>
			<thead>
				<tr>
					<td>Count</td>
					<td>School ID</td>
					<td>School Name</td>
					<td>#Females</td>
					<td>#Males</td>
					<td>Total</td>
				</tr>
			</thead>
			<tbody>
EOT;

	$k = 0; 
	$total_females = 0;
   $total_males = 0;
   $runnersObj = new RunnersTable();
	foreach ($schools as $school)
	{
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
            print <<< EOT
               <tr>
                  <td>$k</td>
                  <td>$school_id</td>
                  <td>$school_name</td>
                  <td>$num_females</td>
                  <td>$num_males</td>
                  <td>$total</td>
               </tr>
EOT;
         }
		}
	}

	$total = $total_females + $total_males;
	print <<< EOT
		<tr>
			<td colspan=3>Totals</td>
			<td>$total_females</td>
			<td>$total_males</td>
			<td>$total</td>
		</tr>
EOT;

	print <<< EOT
		</tbody>
		</table>
		</body>
		</html>
EOT;

}
 
$schoolsObj = new SchoolsTable();
$schools = $schoolsObj->ReadAll('name');
PrintSchoolsTableFormat($schools);

exit;
?>