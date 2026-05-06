<?php
include 'db.php';  //Lidhja me db

// Kontrollo nëse kërkesa është POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {  //Merr te dhenat nga forma post
    $username = $_POST['username'] ?? '';
    $password = $_POST['password'] ?? '';

    // Pergatit pyetjen per db
    $sqlStatement = $conn->prepare("SELECT id, username, password FROM users WHERE username = ?");
    $sqlStatement->bind_param("s", $username);
    $sqlStatement->execute();
    $rezultati = $sqlStatement->get_result();

    if ($rezultati->num_rows > 0) {
        $user = $rezultati->fetch_assoc();

        // Kontrollo fjalkalimin
        if (password_verify($password, $user['password'])) {
            // Sakte
            echo json_encode([
                "status" => "success",
                "message" => "Login i suksesshëm",
                "user" => [
                    "id" => $user['id'],
                    "username" => $user['username']
                ]
            ]);
        } else {
            // Gabuar
            echo json_encode([
                "status" => "error",
                "message" => "Fjalëkalimi është i pasaktë"
            ]);
        }
    } else {
        // Useri nuk ekziston
        echo json_encode([
            "status" => "error",
            "message" => "Përdoruesi nuk u gjet"
        ]);
    }

    $sqlStatement->close();
}
?>