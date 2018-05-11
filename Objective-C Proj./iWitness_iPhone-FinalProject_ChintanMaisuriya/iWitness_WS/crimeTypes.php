<?php

$con=new mysqli("localhost","root","","iWitness");

if(isset($_REQUEST["all"]))
    {
        $q="select * from crimeTypes";
        
        $data=$con->query($q);
        
        while($odata=$data->fetch_object())
        {
            $qq[]=$odata;
        }
    echo json_encode($qq);
}
?>