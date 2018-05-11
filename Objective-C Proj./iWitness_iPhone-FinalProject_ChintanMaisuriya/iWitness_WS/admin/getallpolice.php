<?php

$con=new mysqli("localhost","root","","db_crime_track");

if(isset($_REQUEST["pid"]))
    {
        $vpid=$_REQUEST["pid"];

        $q="SELECT name,police_id FROM policeman_info WHERE ps_id='$vpid' and status='0'";
        
        $data=$con->query($q);
        
        while($odata=$data->fetch_object())
        {
            $qq[]=$odata;
        }
    echo json_encode($qq);
}
?>