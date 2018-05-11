<?php
$con=new mysqli("localhost","root","","db_crime_track");

if(isset($_REQUEST["wid"]))
{
    $vwant=$_REQUEST["wid"];

    $id="UPDATE wanted_person SET Wperson_status=0 WHERE Wperson_id='$vwant'";

	$con->query($id);
}

?>

