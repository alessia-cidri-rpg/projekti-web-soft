<?php
include 'db.php';  // lidhja me databazën

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    $seats = $_POST['seats'] ?? [];

    if (empty($seats)) {
        echo json_encode([
            "status" => "error",
            "message" => "Nuk u zgjodh asnjë vend"
        ]);
        exit;
    }

    // 🔴 Vendet e bllokuara (NDRYSHOJI sipas dëshirës)
    $blockedSeats = [6, 7, 8];

    foreach ($seats as $seat) {
        if (in_array($seat, $blockedSeats)) {
            echo json_encode([
                "status" => "error",
                "message" => "Ky vend është i bllokuar"
            ]);
            exit;
        }
    }

    // 🔍 Kontroll në databazë
    foreach ($seats as $seat) {

        $sqlCheck = $conn->prepare("SELECT is_booked FROM vendi WHERE vendi_id = ?");
        $sqlCheck->bind_param("i", $seat);
        $sqlCheck->execute();
        $result = $sqlCheck->get_result();

        if ($row = $result->fetch_assoc()) {
            if ($row['is_booked'] == 1) {
                echo json_encode([
                    "status" => "error",
                    "message" => "Një nga vendet është i zënë"
                ]);
                exit;
            }
        }

        $sqlCheck->close();
    }

    // ✅ Rezervo vendet
    foreach ($seats as $seat) {

        $sqlUpdate = $conn->prepare("UPDATE vendi SET is_booked = 1 WHERE vendi_id = ?");
        $sqlUpdate->bind_param("i", $seat);
        $sqlUpdate->execute();
        $sqlUpdate->close();
    }

    echo json_encode([
        "status" => "success",
        "message" => "Rezervimi u krye me sukses",
        "seats" => $seats
    ]);
}
?>