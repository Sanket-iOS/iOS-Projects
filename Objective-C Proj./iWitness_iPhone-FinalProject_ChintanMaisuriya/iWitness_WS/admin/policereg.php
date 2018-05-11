<?php
$con=new mysqli("localhost","root","","db_crime_track");

if(isset($_REQUEST["pname"]))
{
	$vname=$_REQUEST["pname"];
	$vadd=$_REQUEST["padd"];
    $vcontact=$_REQUEST["pcontact"];
    $vuname=$_REQUEST["puname"];
    $vpass=$_REQUEST["pass"];
    $vlati=$_REQUEST["lat"];
    $vlong=$_REQUEST["lng"];
    
	$id="INSERT INTO policestn_reg(Name, Address, Contact, Username, Password, Latitude, Longitude) VALUES ('$vname','$vadd','$vcontact','$vuname','$vpass','$vlati','$vlong')";
	
    echo $id;
	$con->query($id);
}

?>

