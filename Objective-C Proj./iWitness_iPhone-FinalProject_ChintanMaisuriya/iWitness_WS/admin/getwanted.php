<?php

$con=new mysqli("localhost","root","","db_crime_track");

if(isset($_REQUEST["wid"]))
    {
        $vwid=$_REQUEST["wid"];

        $q="SELECT * FROM wanted_person WHERE Wperson_id='$vwid'";
        
        $data=$con->query($q);
        
        while($odata=$data->fetch_object())
        {
            $qq[]=$odata;
        }
    echo json_encode($qq);
}
?>