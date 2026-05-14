<?php
include 'db_connect.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Marrim të dhënat nga forma
    $fullname = $_POST['fullname'] ?? '';
    $email = $_POST['email'] ?? '';
    $password = $_POST['password'] ?? ''; // Tekst i thjeshtë për momentin

    // Kontrollojmë nëse emaili ekziston një herë
    $checkEmail = $conn->prepare("SELECT email FROM users WHERE email = ?");
    $checkEmail->bind_param("s", $email);
    $checkEmail->execute();
    $result = $checkEmail->get_result();

    if ($result->num_rows > 0) {
        echo "<script>alert('Ky email është i regjistruar!'); window.history.back();</script>";
    } else {
        // Ruajmë përdoruesin e ri
        // Supozojmë se tabela i ka kolonat: username (për emrin), email, password
        $sql = "INSERT INTO users (username, email, password) VALUES (?, ?, ?)";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("sss", $fullname, $email, $password);

        if ($stmt->execute()) {
            echo "<script>alert('Regjistrimi u krye me sukses!'); window.location.href='cin.html';</script>";
        } else {
            echo "Gabim: " . $stmt->error;
        }
        $stmt->close();
    }
    $checkEmail->close();
}
?>