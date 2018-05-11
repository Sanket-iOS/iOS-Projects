<?php

$con=new mysqli("localhost","root","","db_crime_track");

if(isset($_REQUEST["mid"]))
    {
        $vwid=$_REQUEST["mid"];

        $q="SELECT * FROM missing_person WHERE Mperson_id='$vwid'";
        
        $data=$con->query($q);
        
        while($odata=$data->fetch_object())
        {
            $qq[]=$odata;
        }
    echo json_encode($qq);
}
?>