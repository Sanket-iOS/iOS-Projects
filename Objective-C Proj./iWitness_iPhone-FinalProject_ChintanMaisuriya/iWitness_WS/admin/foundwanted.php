<?php

$con=new mysqli("localhost","root","","db_crime_track");

        $q="SELECT * FROM wanted_person WHERE Wperson_status=0";
        
        $data=$con->query($q);
        
        while($odata=$data->fetch_object())
        {
            $qq[]=$odata;
        }
    echo json_encode($qq);

?>