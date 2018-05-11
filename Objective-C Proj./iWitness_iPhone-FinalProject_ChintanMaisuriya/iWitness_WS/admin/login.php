<?php
$con=new mysqli("localhost","root","","db_crime_track");

if(isset($_REQUEST["uname"]))
{
    $vuname=$_REQUEST["uname"];
    $vpass=$_REQUEST["pass"];

    $q="SELECT * FROM policestn_reg where Username='$vuname' and Password='$vpass' and status='0'";
    
    $data=$con->query($q);
    
    while($odata=$data->fetch_object())
    {
        $ar[]=$odata;
    }
    echo json_encode($ar);
}
?>
