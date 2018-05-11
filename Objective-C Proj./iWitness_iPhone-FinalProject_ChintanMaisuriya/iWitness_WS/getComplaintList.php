<?php

$con=new mysqli("localhost","root","","iWitness");

if(isset($_POST["userID"]))
    {
        $cUID=$_POST["userID"];

        $q="SELECT Complaint.cID,Complaint.UID,Complaint.psID,Complaint.poID,Complaint.cDetails,Complaint.locationAddress,Complaint.latitude,Complaint.longitude,Complaint.cDate,Complaint.cTime,Complaint.cIMG_URLs,Complaint.cStatus,crimeTypes.ctName FROM Complaint LEFT JOIN crimeTypes ON Complaint.ctID=crimeTypes.ctID where UID='$cUID 'ORDER BY Complaint.cDate DESC, Complaint.cTime DESC";
        
        $data=$con->query($q);
        
        while($odata=$data->fetch_object())
        {
            $qq[]=$odata;
        }
    echo json_encode($qq);
}
?>