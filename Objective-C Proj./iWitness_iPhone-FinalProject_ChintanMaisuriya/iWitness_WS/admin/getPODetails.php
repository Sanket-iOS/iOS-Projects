<?php

$con=new mysqli("localhost","root","","iWitness");

if(isset($_POST["poID"]))
    {
        $po=$_POST["poID"];

        $q="SELECT * FROM policeOfficialsInfo WHERE poID='$po'";
        
        $data=$con->query($q);
        
        while($odata=$data->fetch_object())
        {
            $qq[]=$odata;
        }
    echo json_encode($qq);
}
?>