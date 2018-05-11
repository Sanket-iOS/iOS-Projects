<?php

$con=new mysqli("localhost","root","","iWitness");

if(isset($_REQUEST["all"]))
    {
        $selectPS="SELECT * FROM psRegistration";
        
        $data=$con->query($selectPS);
        
        while($odata=$data->fetch_object())
        {
            $qq[]=$odata;
        }
    echo json_encode($qq);
}
?>