<?php
$con=new mysqli("localhost","root","","db_crime_track");

if(isset($_REQUEST["pname"]))
{
    $vname=$_REQUEST["pname"];
	$vcont=$_REQUEST["cont"];
	$vphoto=$_REQUEST["photo"];
    $vpid=$_REQUEST["pid"];

    $id="UPDATE policeman_info SET name='$vname',contact='$vcont',photo_url='$vphoto' WHERE police_id='$vpid'";

	$con->query($id);
}

?>

