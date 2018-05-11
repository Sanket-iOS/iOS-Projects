<?php
$con=new mysqli("localhost","root","","iWitness");

if(isset($_REQUEST["all"]))
    {
        $selectWP="select * from wantedPersons where wpStatus='1'";
        
        $data=$con->query($selectWP);
        
        while($odata=$data->fetch_object())
        {
            $qq[]=$odata;
        }
    echo json_encode($qq);
}
?>