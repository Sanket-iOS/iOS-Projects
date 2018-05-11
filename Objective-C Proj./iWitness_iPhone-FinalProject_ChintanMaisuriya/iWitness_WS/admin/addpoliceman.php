<?php
$con=new mysqli("localhost","root","","db_crime_track");

if(isset($_REQUEST["pname"]))
{
	$vpname=$_REQUEST["pname"];
	$vpost=$_REQUEST["post"];
    $vcontact=$_REQUEST["contact"];
    $psid=$_REQUEST["pstid"];
    $purl=$_REQUEST["url"];
    
	$id="INSERT INTO `policeman_info`(ps_id, name, post, contact, photo_url) VALUES ('$psid','$vpname','$vpost','$vcontact','$purl')";
	
    echo $id;
	$con->query($id);
}

?>

