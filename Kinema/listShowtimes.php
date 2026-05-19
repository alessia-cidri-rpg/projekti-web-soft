<?php
include 'db_connect.php';

// join sallen dhe filmat
$sql = "SELECT s.shfaqja_id, f.titulli, sa.emri AS salla_emri, s.data_ora 
        FROM shfaqja s
        JOIN filmi f ON s.filmi_id = f.filmi_id
        JOIN salla sa ON s.salla_id = sa.salla_id
        ORDER BY s.data_ora ASC";

$result = $conn->query($sql);

if ($result && $result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        // ora pm ose am
        $koha = date('H:i', strtotime($row['data_ora']));
        
        echo "<tr id='row-showtime-".$row['shfaqja_id']."'>";
        echo "<td>".htmlspecialchars($row['titulli'])."</td>";
        echo "<td>".htmlspecialchars($row['salla_emri'])."</td>";
        echo "<td>".$koha."</td>";
        echo "<td><span style='color: #2ecc71;'>Confirmed</span></td>";
        echo "<td>
        <button class='btn-Kodi' onclick='toggleScheduleModal(true)'>Change</button>
         </td>";
        echo "</tr>";
    }
} else {
    echo "<tr><td colspan='5'>No showtimes found</td></tr>";
}
$conn->close();
?>