<?php
$con=new mysqli("localhost","root","","iWitness");

if(isset($_REQUEST["ufname"]))
{
    $uName=$_REQUEST["ufname"];
    $uLastName=$_REQUEST["ulname"];
    $uAdd=$_REQUEST["uadd"];
    $uCNo=$_REQUEST["ucont"];
    $uEmail=$_REQUEST["uemail"];
    $uPic=$_REQUEST["upic"];
    $uId=$_REQUEST["uID"];
    
    $id="UPDATE userRegistration SET UName='$uName',USurname='$uLastName',UAddress='$uAdd',UContact='$uCNo',UEmail='$uEmail',UProfilePic='$uPic' WHERE UID='$uId'";
	
    //echo $id;
	$con->query($id);
    
    echo "Success";
}

?>

