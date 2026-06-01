<?php
include 'db_connect.php';

if ($_SERVER["REQUEST_METHOD"] === "POST" && isset($_POST['id'])) {
    $id = intval($_POST['id']); // merr filmi_id

    // fiken  fk, ngaqe lidhen tablta me njera tjr 
    $conn->query("SET FOREIGN_KEY_CHECKS = 0");

    // e fshin nga filmi
    $sql_shqip = "DELETE FROM filmi WHERE filmi_id = ?";
    $stmt = $conn->prepare($sql_shqip);
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $affected = $stmt->affected_rows;
    $stmt->close();


    //foreign keys ndizet
    $conn->query("SET FOREIGN_KEY_CHECKS = 1");

    if ($affected > 0) {
        echo "Movie deleted successfully";
    } else {
        echo "Error: Movie not found or could not be deleted.";
    }
}
$conn->close();
?>