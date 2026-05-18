<?php
$host = "localhost";
$user = "root";
$pass = "";
$db   = "kinema"; // Emri që i vure në phpMyAdmin

// Krijo lidhjen
$conn = mysqli_connect($host, $user, $pass, $db);

// Kontrollo nëse lidhja punon
if (!$conn) {
    die("Lidhja dështoi: " . mysqli_connect_error());
}

// Sigurohu që shkronjat shqipe (ë, ç) të dalin saktë
mysqli_set_charset($conn, "utf8mb4");

// Opsionale: Vetëm për ta testuar në fillim
// echo "Lidhja u krye me sukses!"; 
?>