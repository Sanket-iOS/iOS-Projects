<?php
$con=new mysqli("localhost","root","","db_crime_track");

if(isset($_REQUEST["mname"]))
{
	$vmname=$_REQUEST["mname"];
	$vcontact=$_REQUEST["contact"];
    $vabout=$_REQUEST["about"];
    $vage=$_REQUEST["age"];
    $vdt=$_REQUEST["date"];
    $vpurl=$_REQUEST["url"];
    $vstat=$_REQUEST["stat"];
    
	$id="INSERT INTO missing_person(Mperson_name, Mperson_contact, Mperson_desc, Age, Missing_date, Mperson_photo, Mperosn_status) VALUES ('$vmname','$vcontact','$vabout','$vage','$vdt','$vpurl','$vstat')";
	
    echo $id;
	$con->query($id);
}

?>

