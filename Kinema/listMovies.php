<?php
include 'db_connect.php';

$sql = "SELECT filmi_id, titulli, genre FROM filmi";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        echo "<tr id='row-".$row['id']."'>";
        echo "<td>#".$row['id']."</td>";
        echo "<td>".$row['title']."</td>";
        echo "<td>".$row['genre']."</td>";
        echo "<td>
                <button class='btn-Kodi' onclick=\"openEditModal('".$row['id']."','".$row['title']."','".$row['genre']."')\">Edit</button>
                <button class='btn-delete' onclick=\"deleteMovie('".$row['id']."','".$row['title']."')\">
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
