<?php
include 'db_connect.php'; 

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = $_POST['email'] ?? '';
    $password = $_POST['password'] ?? '';

    // merren nga databaza 
    $sqlStatement = $conn->prepare("SELECT user_id, password, role FROM users WHERE email = ?");
    $sqlStatement->bind_param("s", $email);
    $sqlStatement->execute();
    $rezultati = $sqlStatement->get_result();

    if ($rezultati->num_rows > 0) {
        $user = $rezultati->fetch_assoc();

        // passwordi t krahasohet 
        if ($password === $user['password']) {
            
            // niset sesioni qe t ruhen t dhenat 
            session_start();
            $_SESSION['user_id'] = $user['user_id'];
            $_SESSION['role'] = $user['role'];
            $_SESSION['email'] = $email; // Kjo do të shfaqet te dropdown-i

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
            echo "Wrong password!";
        }
    } else {
        echo "User not found!";
    }
    $sqlStatement->close();
}
?>