<?php
$host = "localhost";
$user = "root";
$pass = "";
$db   = "kinema"; //databaza emri

// krijo lidhjen
$conn = mysqli_connect($host, $user, $pass, $db);

// kontrollo nese lidhja punon
if (!$conn) {
    die("Failed " . mysqli_connect_error());
}

// per shkronjat vecanta
mysqli_set_charset($conn, "utf8mb4");
?>