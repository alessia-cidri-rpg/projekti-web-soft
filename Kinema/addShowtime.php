<?php
include 'db_connect.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    
    // te dhenat marrja
    $filmi_id = mysqli_real_escape_string($conn, $_POST['filmi_id']);
    $salla_id = mysqli_real_escape_string($conn, $_POST['salla_id']);
    
    // merret ora dhe data nga formi
    $raw_date = $_POST['data_ora']; 

    if (!empty($filmi_id) && !empty($salla_id) && !empty($raw_date)) {
        
        // nga htmlja ne formatin e sqls
        $data_ora = date('Y-m-d H:i:s', strtotime($raw_date));
        $data_ora = mysqli_real_escape_string($conn, $data_ora);

        
        $query = "INSERT INTO shfaqja (filmi_id, salla_id, data_ora) 
                  VALUES ('$filmi_id', '$salla_id', '$data_ora')";

        if (mysqli_query($conn, $query)) {
            
            header("Location: admin.php");
            exit();
        } else {
            echo "Error! " . mysqli_error($conn);
        }
    } else {
        echo "Please fill in all fields!";
    }
} else {
    header("Location: admin.php");
    exit();
}
?>