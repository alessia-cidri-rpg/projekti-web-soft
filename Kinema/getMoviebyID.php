<?php
include 'db.php'; // lidhja me databazen

$id = intval($_GET['id']);
$sql = "SELECT * FROM filmi WHERE filmi_id = $id";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    echo json_encode($result->fetch_assoc());
} else {
    echo json_encode(null);
}
?>
