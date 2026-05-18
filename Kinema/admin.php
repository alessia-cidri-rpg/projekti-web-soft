<?php
include 'db_connect.php';
session_start();

// faqja per ate qe eshte guest le t themi
if (!isset($_SESSION['role']) || $_SESSION['role'] !== 'admin') {
    header("Location: cin.php");
    exit();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Velora Admin | Cinema Management</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="Admin.css">
    <link rel="apple-touch-icon" sizes="180x180" href="favicon/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="favicon/favicon-16x16.png">
    <link rel="shortcut icon" href="favicon/favicon.ico">
    <link rel="manifest" href="favicon/site.webmanifest">
</head>
<body>

    <!-- SIDEBAR -->
    <aside class="sidebar">
        <h2>Velora Admin</h2>
        <nav class="sidebar-nav">
            <a href="#" class="active" onclick="showSection('movies')"><i class="fa fa-film"></i> Movies</a>
            <a href="#" onclick="showSection('halls')"><i class="fa fa-couch"></i> Halls & Seats</a>
            <a href="#" onclick="showSection('schedule')"><i class="fa fa-calendar-alt"></i> Schedule</a>
            <a href="#" onclick="showSection('crm')"><i class="fa fa-users"></i> Customers</a>
            
            <a href="cin.php" style="margin-top: auto; color: var(--primary); border-top: 1px solid #222; padding-top: 20px;">
                <i class="fa fa-home"></i> Back to Site
            </a>
        </nav>
    </aside>

    <main class="main-content">
        <!-- SECTION 1: MOVIES -->
        <div id="movies-sec">
            <div style="display: flex; justify-content: space-between; align-items: center; ">
                <h2 class="section-title">Movie Management</h2>
                <button class="btn-add" onclick="toggleModal(true)">+ Add New Movie</button>
            </div>
            <div class="stats-grid">
                <div class="stat-card"><h3>Total Films</h3><p>28</p></div>
                <div class="stat-card"><h3>Now Showing</h3><p>12</p></div>
                <div class="stat-card"><h3>Coming Soon</h3><p>6</p></div>
            </div>
            <div class="admin-table-container">
                <table class="admin-table">
                    <thead>
                        <tr><th>ID</th><th>Title</th><th>Genre</th><th>Actions</th></tr>
                    </thead>
                    <tbody id="moviesTableBody">
                        <div class="movie-table">
    
       
        
                    </tbody>
                </table>
            </div>
        </div>

        <!-- SECTIONS TJERA (Mbeten te njejta) -->
        <div id="halls-sec" style="display:none">
            <h2 class="section-title">Halls & Seats Management</h2>
            <div class="stats-grid">
                <div class="stat-card"><h3>Hall 1 (IMAX)</h3><p>32 Seats</p><button class="btn-Kodi" style="margin-top:15px">Manage Layout</button></div>
                </div>
        </div>
        <div id="schedule-sec" style="display:none;">
            <h2 class="section-title">Showtime Schedule</h2>
            <div class="admin-table-container">
                <table class="admin-table">
                    <thead><tr><th>Movie Title</th><th>Hall</th><th>Time</th><th>Status</th><th>Action</th></tr></thead>
                    <tbody><tr><td>Dune: Part Two</td><td>Hall 1</td><td>19:30</td><td>Confirmed</td><td><button class="btn-Kodi">Change</button></td></tr></tbody>
                </table>
            </div>
         <button class="btn-add" style="margin-top:25px">+ Add New Showtime</button>
        </div>
        <div id="crm-sec" style="display:none;">
            <h2 class="section-title">Customer Database (CRM)</h2>
            <div class="admin-table-container">
                <table class="admin-table">
                    <thead><tr><th>User ID</th><th>Full Name</th><th>Email Address</th><th>Status</th></tr></thead>
                    <tbody><tr><td>#USR-992</td><td>No name</td><td>noName@email.com</td><td style="color:#28a745">Active</td></tr></tbody>
                </table>
            </div>
        </div>
    </main>

    <!-- MODAL PER SHTIMIN / EDITIMIN E FILMAVE -->
<form id="addMovieModal" class="modal-overlay" method="post" action="addMovie.php">
    <div class="modal-content" style="max-width: 700px; max-height: 85vh; overflow-y: auto;">
        <h2 id="modalTitle" style="color:var(--primary); margin-top:0">Add New Movie</h2>
        
        <div class="modal-grid">
            <div class="input-group">
                <label>Movie Title</label>
                <input type="text" placeholder="Title" name="titulli" required>
            </div>

<div class="input-group">
    <label>Director</label>
    <select name="regjisor_id">
        <option value="">Select Director</option>
        <?php
        $regj_q = $conn->query("SELECT regjisor_id, regjisor_emri FROM regjisor ORDER BY regjisor_emri ASC");
        while($regj = $regj_q->fetch_assoc()) {
            echo '<option value="'.$regj['regjisor_id'].'">'.$regj['regjisor_emri'].'</option>';
        }
        ?>
    </select>
</div>

<div class="input-group">
    <label>Or Add New Director (if not in the list):</label>
    <input type="text" name="regjisor_i_ri" placeholder="P.sh. Quentin Tarantino">
</div>

            <div class="input-group">
                <label>Duration</label>
                <input type="text" placeholder="HH:MM:SS" name="kohezgjatja" required>
            </div>

            <div class="input-group">
                <label>Year</label>
                <input type="number" placeholder="2026" name="data" required>
            </div>

<div class="input-group">
    <label>Status</label>
    <select name="status_id" required>
        <option value="1">Now Playing</option>
        <option value="2">Coming Soon</option>
    </select>
</div>

            <div class="input-group">
                <label>Cinema Release Date</label>
                <input type="date" name="data_kinema" required>
            </div>
        </div>

        <label style="font-weight: bold; margin-top: 15px; display: block;">Select Genres</label>
        <div style="display: grid; grid-template-columns: repeat(3, 1fr); gap: 10px; margin-bottom: 15px; background: #222; padding: 10px; border-radius: 5px;">
            <?php
            $zhanri_q = $conn->query("SELECT zhanri_id, zhanri_emri FROM zhanri ORDER BY zhanri_emri ASC");
            while($zh = $zhanri_q->fetch_assoc()) {
                echo '<label style="color: white; cursor:pointer;"><input type="checkbox" name="zhanret[]" value="'.$zh['zhanri_id'].'"> '.$zh['zhanri_emri'].'</label>';
            }
            ?>
        </div>

        <label style="font-weight: bold; margin-top: 15px; display: block;">Select Cast / Actors</label>
        <div style="display: grid; grid-template-columns: repeat(3, 1fr); gap: 10px; margin-bottom: 15px; background: #222; padding: 10px; border-radius: 5px; max-height: 120px; overflow-y: auto;">
            <?php
            $aktore_q = $conn->query("SELECT aktor_id, aktor_emri FROM aktore ORDER BY aktor_emri ASC");
            while($ak = $aktore_q->fetch_assoc()) {
                echo '<label style="color: white; cursor:pointer;"><input type="checkbox" name="aktoret[]" value="'.$ak['aktor_id'].'"> '.$ak['aktor_emri'].'</label>';
            }
            ?>
        </div>

        <div class="input-group" style="margin-top: 10px;">
    <label>Add New Actors (if not in the list above):</label>
    <input type="text" name="aktore_te_rinj" placeholder="P.sh. Robert Downey Jr., Scarlett Johansson">
</div>

        <label>Description</label>
        <textarea rows="3" placeholder="Movie description..." name="pershkrimi" required></textarea>

        <div class="modal-grid">
            <div class="input-group">
                <label>Poster URL</label>
                <input type="text" name="posteri" placeholder="poster.jpg" required>
            </div>
            <div class="input-group">
                <label>Header URL</label>
                <input type="text" name="header_poster" placeholder="header.jpg" required>
            </div>
        </div>

        <div style="display:flex; gap:10px; margin-top:20px;">
            <button type="submit" class="btn-add" style="flex:1; justify-content:center;">Save Movie</button>
            <button type="reset" onclick="window.location.href='admin.php'" style="flex:1; background:#333; color:white; border:none; border-radius:5px; cursor:pointer;">Cancel</button>
        </div>
    </div>
</form>
        ...
    <script src="Admin.js"></script>
    <script> // Ngarko filmat sapo faqja hapet
    document.addEventListener("DOMContentLoaded", () => {
        loadMovies();
    });

    function loadMovies() {
        fetch("listMovies.php")
            .then(response => response.text())
            .then(html => {
                document.getElementById("moviesTableBody").innerHTML = html;
            })
            .catch(error => console.error("Error loading movies:", error));
    }
    </script>
</body>
</html>