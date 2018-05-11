<?php
$con=new mysqli("localhost","root","","db_crime_track");

if(isset($_REQUEST["npass"]))
{
    $vnpass=$_REQUEST["npass"];
    $vuid=$_REQUEST["pid"];
    
    $id="UPDATE policestn_reg SET Password='$vnpass' WHERE ps_id='$vuid'";
	
    //$id="insert into userinfo(Name,Surname,Address1,Address2,Mobile,Email,Username,Password,Aadharno) values('$vname','$vsurname','$vadd1','$vadd2','$vmobile','$vemail','$vuname','$vpass','$vaadhar')";
	
    //echo $id;
		
	$con->query($id);
}

?>

