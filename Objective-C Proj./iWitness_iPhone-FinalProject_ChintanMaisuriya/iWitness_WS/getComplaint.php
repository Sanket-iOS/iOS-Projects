<?php
$con=new mysqli("localhost","root","","iWitness");

if(isset($_POST["userID"]))
{
	$cUID=$_POST["userID"];
	$cPSID=$_POST["policeSID"];
	$cType=$_POST["compty"];
	$cDetail=$_POST["compDetail"];
    $cLocation=$_POST["address"];
    $cLatitude=$_POST["lati"];
    $cLongitude=$_POST["lng"];
    $cDate=$_POST["compDate"];
    $cTime=$_POST["compTime"];
    $cIMGs=$_POST["compIMGs"];
    $cStatus=$_POST["compStatus"];
    
	$id="INSERT INTO Complaint(UID, psID, ctID, cDetails, locationAddress, latitude, longitude, cDate, cTime, cIMG_URLs, cStatus)VALUES('$cUID','$cPSID','$cType','$cDetail','$cLocation','$cLatitude','$cLongitude','$cDate','$cTime','$cIMGs','$cStatus')";
	
    //echo $id;
	$con->query($id);
    echo "Success";
    
}

?>

