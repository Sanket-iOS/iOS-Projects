<?php
$con=new mysqli("localhost","root","","db_crime_track");

if(isset($_REQUEST["mname"]))
{
    $vname=$_REQUEST["mname"];
	$vcon=$_REQUEST["mcon"];
	$vdecs=$_REQUEST["mdec"];
	$vage=$_REQUEST["mage"];
    $vdate=$_REQUEST["mdate"];
    $vurl=$_REQUEST["mpurl"];
    $vmid=$_REQUEST["mid"];

    $id="UPDATE missing_person SET Mperson_name='$vname',Mperson_contact='$vcon',Mperson_desc='$vdecs',Age='$vage',Missing_date='$vdate',Mperson_photo='$vurl' WHERE Mperson_id='$vmid'";

	$con->query($id);
}

?>

