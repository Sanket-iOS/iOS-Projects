<?php
$con=new mysqli("localhost","root","","iWitness");

if(isset($_REQUEST["ufname"]))
{
	$uName=$_REQUEST["ufname"];
	$uSurname=$_REQUEST["ulname"];
	$uAdd=$_REQUEST["uadd"];
    $uCNo=$_REQUEST["ucont"];
    $uEmail=$_REQUEST["uemail"];
    $UN=$_REQUEST["un"];
    $uPWD=$_REQUEST["upwd"];
    $uAadhar=$_REQUEST["uaadhar"];
    
	$userInsert="insert into userRegistration(UName,USurname,UAddress,UContact,UEmail,Username,Password,UAadharNo) values('$uName','$uSurname','$uAdd','$uCNo','$uEmail','$UN','$uPWD','$uAadhar')";
    
    //echo $userInsert;
		
	$con->query($userInsert);
    echo "Data has been inserted";
}

?>

