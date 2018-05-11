<?php
$con=new mysqli("localhost","root","","db_crime_track");

if(isset($_REQUEST["wname"]))
{
	$vwname=$_REQUEST["wname"];
	$vtype=$_REQUEST["type"];
    $vdesc=$_REQUEST["desc"];
    $vurl=$_REQUEST["url"];
    $vst=$_REQUEST["stat"];

	$id="INSERT INTO wanted_person(Wperson_name, Crime_type, Wperson_desc, Wperson_photo, Wperson_status) VALUES ('$vwname','$vtype','$vdesc','$vurl','$vst')";
	
    echo $id;
	$con->query($id);
}

?>

