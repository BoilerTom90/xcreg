<?php

for ($numFullTeams = 1; $numFullTeams <= 35; $numFullTeams++) {
   $boxesBetweenTeams = 30 / ($numFullTeams + 1);
   if ($numFullTeams >= 30) {
      $boxesBetweenTeams = 30 / ($numFullTeams);
   }

   printf("Full Teams: %d, space: %2.2f\n", $numFullTeams, $boxesBetweenTeams);
   for ($i = 1; $i <= $numFullTeams; $i++) {
      printf("%2d ", round($i * $boxesBetweenTeams, 0, PHP_ROUND_HALF_EVEN));
   }
   printf("\n");
}
