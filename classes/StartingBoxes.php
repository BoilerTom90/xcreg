<?php

class StartingBoxes
{

   private $numBoxes = 0;
   private $boxCounts;
   private $boxFullTeams;
   private $teamIDs;
   private $teamCounts;
   private $raceData;


   public function __construct($size = 30, $runnerCountDataPerSchool)
   {
      $this->numBoxes = $size;

      for ($i = 0; $i < $size; $i++) {
         $this->boxCounts[$i] = 0;
         $this->boxFullTeams[$i] = false;
         $this->teamIDs[$i] = array();
      }
      $this->raceData = $runnerCountDataPerSchool;
      $this->assign();
   }

   public function assign()
   {
      // Determine how many boxes to put between full teams.
      // We want to evenly distribute the full teams. 
      // let's look at some layouts to help with the formula:
      // presume 30 boxes
      // #FullTeams BoxesBetweenTeams Box Placement
      //     1           15              15
      //     2           10              10, 20
      //     3           7.5             7, 15, 22
      //     4           6               6, 12, 18, 24
      //     5           5               5, 10, 15, 20, 25
      //     6           4.28            4, 9, 13, 17, 21, 26
      // The general formula is:
      //  $boxesBetweenFullTeams = NUM_BOXES / (NUM_TEAMS +1)
      $numFullTeams = 0;
      $boxesBetweenFullTeams = 0;
      foreach ($this->raceData as $idx => $schoolRec) {
         if ($schoolRec['count'] >= 5) {
            $numFullTeams++;
            $boxesBetweenFullTeams = $this->numBoxes / ($numFullTeams + 1);
         }
      }


      // Now, loop over the data again, assigning full teams
      // using the space determined above, and assigning runners
      // not on a full team to a box with the least number of runners.
      $numFullTeamsProcessed = 0;
      foreach ($this->raceData as $idx => $schoolRec) {
         $teamID = $schoolRec['school_id'];
         $numRunners = $schoolRec['count'];

         $foundIndex = -1;
         $foundBox = false;
         $foundCount = 10000;

         if ($numRunners >= 5) {
            $numFullTeamsProcessed++;
            $foundIndex = round($numFullTeamsProcessed * $boxesBetweenFullTeams) - 1;
            $foundCount = $numRunners + empty($this->boxCounts[$foundIndex]) ? 0 : $this->boxCounts[$foundIndex];
         } else {
            foreach ($this->boxCounts as $idx => $count) {
               $fullTeam = $this->boxFullTeams[$idx];
               if (($count < $foundCount) && !$fullTeam) {
                  $foundIndex = $idx;
                  $foundCount = $count;
               }
            }
         }

         $this->boxCounts[$foundIndex] = $foundCount + $numRunners;
         $this->boxFullTeams[$foundIndex] = ($numRunners >= 5) ? true : false;
         $this->teamIDs[$foundIndex][] = $teamID;
         $this->teamCounts[$foundIndex][] = $numRunners;
      }
   }

   public function addEntry($teamID, $numRunners)
   {
      // echo "$teamName, $numRunners </br>";
      // Loop through all the boxes finding the box with the
      // least number of runners. do not put full teams with other full teams
      $foundIndex = -1;
      $foundBox = false;
      $foundCount = 10000;

      // assigning full teams is done first. But, we don't want them all
      // side by side... spread them out every 6th box or so
      if ($numRunners >= 5) {
         for ($idx = 0; $foundBox == false;) {
            // see if anything is assigned to this box
            $foundBox = $this->boxCounts[$idx] == 0 ? true : false;
            if ($foundBox) {
               $foundIndex = $idx;
               $foundCount = 0;
            } else {
               $idx += 4; // increment then check for rollover
               if ($idx >= $this->numBoxes) {
                  $idx = ($idx % $this->numBoxes) + 1;
               }
            }
         }

         // partial teams (i.e. individuals)
         // this is easier... just find the box with the least number of runners
      } else {

         foreach ($this->boxCounts as $idx => $count) {
            $fullTeam = $this->boxFullTeams[$idx];
            if (($count < $foundCount) && !$fullTeam) {
               $foundIndex = $idx;
               $foundCount = $count;
            }
         }
      }

      $this->boxCounts[$foundIndex] = $foundCount + $numRunners;
      $this->boxFullTeams[$foundIndex] = ($numRunners >= 5) ? true : false;
      $this->teamIDs[$foundIndex][] = $teamID;
      $this->teamCounts[$foundIndex][] = $numRunners;
   }

   public function dump()
   {
      $t = 0;
      foreach ($this->boxCounts as $idx => $count) {
         $t2 = $idx + 1;
         echo "Box: " . $t2 . "</br>";
         echo "   Runner Count: " . $count . "</br>";
         foreach ($this->teamIDs[$idx] as $ti => $teamID) {
            $teamCount = $this->teamCounts[$idx][$ti];
            echo "TeamID: $teamID [$teamCount]</br>";
         }
         echo "</br></br>";
         $t += $count;
      }
      echo "Total: $t</br>";
   }

   public function prettyPrint($title)
   {

      echo <<< HEREDOC
         <!DOCTYPE html>
         <html lang="en">
	      <head>
	         <meta charset="UTF-8">
	         <meta http-equiv="X-UA-Compatible" content="IE=edge">
	         <meta name="viewport" content="width=device-width, initial-scale=1">
            <title>$title</title>

            <style>
               body {
                  padding-top: 0
                  display: table;
               }
               table, th, td {
                  border: 1px solid black;
                  border-collapse: collapse;
                  vertical-align: top;
               }

               td {
                  padding: 5px;
               }

            </style>
            <h1>$title</h1>
            <table>
               <tr>
                  <th>Box#</th>
                  <th>Count</th>
                  <th>Teams</th>
               </tr>

HEREDOC;

      $totalRunners = 0;
      foreach ($this->boxCounts as $idx => $boxCount) {
         echo "<tr>";
         $bn = $idx + 1; // don't want 0-based box numbers
         echo "<td>" . $bn . "</td>";
         echo "<td>" . $boxCount . "</td>";
         echo "<td>";
         foreach ($this->teamIDs[$idx] as $ti => $teamID) {
            $schoolObj = new SchoolsTable();
            $schoolRec = $schoolObj->Read($teamID);
            $teamCount = $this->teamCounts[$idx][$ti];
            //echo "ID: " . $teamID . "</br>";
            echo $schoolRec['name'] . "&nbsp;(" . $teamCount . ")</br>";
         }
         echo "</td>";
         echo "</tr>";
         $totalRunners += $boxCount;
      }

      echo "</tr>";
      echo "<tr>";
      echo "<td>Total Runners:</td>";
      echo "<td colspan=2>" . $totalRunners . "</td>";
      echo "</tr>";
      echo "</table>";
      echo "</html>";

      // echo "Total: $t</br>";

   }
}
