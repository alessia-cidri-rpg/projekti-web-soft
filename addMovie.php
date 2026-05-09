<?php
include 'db_connect.php';// lidhja me db

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $titulli = $_POST['titulli'];
    $genre = $_POST['genre'];
    $kohezgjatja = $_POST['kohezgjatja'];
    $status = $_POST['status'];

    // query per shtim filmi
    $sql = "INSERT INTO filmi (titulli, genre, kohezgjatja, status) VALUES (?, ?, ?, ?)";
    $sqlStatement = $conn->prepare($sql);
    $sqlStatement->bind_param("ssss", $titulli, $genre, $kohezgjatja, $status);

    if ($sqlStatement->execute()) {
        echo "Movie added successfully!";
        header("Location: Admin.html"); // perdoruesi shkon auto tek faqja adminit
        exit;
    } else {
        echo "Error: " . $sqlStatement->error;
    }
    $sqlStatement->close();
}
$conn->close();
?>
