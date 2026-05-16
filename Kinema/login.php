<?php
include 'db_connect.php'; 

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = $_POST['email'] ?? '';
    $password = $_POST['password'] ?? '';

    // Marrim të dhënat nga databaza
    $sqlStatement = $conn->prepare("SELECT user_id, password, role FROM users WHERE email = ?");
    $sqlStatement->bind_param("s", $email);
    $sqlStatement->execute();
    $rezultati = $sqlStatement->get_result();

    if ($rezultati->num_rows > 0) {
        $user = $rezultati->fetch_assoc();

        // Krahasojmë fjalëkalimin direkt
        if ($password === $user['password']) {
            
            // Nisim sesionin dhe ruajmë të dhënat
            session_start();
            $_SESSION['user_id'] = $user['user_id'];
            $_SESSION['role'] = $user['role'];
            $_SESSION['email'] = $email; // Kjo do të shfaqet te dropdown-i

            // KETU BËHET RIDREJTIMI AUTOMATIK
            if ($user['role'] === 'admin') {
                // Nëse është admin, shkon te paneli i adminit
                header("Location: Admin.php");
            } else {
                // Nëse është klient, kthehet te faqja kryesore e cila do të rifreskohet vetë!
                header("Location: cin.php");
            }
            exit();

        } else {
            echo "Fjalëkalimi është i gabuar!";
        }
    } else {
        echo "Përdoruesi nuk u gjet!";
    }
    $sqlStatement->close();
}
?>