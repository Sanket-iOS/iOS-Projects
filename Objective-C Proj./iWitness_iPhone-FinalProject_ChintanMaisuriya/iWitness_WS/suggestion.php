<?php
$con=new mysqli("localhost","root","","iWitness");

if(isset($_REQUEST["userID"]))
{
    $sUID=$_REQUEST["userID"];
	$spsID=$_REQUEST["policeSID"];
    $sSub=$_REQUEST["sugSubject"];
	$sDetail=$_REQUEST["sugDetail"];

	$id="INSERT INTO Suggestions(UID, psID, sugSubject, sugDetail) VALUES('$sUID','$spsID','$sSub','$sDetail')";
    $con->query($id);
    
   // $done[]="Success";
    //echo json_encode($done);
    echo "success";
}

?>

