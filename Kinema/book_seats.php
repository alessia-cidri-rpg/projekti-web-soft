<?php
header("Content-Type: application/json");
session_start(); 
include 'db_connect.php'; // Lidhja jote me MySQL

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    // 1. Kontrollojmë nëse përdoruesi është i loguar (nga tabela jote 'users')
    $user_id = $_SESSION['user_id'] ?? null;
    if (!$user_id) {
        echo json_encode(["status" => "error", "message" => "Duhet të jeni i loguar për të rezervuar!"]);
        exit;
    }

    // 2. Marrim të dhënat që dërgon JavaScript (PjesaJS.js)
    $seats = $_POST['seats'] ?? []; // Ky është një masiv me ID-të e vendeve (vendi_id)
    $shfaqja_id = $_POST['shfaqja_id'] ?? null; // Na duhet shfaqja_id dhe jo thjesht filmi

    if (empty($seats) || !$shfaqja_id) {
        echo json_encode(["status" => "error", "message" => "Mungojnë ulëset ose shfaqja e përzgjedhur!"]);
        exit;
    }

    // 3. KONTROLLI: A është ndonjë nga këto vende i rezervuar ndërkohë për këtë shfaqje?
    foreach ($seats as $vendi_id) {
        $sqlCheck = $conn->prepare("
            SELECT rv.vendi_id 
            FROM rezervimi_vendi rv
            JOIN rezervimi r ON rv.rezervimi_id = r.rezervimi_id
            WHERE r.shfaqja_id = ? AND rv.vendi_id = ?
        ");
        $sqlCheck->bind_param("ii", $shfaqja_id, $vendi_id);
        $sqlCheck->execute();
        $result = $sqlCheck->get_result();

        if ($result->num_rows > 0) {
            echo json_encode(["status" => "error", "message" => "Një nga vendet e zgjedhura sapo u rezervua nga dikush tjetër!"]);
            exit;
        }
        $sqlCheck->close();
    }

    // 4. PROCESI I REZERVIMIT (Ndodh në dy hapa për shkak të strukturës tënde të saktë)
    
    // Hapi A: Krijojmë një rekord të ri te tabela `rezervimi`
    $sqlRezervimi = $conn->prepare("INSERT INTO rezervimi (user_id, shfaqja_id) VALUES (?, ?)");
    $sqlRezervimi->bind_param("ii", $user_id, $shfaqja_id);
    
    if ($sqlRezervimi->execute()) {
        // Kapim ID-në e rezervimit që sapo u krijua
        $rezervimi_id = $conn->insert_id;
        $sqlRezervimi->close();

        // Hapi B: Fusim vendet e zgjedhura te tabela ndërmjetëse `rezervimi_vendi`
        foreach ($seats as $vendi_id) {
            $sqlVendi = $conn->prepare("INSERT INTO rezervimi_vendi (rezervimi_id, vendi_id) VALUES (?, ?)");
            $sqlVendi->bind_param("ii", $rezervimi_id, $vendi_id);
            $sqlVendi->execute();
            $sqlVendi->close();
        }

        echo json_encode([
            "status" => "success",
            "message" => "Rezervimi u krye me sukses!",
            "seats" => $seats
        ]);

    } else {
        echo json_encode(["status" => "error", "message" => "Gabim gjatë krijimit të rezervimit."]);
    }
}
?>