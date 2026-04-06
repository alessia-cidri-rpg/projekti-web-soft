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
$pyetja = "SELECT * FROM filma"; 
$rezultati = mysqli_query($conn, $pyetja);
$filmi = mysqli_fetch_assoc($rezultati);

echo "Filmi i parë në databazë është: " . $filmi['titulli'];
?>