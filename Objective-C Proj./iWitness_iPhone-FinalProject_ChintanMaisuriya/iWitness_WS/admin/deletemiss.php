<?php
$con=new mysqli("localhost","root","","db_crime_track");

if(isset($_REQUEST["did"]))
{
    $vwdid=$_REQUEST["did"];

    $q="DELETE FROM missing_person WHERE Mperson_id='$vwdid'";
    
    //echo $q;
    $con->query($q);

}
?>
