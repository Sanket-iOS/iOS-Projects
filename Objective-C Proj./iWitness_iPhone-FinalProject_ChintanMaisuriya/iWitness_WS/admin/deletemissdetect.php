<?php
$con=new mysqli("localhost","root","","db_crime_track");

if(isset($_REQUEST["mid"]))
{
    $vwdid=$_REQUEST["mid"];

    $q="DELETE FROM missingFoundLocation WHERE Mperson_id='$vwdid'";
    
    //echo $q;
    $con->query($q);

}
?>
