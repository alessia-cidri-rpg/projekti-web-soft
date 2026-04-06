<?php
$host = "localhost";
$user = "root";
$pass = "";
$db   = "prove_kinema"; // Kujdes: Vendos emrin e saktë që ke në phpMyAdmin

$conn = mysqli_connect($host, $user, $pass, $db);

if (!$conn) {
    die("Lidhja dështoi: " . mysqli_connect_error());
}

mysqli_set_charset($conn, "utf8mb4");

// Ky rresht është opsional, thjesht për ta testuar tani në fillim
echo "Lidhja u krye!"; 
?>