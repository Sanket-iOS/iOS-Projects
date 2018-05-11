<?php
$con=new mysqli("localhost","root","","db_crime_track");

if(isset($_REQUEST["mid"]))
{
    $vwant=$_REQUEST["mid"];

    $id="UPDATE missing_person SET Mperosn_status=0 WHERE Mperson_id='$vwant'";

	$con->query($id);
}

?>

