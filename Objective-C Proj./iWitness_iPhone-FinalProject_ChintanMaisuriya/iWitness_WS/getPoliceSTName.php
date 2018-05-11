<?php

$con=new mysqli("localhost","root","","iWitness");

if(isset($_POST["pSTID"]))
    {
        $cPSID=$_POST["pSTID"];

        $q="SELECT psName FROM psRegistration WHERE psID='$cPSID'";
        
        $data=$con->query($q);
        
        while($odata=$data->fetch_object())
        {
            $qq[]=$odata;
        }
    echo json_encode($qq);
}
?>