<?php
$con=new mysqli("localhost","root","","db_crime_track");

if(isset($_REQUEST["stat"]))
{
    $vstat=$_REQUEST["stat"];
    $vpolice=$_REQUEST["police"];
    $vcid=$_REQUEST["cid"];

    $id="UPDATE Complaint SET police_id='$vpolice',status='$vstat' WHERE comp_id='$vcid'";

	$con->query($id);
}

?>

