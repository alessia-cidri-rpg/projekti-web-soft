<?php
include 'db_connect.php';

$sql = "SELECT filmi_id, titulli, posteri FROM filmi WHERE status_id = 1";
$result = $conn->query($sql);

$movies = [];
while($row = $result->fetch_assoc()) {
    $movies[] = $row;
}

echo json_encode($movies);
$conn->close();
?>
