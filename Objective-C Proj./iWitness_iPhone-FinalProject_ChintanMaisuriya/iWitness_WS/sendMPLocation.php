<?php
$con=new mysqli("localhost","root","","iWitness");
if(isset($_REQUEST["mpID"]))
{
	$mpID=$_REQUEST["mpID"];
    $uID=$_REQUEST["uID"];
	$psID=$_REQUEST["psID"];
    $lati=$_REQUEST["lati"];
    $lng=$_REQUEST["lng"];
    $flAdd=$_REQUEST["flAddress"];
    
	$id="INSERT INTO mpFoundLocation(mpID, UID, psID, latitude, longitude, foundLocationAddress, mpFLDate, mpFLTime) VALUES ('$mpID','$uID','$psID','$lati','$lng','$flAdd',curdate(),curtime())";
    $con->query($id);
    echo "Success";
}

?>

