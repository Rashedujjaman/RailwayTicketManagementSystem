<?php
$dbuser="root";
$dbpass="";
$host="localhost";
$db="orrsphp";
$mysqli=new mysqli($host,$dbuser, $dbpass, $db);
$connection = mysqli_connect("$host","$dbuser","$dbpass");
$select_db = mysqli_select_db($connection, $db);
if(!$select_db)
{
	echo("connection terminated");
}
?>
