<?php
$con=new mysqli("localhost","root","","iWitness");
if(isset($_REQUEST["wpID"]))
{
	$wpID=$_REQUEST["wpID"];
    $uID=$_REQUEST["uID"];
	$psID=$_REQUEST["psID"];
    $lati=$_REQUEST["lati"];
    $lng=$_REQUEST["lng"];
    $flAdd=$_REQUEST["flAddress"];
    
	$id="INSERT INTO wpFoundLocation(wpID, UID, psID, latitude, longitude, foundLocationAddress, wpFLDate, wpFLTime) VALUES ('$wpID','$uID','$psID','$lati','$lng','$flAdd',curdate(),curtime())";
    $con->query($id);
    echo "Success";
}

?>

