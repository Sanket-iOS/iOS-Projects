<?php
$con=new mysqli("localhost","root","","iWitness");

if(isset($_REQUEST["newPWD"]))
{
    $uPWD=$_REQUEST["newPWD"];
    $uID=$_REQUEST["uID"];
    
    $id="UPDATE userRegistration SET Password='$uPWD' WHERE UID='$uID'";
	$con->query($id);
    
    echo "success";
}
?>

