<?php
include 'db_connect.php'; 

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Marrim nha html te dhenat
    $email = $_POST['email'] ?? ''; 
    $password = $_POST['password'] ?? ''; 
    $role = 'klient'; // automatikisht dmth

    if (empty($email) || empty($password)) {
        die("Ju lutem plotësoni të gjitha fushat!");
    }

    // a ekzisiton
    $checkEmail = $conn->prepare("SELECT user_id FROM users WHERE email = ?");
    $checkEmail->bind_param("s", $email);
    $checkEmail->execute();
    $result = $checkEmail->get_result();

    if ($result->num_rows > 0) {
        die("This email is already registred. Please use a different email or log in.");
    }
    $checkEmail->close();

    // ruhet
    $stmt = $conn->prepare("INSERT INTO users (email, password, role) VALUES (?, ?, ?)");
    $stmt->bind_param("sss", $email, $password, $role);

    if ($stmt->execute()) {
        // meqe id auto inkremetn 
        $new_user_id = $conn->insert_id;

        // logini t jete austomatik
        session_start();
        $_SESSION['user_id'] = $new_user_id;
        $_SESSION['role'] = $role;
        $_SESSION['email'] = $email; // Kjo do të sinkronizohet me dropdown-in dhe profilin

        // te home page dmth
        header("Location: cin.php");
        exit();
    } else {
        echo "Error while registration: " . $conn->error;
    }

    $stmt->close();
}
?>