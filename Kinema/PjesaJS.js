const movieData = {
    'dune': { title: 'Dune: Part Two', dur: '2h 46min', genre: 'Sci-Fi, Action', rel: '1 March 2024', dir: 'Denis Villeneuve', cast: 'Timothée Chalamet, Zendaya', img: 'https://image.tmdb.org/t/p/w500/8b8R8l88Qje9dn9OE8PY05Nxl1X.jpg', desc: 'Follow the mythic journey of Paul Atreides as he unites with Chani and the Fremen.' },
    'avatar': { title: 'Avatar: The Way of Water', dur: '3h 12min', genre: 'Sci-Fi, Adventure', rel: '16 December 2022', dir: 'James Cameron', cast: 'Sam Worthington, Zoe Saldana', img: 'https://image.tmdb.org/t/p/w500/t6HIqrRAclMCA60NsSmeqe9RmNV.jpg', desc: 'Jake Sully lives with his newfound family formed on the extrasolar moon Pandora.' },
    'mario': { title: 'The Super Mario Bros.', dur: '1h 32min', genre: 'Animation, Adventure', rel: '5 April 2023', dir: 'Aaron Horvath', cast: 'Chris Pratt, Anya Taylor-Joy', img: 'https://image.tmdb.org/t/p/w500/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg', desc: 'A plumber named Mario travels through an underground labyrinth with his brother.' },
    'oppenheimer': { title: 'Oppenheimer', dur: '3h 0min', genre: 'Biography, Drama', rel: '21 July 2023', dir: 'Christopher Nolan', cast: 'Cillian Murphy, Emily Blunt', img: 'https://image.tmdb.org/t/p/w500/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg', desc: 'The story of American scientist J. Robert Oppenheimer and his role in the atomic bomb.' },
    'joker': { title: 'Joker', dur: '2h 2min', genre: 'Crime, Drama', rel: '4 October 2019', dir: 'Todd Phillips', cast: 'Joaquin Phoenix', img: 'Photos/Joker.jpg', desc: 'In Gotham City, mentally troubled comedian Arthur Fleck is disregarded by society.' },
    'batman': { title: 'The Dark Knight', dur: '2h 56min', genre: 'Action, Crime', rel: '4 March 2022', dir: 'Christopher Nolan', cast: 'Christian Bale, Heath Ledger', img: 'Photos/the-dark-knight-movie.jpg', desc: 'When a sadistic serial killer begins murdering key political figures in Gotham.' },
    'devil': { title: 'The Devil Wears Prada 2', dur: '1h 50min', genre: 'Comedy, Drama', rel: '2026', dir: 'David Frankel', cast: 'Meryl Streep, Anne Hathaway', img: 'Photos/TheDevilWearsPradA2.jpeg', date: 'Vjen më: 15 Maj 2026' },
    'garfield': { title: 'The Garfield Movie', dur: '1h 41min', genre: 'Animation, Comedy', rel: '2024', dir: 'Mark Dindal', cast: 'Chris Pratt, Samuel L. Jackson', img: 'https://image.tmdb.org/t/p/w500/p6AbOJvMQhBmffd0PIv0u8ghWeY.jpg', date: 'Vjen më: 24 Maj 2026' },
    'central': { title: 'Central Intelligence', dur: '1h 47min', genre: 'Action, Comedy', rel: '2016', dir: 'Rawson Marshall Thurber', cast: 'Dwayne Johnson, Kevin Hart', img: 'Photos/Central_Intelligence.jpg', date: 'Vjen më: 10 Qershor 2026' },
    'nohard': { title: 'No Hard Feelings', dur: '1h 43min', genre: 'Comedy', rel: '2023', dir: 'Gene Stupnitsky', cast: 'Jennifer Lawrence', img: 'Photos/no-hard-feelings-movie-poster.jpg', date: 'Vjen më: 18 Qershor 2026' },
    'barbie': { title: 'Barbie', dur: '1h 54min', genre: 'Comedy, Adventure', rel: '2023', dir: 'Greta Gerwig', cast: 'Margot Robbie, Ryan Gosling', img: 'Photos/barbie.jpg', date: 'Vjen më: 2 Korrik 2026' },
    'gladiator': { title: 'Gladiator II', dur: '2h 30min', genre: 'Action, Drama', rel: '2024', dir: 'Ridley Scott', cast: 'Paul Mescal, Pedro Pascal', img: 'Photos/gladiator-2.jpg', date: 'Vjen më: 22 Korrik 2026' }
};

