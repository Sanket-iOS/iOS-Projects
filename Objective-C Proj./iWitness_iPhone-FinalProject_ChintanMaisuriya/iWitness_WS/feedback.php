<?php
$con=new mysqli("localhost","root","","iWitness");

if(isset($_REQUEST["userID"]))
{
	$fbUID=$_REQUEST["userID"];
	$fbs=$_REQUEST["feedbacks"];
	$fbRate=$_REQUEST["rates"];

	$id="INSERT INTO Feedbacks(UID, feedBacks, givenRates) VALUES ('$fbUID', '$fbs', '$fbRate');";
	
    //echo $id;
	$con->query($id);
    
    echo "success";
}

?>

