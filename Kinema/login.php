<?php
include 'db_connect.php'; 

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = $_POST['email'] ?? '';
    $password = $_POST['password'] ?? '';

    // SHTUAM: id dhe username te SELECT që t'i kemi më poshtë
    $sqlStatement = $conn->prepare("SELECT user_id, password, role FROM users WHERE email = ?");
    
    // RREGULLUAM: Nga $username në $email
    $sqlStatement->bind_param("s", $email);
    $sqlStatement->execute();
    $rezultati = $sqlStatement->get_result();

    if ($rezultati->num_rows > 0) {
        $user = $rezultati->fetch_assoc();

        // Gjej këtë rresht:
// if (password_verify($password, $user['password'])) {

// Zëvendësoje me këtë:
if ($password === $user['password']) {
    // Tani kodi thjesht krahason tekstin që shkruan ti me atë që është në DB
    session_start();
    $_SESSION['user_id'] = $user['user_id'];
    header("Location: Admin.php");
    exit();
} else {
            echo json_encode([
    "status" => "success",
    "message" => "Login i suksesshëm",
    "user_id" => [
        "user_id" => $user['user_id'],
        "role" => $user['role'] // <--- Kjo është shpëtimi!
    ]
]);
        }
    } else {
        echo json_encode(["status" => "error", "message" => "Përdoruesi nuk u gjet"]);
    }
    $sqlStatement->close();
}
?>