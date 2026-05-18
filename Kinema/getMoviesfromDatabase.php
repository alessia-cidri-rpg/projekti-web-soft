<?php
include 'db_connect.php';

// Filma nowplaying (Status 1)
$sqlActive = "SELECT filmi_id, titulli, posteri FROM filmi WHERE status_id = 1";
$resultActive = $conn->query($sqlActive);

$activeMovies = [];
while($row = $resultActive->fetch_assoc()) {
    $activeMovies[] = $row;
}

// Filma coming (Status 2)
$sqlComing = "SELECT filmi_id, titulli, posteri FROM filmi WHERE status_id = 2";
$resultComing = $conn->query($sqlComing);

$comingMovies = [];
while($row = $resultComing->fetch_assoc()) {
    $comingMovies[] = $row;
}

echo json_encode([
    "active" => $activeMovies,
    "coming" => $comingMovies
]);

$conn->close();
?>