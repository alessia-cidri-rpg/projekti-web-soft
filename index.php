<?php
include 'db.php'; // Lidhja me DB

// Marrim filmat bashkë me emrin e regjisorit
$sql = "SELECT filmi.titulli, regjisor.regjisor_emri 
        FROM filmi
        INNER JOIN regjisor ON filmi.regjisor_id = regjisor.regjisor_id";

$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html>
<head>
    <title>Lista e Filmave</title>
</head>
<body>
    <h1>Filmat tanë</h1>
    <div class="movie-container">
        <?php if ($result->num_rows > 0): ?>
            <?php while($row = $result->fetch_assoc()): ?>
                <div class="movie-card">
                    <h3><?php echo $row['title']; ?></h3>
                    <p>Regjisori: <?php echo $row['regjisor_emri']; ?></p>
                    <p>Viti: <?php echo $row['data']; ?></p>
                </div>
                <hr>
            <?php endwhile; ?>
        <?php else: ?>
            <p>Nuk ka filma në databazë.</p>
        <?php endif; ?>
    </div>
</body>
</html>