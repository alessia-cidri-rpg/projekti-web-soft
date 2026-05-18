// Logjika e nderrimit te tabeve
function showSection(id) {
    const sections = ['movies', 'halls', 'schedule', 'crm'];
    sections.forEach(s => {
        document.getElementById(s + '-sec').style.display = 'none';
    });
    document.getElementById(id + '-sec').style.display = 'block';

    const links = document.querySelectorAll('.sidebar-nav a');
    links.forEach(l => l.classList.remove('active'));
    
    if (event && event.currentTarget) {
        event.currentTarget.classList.add('active');
    }
}
// Per add showtime
function toggleScheduleModal(show) {
    const modal = document.getElementById("scheduleModal");
    if (modal) {
        modal.style.display = show ? 'flex' : 'none';
    }
}


// Hapja/Mbyllja e Modalit (per Add New)
function toggleModal(show) {
    const modal = document.getElementById('addMovieModal');
    modal.style.display = show ? 'flex' : 'none';
    
    if(show) {
        document.getElementById('modalTitle').innerText = "Add New Movie";
        document.getElementById('saveBtn').innerText = "Save Movie";
        clearForm();
    }
}




// Shto këtë te window.onclick-u yt ekzistues që modali të mbyllet nëse klikohet jashtë tij (në hapësirën e zezë)
window.addEventListener('click', function(event) {
    const modal = document.getElementById("scheduleModal");
    if (event.target === modal) {
        toggleScheduleModal(false);
    }
});


// Hapja e Modalit per Editim
// Kemi shtuar parametrin 'director' ne fund
function openEditModal(id, title, genre, duration, year, director) {
    document.getElementById('addMovieModal').style.display = 'flex';
    document.getElementById('modalTitle').innerText = "Edit Movie (ID: #" + id + ")";
    document.getElementById('saveBtn').innerText = "Update Movie";
    
    // Mbushim fushat
    document.getElementById('movieTitle').value = title;
    document.getElementById('movieGenre').value = genre;
    document.getElementById('movieDuration').value = duration;
    document.getElementById('movieYear').value = year;
    document.getElementById('movieDirector').value = director; // Tani eshte input tekst
}

// Funksioni Delete
function deleteMovie(id, title) { 
    if (confirm("Are you sure you want to delete the movie: " + title + "?")) {
        // Ketu pjestari 2 do beje lidhjen me backend (p.sh. AJAX fetch)
        fetch("deleteMovie.php", {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body: "id=" + encodeURIComponent(id)
        })
        .then(response => response.text())
        .then(data => {
            alert("Movie #" + id + " deleted successfully!");
            location.reload(); // rifreskon tabelen pas fshirjes
        })
        .catch(error => console.error("Error:", error));
    }  
}

// Pastrimi i formes
function clearForm() {
    const inputs = document.querySelectorAll('.modal-content input, .modal-content textarea, .modal-content select');
    inputs.forEach(input => input.value = "");
}