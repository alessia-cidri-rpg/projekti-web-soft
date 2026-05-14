<?php
include 'db_connect.php';

//Filma nowplaying
$sqlActive = "SELECT filmi_id, titulli, genre, poster FROM filmi WHERE status = 1";
$resultActive = $conn->query($sqlActive);

$activeMovies = [];
if ($resultActive->num_rows > 0) {
    while($row = $resultActive->fetch_assoc()) {
        $activeMovies[] = $row;
    }
}

//Filma coming
$sqlComing = "SELECT filmi_id, titulli, genre, poster FROM filmi WHERE status = 2";
$resultComing = $conn->query($sqlComing);

$comingMovies = [];
if ($resultComing->num_rows > 0) {
    while($row = $resultComing->fetch_assoc()) {
        $comingMovies[] = $row;
    }
}

// Kthe JSON me dy grupe
echo json_encode([
    "active" => $activeMovies,
    "coming" => $comingMovies
]);

$conn->close();
?>
