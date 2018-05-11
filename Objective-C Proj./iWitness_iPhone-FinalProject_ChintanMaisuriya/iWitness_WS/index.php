<?php
	
    
    $username=$_POST['username'];
    $password=$_POST['password'];
    //$file1=$_POST['file'];
    
    $uploaddir = 'uploads/';
    $file = basename($_FILES['file']['name']);
    $uploadfile = $uploaddir . $file;
    
    if (move_uploaded_file($_FILES['file']['tmp_name'], $uploadfile)) {
       // sendResponse(200, 'Upload Successful');
        return true;
    }
   // sendResponse(403, 'Upload Failed');
    return false;
    
    ?>

