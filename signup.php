<?php
include 'db.php'; // Lidhja me databazën

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['username'] ?? '';
    $password = $_POST['password'] ?? '';

    if (empty($username) || empty($password)) {
        echo json_encode([
            "status" => "error",
            "message" => "Plotëso të gjitha fushat"
        ]);
        exit;
    }

    // Kontrollojme nese useri ekziston
    $checkUserExistence = $conn->prepare("SELECT id FROM users WHERE username = ?");
    $checkUserExistence->bind_param("s", $username);
    $checkUserExistence->execute();
    $result = $checkUserExistence->get_result();

    if ($result->num_rows > 0) {
        echo json_encode([
            "status" => "error",
            "message" => "Ky përdorues ekziston tashmë"
        ]);
    } else {
        // Enkript fjalkalimin me hash
        $passwordHash = password_hash($password, PASSWORD_DEFAULT);

        // Vendosim perdoruesin te users
        $insertUser = $conn->prepare("INSERT INTO users (username, password) VALUES (?, ?)");
        $insertUser->bind_param("ss", $username, $passwordHash);

        if ($insertUser->execute()) {
            echo json_encode([
                "status" => "success",
                "message" => "Regjistrimi u krye me sukses"
            ]);
        } else {
            echo json_encode([
                "status" => "error",
                "message" => "Gabim gjatë regjistrimit"
            ]);
        }
        $insertUser->close();
    }
    $checkUserExistence->close();
}
?>