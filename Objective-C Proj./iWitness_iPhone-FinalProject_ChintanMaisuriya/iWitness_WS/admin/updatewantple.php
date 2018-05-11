<?php
$con=new mysqli("localhost","root","","db_crime_track");

if(isset($_REQUEST["wname"]))
{
    $vname=$_REQUEST["wname"];
	$vtype=$_REQUEST["wtype"];
	$vdecs=$_REQUEST["wdec"];
    $vurl=$_REQUEST["wpurl"];
	$vwid=$_REQUEST["wid"];

    $id="UPDATE wanted_person SET Wperson_name='$vname',Crime_type='$vtype',Wperson_desc='$vdecs',Wperson_photo='$vurl' WHERE Wperson_id='$vwid'";

	$con->query($id);
}

?>

