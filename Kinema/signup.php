<?php
include 'db_connect.php'; 

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Marrim të dhënat nga forma HTML
    // Kujdes: Kemi hequr username-in sipas kërkesës tënde, përdoret vetëm email dhe password
    $email = $_POST['email'] ?? ''; 
    $password = $_POST['password'] ?? ''; 
    $role = 'klient'; // Çdo përdorues që regjistrohet vetë, bëhet automatikisht klient

    if (empty($email) || empty($password)) {
        die("Ju lutem plotësoni të gjitha fushat!");
    }

    // 1. Kontrollojmë nëse ky email ekziston një herë në databazë
    $checkEmail = $conn->prepare("SELECT user_id FROM users WHERE email = ?");
    $checkEmail->bind_param("s", $email);
    $checkEmail->execute();
    $result = $checkEmail->get_result();

    if ($result->num_rows > 0) {
        die("This email is already registred. Please use a different email or log in.");
    }
    $checkEmail->close();

    // 2. Ruajmë përdoruesin e ri në databazë (Fjalëkalimi ruhet direkt siç e vendose te logini)
    $stmt = $conn->prepare("INSERT INTO users (email, password, role) VALUES (?, ?, ?)");
    $stmt->bind_param("sss", $email, $password, $role);

    if ($stmt->execute()) {
        // Marrim ID-në që sapo krijoi databaza për këtë klient të ri
        $new_user_id = $conn->insert_id;

        // 3. LOGIMI AUTOMATIK: Nisim sesionin dhe i ruajmë të dhënat direkt
        session_start();
        $_SESSION['user_id'] = $new_user_id;
        $_SESSION['role'] = $role;
        $_SESSION['email'] = $email; // Kjo do të sinkronizohet me dropdown-in dhe profilin

        // 4. RIDREJTIMI: E dërgojmë direkt te faqja kryesore e loguar
        header("Location: cin.php");
        exit();
    } else {
        echo "Error while registration: " . $conn->error;
    }

    $stmt->close();
}
?>