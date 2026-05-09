  // Logjika e nderrimit te tabeve
        function showSection(id) {
            const sections = ['movies', 'halls', 'schedule', 'crm'];
            sections.forEach(s => {
                document.getElementById(s + '-sec').style.display = 'none';
            });
            document.getElementById(id + '-sec').style.display = 'block';

            // Ndryshimi i klases aktive ne sidebar
            const links = document.querySelectorAll('.sidebar-nav a');
            links.forEach(l => l.classList.remove('active'));
            event.currentTarget.classList.add('active');
        }

        // Hapja/Mbyllja e Modalit
        function toggleModal(show) {
            document.getElementById('addMovieModal').style.display = show ? 'flex' : 'none';
        }