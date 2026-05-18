<?php
include 'db_connect.php';

if ($_SERVER["REQUEST_METHOD"] === "POST" && isset($_POST['id'])) {
    $id = intval($_POST['id']); // merr filmi_id si numër

    $sql = "DELETE FROM filmi WHERE filmi_id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $id);

    if ($stmt->execute()) {
        echo "Movie deleted successfully";
    } else {
        echo "Error deleting movie: " . $stmt->error;
    }

    $stmt->close();
}
$conn->close();
?>