<?php
include 'db_connect.php'; 

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = trim($_POST['email'] ?? '');
    $password = trim($_POST['password'] ?? '');

    // check mos jane lene bosh fushat, para se te komunikoje me databazen
    if (empty($email) || empty($password)) {
        header("Location: cin.php?error=empty_fields");
        exit();
    }

    // merren nga databaza 
    $sqlStatement = $conn->prepare("SELECT user_id, password, role FROM users WHERE email = ?");
    $sqlStatement->bind_param("s", $email);
    $sqlStatement->execute();
    $rezultati = $sqlStatement->get_result();

    if ($rezultati->num_rows > 0) {
        $user = $rezultati->fetch_assoc();

        // passwordi t krahasohet 
        if ($password === $user['password']) {
            
            // te niset sesioni qe t ruhen t dhenat 
            session_start();
            $_SESSION['user_id'] = $user['user_id'];
            $_SESSION['role'] = $user['role'];
            $_SESSION['email'] = $email; // per dropdownin

            // kushti per amdinin
            if ($user['role'] === 'admin') {
                // qe nese admin ta kete panelin
                header("Location: Admin.php");
            } else {
                // nese jo admin, jo panel 
                header("Location: cin.php");
            }
            exit();

        } else {
            // ne rastet e gabimit ne passwordit gabim, rikthim
            header("Location: cin.php?error=wrong_password");
            exit();
        }
    } else {
        // same edhe per user not found
        header("Location: cin.php?error=user_not_found");
        exit();
    }
    $sqlStatement->close();
}
?>