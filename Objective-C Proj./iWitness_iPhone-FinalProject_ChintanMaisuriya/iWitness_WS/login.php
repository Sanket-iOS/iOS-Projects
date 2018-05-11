<?php
$con=new mysqli("localhost","root","","iWitness");

if(isset($_REQUEST["userName"]))
{
    $vuname=$_REQUEST["userName"];
    $vpass=$_REQUEST["pwd"];

    $logInQ="select * from userRegistration where Username='$vuname' and Password='$vpass'";
    
    $data=$con->query($logInQ);
    
    while($odata=$data->fetch_object())
    {
        $ar[]=$odata;
    }
    echo json_encode($ar);
}
?>
