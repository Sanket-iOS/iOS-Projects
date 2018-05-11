<?php
$con=new mysqli("localhost","root","","db_crime_track");

if(isset($_REQUEST["wid"]))
{
    $vwdid=$_REQUEST["wid"];

    $q="DELETE FROM wanted_person WHERE Wperson_id='$vwdid'";
    
    //echo $q;
    $con->query($q);

}
?>
