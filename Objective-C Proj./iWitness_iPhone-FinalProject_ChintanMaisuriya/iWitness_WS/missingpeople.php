<?php
$con=new mysqli("localhost","root","","iWitness");

if(isset($_REQUEST["all"]))
    {
        $selectMP="select * from missingPerson where mpStatus='1'";
        
        $data=$con->query($selectMP);
        
        while($odata=$data->fetch_object())
        {
            $qq[]=$odata;
        }
    echo json_encode($qq);
}
?>