// MASTER NAVIGATION - Kjo funksionon me hash (#)
function navigate() {
    // 1. Fshehim cdo gje ne fillim (Sigurohemi qe Home fshihet plotesisht)
    const sections = ['home-section', 'movies-section', 'food-section', 'events-section', 'details-section'];
    sections.forEach(s => {
        const el = document.getElementById(s);
        if (el) el.style.display = 'none';
    });

    const hash = window.location.hash || '#home';
    window.scrollTo(0, 0);

    // 2. Shfaqim vetem seksionin qe i perket Hash-it
    if (hash === '#home' || hash === '') {
        document.getElementById('home-section').style.display = 'block';
    } 
    else if (hash === '#movies') {
        document.getElementById('movies-section').style.display = 'block';
    } 
    else if (hash === '#food') {
        document.getElementById('food-section').style.display = 'block';
    } 
    else if (hash === '#events') {
        document.getElementById('events-section').style.display = 'block';
    } 
    else if (hash.startsWith('#details-')) {
        const id = hash.replace('#details-', '');
        const movie = movieData[id];
        if (movie) {
            fillData(movie);
            document.getElementById('booking-area').style.display = 'block';
            document.getElementById('coming-soon-tag').style.display = 'none';
            document.getElementById('details-section').style.display = 'block';
        }
    } 
    else if (hash.startsWith('#coming-')) {
        const id = hash.replace('#coming-', '');
        const movie = movieData[id];
        if (movie) {
            fillData(movie);
            document.getElementById('booking-area').style.display = 'none';
            document.getElementById('coming-soon-tag').innerText = movie.date;
            document.getElementById('coming-soon-tag').style.display = 'block';
            document.getElementById('details-section').style.display = 'block';
        }
    }
}

function fillData(movie) {
    document.getElementById('detail-img').src = movie.img;
    document.getElementById('detail-title').innerText = movie.title;
    document.getElementById('detail-dur').innerText = movie.dur;
    document.getElementById('detail-genre').innerText = movie.genre;
    document.getElementById('detail-rel').innerText = movie.rel;
    document.getElementById('detail-dir').innerText = movie.dir;
    document.getElementById('detail-cast').innerText = movie.cast;
    document.getElementById('detail-desc').innerText = movie.desc || "";
}

// Eventet per Browser-in
window.addEventListener('hashchange', navigate);
window.addEventListener('load', navigate);

// CAROUSEL LOGIC
let currentSlide = 0;
function changeSlide(step) {
    const slides = document.querySelectorAll('.slide');
    if (slides.length === 0) return;
    slides[currentSlide].classList.remove('active');
    currentSlide = (currentSlide + step + slides.length) % slides.length;
    slides[currentSlide].classList.add('active');
}
setInterval(() => {
    if (window.location.hash === '#home' || window.location.hash === '') changeSlide(1);
}, 5000);

// MODALS & DROPDOWN
function toggleDropdown() { document.getElementById('dropdown').classList.toggle('show'); }
function openLogin() { closeAuth(); document.getElementById('loginModal').style.display = 'flex'; }
function openSignUp() { closeAuth(); document.getElementById('signupModal').style.display = 'flex'; }
function closeAuth() {
    document.getElementById('loginModal').style.display = 'none';
    document.getElementById('signupModal').style.display = 'none';
}
window.onclick = function(event) {
    if (!event.target.matches('.fa-bars')) {
        const d = document.getElementById('dropdown');
        if (d && d.classList.contains('show')) d.classList.remove('show');
    }
    if (event.target.classList.contains('modal-overlay')) closeAuth();
}