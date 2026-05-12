<?php
include 'db_connect.php'; // lidhja me databazen

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $title = $_POST['title'];
    $director = $_POST['director'];
    $genre = $_POST['genre'];
    $duration = $_POST['duration'];
    $year = $_POST['year'];
    $status = $_POST['status'];
    $description = $_POST['description'];
    $poster = $_POST['poster'];
    $header = $_POST['header'];
    $release_date = $_POST['release_date'];

    // query me placeholders
    $sql = "INSERT INTO filmi 
        (titulli, regjisor, zhanri, kohezgjatja, data, status, pershkrimi, posteri, header, data_kinema) 
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    $queryStatement = $conn->prepare($sql);
    $queryStatement->bind_param("ssssisssss", 
        $title, $director, $genre, $duration, $year, $status, $description, $poster, $header, $release_date
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
