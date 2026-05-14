<?php
include 'db_connect.php';

$sql = "SELECT filmi_id, titulli FROM filmi";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        echo "<tr id='row-".$row['filmi_id']."'>";
        echo "<td>#".$row['filmi_id']."</td>";
        echo "<td>".$row['titulli']."</td>";
        echo "<td>
                <button class='btn-Kodi' onclick=\"openEditModal('".$row['filmi_id']."','".$row['titulli']."')\">Edit</button>
                <button class='btn-delete' onclick=\"deleteMovie('".$row['filmi_id']."','".$row['titulli']."')\">
                    <i class='fa fa-trash'></i> Delete
                </button>
              </td>";
        echo "</tr>";
    }
} else {
    echo "<tr><td colspan='4'>No movies found</td></tr>";
}
$conn->close();
?>
