<?php

class UsersDB {

	function __construct() {
       print "In BaseClass constructor\n";
   	}

   	function __destruct() {
       print "Destroying " . $this->name . "\n";
   	}

	function Add() {}
	function Delete() {}
	function UpdateEmail() {}
	function UpdateRole() {}
	function UpdateStatus() {}
	function UpdatePassword() {}
	function UpdateSchoolID() {}
}


?>