<?php
    $con=new mysqli("localhost","root","","iWitness");
    
    if(isset($_REQUEST["regMobNo"]))
    {
        $uMNo=$_REQUEST["regMobNo"];
        $str="select Password from userRegistration where UContact='$uMNo'";
        
        $data=$con->query($str);
        
        while($odata=$data->fetch_object())
        {
            $ar[]=$odata;
        }
        echo json_encode($ar);
    }
?>
