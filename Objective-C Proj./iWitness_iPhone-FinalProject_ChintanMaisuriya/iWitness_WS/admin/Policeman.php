<?php
$con=new mysqli("localhost","root","","db_crime_track");

if(isset($_REQUEST["all"]))
    {
        $q="select * from policeman_info where and status='0'";
        
        $data=$con->query($q);
        
        while($odata=$data->fetch_object())
        {
            $qq[]=$odata;
        }
    echo json_encode($qq);
}
?>