<?php
include 'db_connect.php'; // lidhja me databazen

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $titulli = $_POST['titulli'];
    $regjisor_id = $_POST['regjisor_id'];
    //$genre = $_POST['genre'];
    $kohezgjatja = $_POST['kohezgjatja'];
    $data = $_POST['data'];
    $status_id = $_POST['status_id'];
    $pershkrimi = $_POST['pershkrimi'];
    $posteri = $_POST['posteri'];
    $header_poster = $_POST['header_poster'];
    $data_kinema = $_POST['data_kinema'];

    // query me placeholders
    $sql = "INSERT INTO filmi 
        (titulli, regjisor_id, kohezgjatja, data, status_id, pershkrimi, posteri, header_poster, data_kinema) 
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

    $queryStatement = $conn->prepare($sql);
    $queryStatement->bind_param("sssisssss", 
        $titulli,    $regjisor_id ,     $kohezgjatja ,    $data,    $status_id ,    $pershkrimi,    $posteri ,    $header_poster,    $data_kinema
    );

    if ($queryStatement->execute()) {
        header("Location: Admin.html");//Kthim tek faqja Adminit
        exit;
    } else {
        echo "Error: " . $queryStatement->error;
    }

    $queryStatement->close();
}
$conn->close();
?>
