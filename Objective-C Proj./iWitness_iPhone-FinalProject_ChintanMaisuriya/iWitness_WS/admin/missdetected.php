<?php

$con=new mysqli("localhost","root","","db_crime_track");

if(isset($_REQUEST["pid"]))
    {
        $vpid=$_REQUEST["pid"];

        $q="SELECT * FROM missingFoundLocation WHERE ps_id='$vpid'";
        
        $data=$con->query($q);
        
        while($odata=$data->fetch_object())
        {
            $qq[]=$odata;
        }
    echo json_encode($qq);
    }
?>