<?php
$con=new mysqli("localhost","root","","iWitness");

if(isset($_REQUEST["uID"]))
    {
        $uID=$_REQUEST["uID"];
        
        $q="SELECT * FROM userRegistration WHERE UID='$uID'";
        
        $data=$con->query($q);
        
        while($odata=$data->fetch_object())
        {
            $qq[]=$odata;
        }
    echo json_encode($qq);
}
?>