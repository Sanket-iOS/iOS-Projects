<?php

$con=new mysqli("localhost","root","","db_crime_track");

if(isset($_REQUEST["uid"]))
    {
        $vuid=$_REQUEST["uid"];

        $q="SELECT * FROM userinfo WHERE uid='$vuid'";
        
        $data=$con->query($q);
        
        while($odata=$data->fetch_object())
        {
            $qq[]=$odata;
        }
    echo json_encode($qq);
}
?>