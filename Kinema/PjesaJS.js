const movieData = {
    'dune': { title: 'Dune: Part Two', dur: '2h 46min', genre: 'Sci-Fi, Action', rel: '1 March 2024', dir: 'Denis Villeneuve', cast: 'Timothée Chalamet, Zendaya', img: 'https://xl.movieposterdb.com/24_02/2024/15239678/xl_dune-part-two-movie-poster_18c5c05f.jpg', desc: 'Paul Atreides unites with Chani and the Fremen while seeking revenge against the conspirators who destroyed his family. Facing a choice between the love of his life and the fate of the universe, he must prevent a terrible future only he can foresee.' },
    'avatar': { title: 'Avatar: The Way of Water', dur: '3h 12min', genre: 'Sci-Fi, Adventure', rel: '16 December 2022', dir: 'James Cameron', cast: 'Sam Worthington, Zoe Saldana', img: 'https://xl.movieposterdb.com/23_01/2022/1630029/xl_avatar-the-way-of-water-movie-poster_c111a145.png', desc: 'Jake Sully and Neytiri have formed a family and are doing everything to stay together. However, they must leave their home and explore the regions of Pandora. When an ancient threat resurfaces, Jake must fight a difficult war against the humans.' },
    'mario': { title: 'The Super Mario Bros.', dur: '1h 32min', genre: 'Animation, Adventure', rel: '5 April 2023', dir: 'Aaron Horvath', cast: 'Chris Pratt, Anya Taylor-Joy', img: 'https://xl.movieposterdb.com/23_04/2023/6718170/xl_the-super-mario-bros-movie-movie-poster_c62032f8.jpg', desc: 'While working underground to fix a water main, Brooklyn plumbers and brothers Mario and Luigi are transported through a mysterious pipe to a magical new world. But when the siblings are separated, an epic adventure begins.' },
    'oppenheimer': { title: 'Oppenheimer', dur: '3h 0min', genre: 'Biography, Drama', rel: '21 July 2023', dir: 'Christopher Nolan', cast: 'Cillian Murphy, Emily Blunt', img: 'https://xl.movieposterdb.com/23_06/2023/15398776/xl_oppenheimer-movie-poster_a83f1cbb.jpg', desc: 'During World War II, Lt. Gen. Leslie Groves Jr. appoints physicist J. Robert Oppenheimer to work on the top-secret Manhattan Project. Oppenheimer and a team of scientists spend years developing and designing the atomic bomb. Their work comes to fruition on July 16, 1945, as they witness the world\'s first nuclear explosion, forever changing the course of history.' },
    'joker': { title: 'Joker', dur: '2h 2min', genre: 'Crime, Drama', rel: '4 October 2019', dir: 'Todd Phillips', cast: 'Joaquin Phoenix', img: 'https://xl.movieposterdb.com/21_04/2019/7286456/xl_7286456_f83eac6d.jpg', desc: 'Arthur Fleck, a party clown, leads an impoverished life with his ailing mother. However, when society shuns him and brands him as a freak, he decides to embrace the life of crime and chaos.' },
    'batman': { title: 'The Dark Knight', dur: '2h 56min', genre: 'Action, Crime', rel: '4 March 2022', dir: 'Christopher Nolan', cast: 'Christian Bale, Heath Ledger', img: 'https://xl.movieposterdb.com/24_06/2008/468569/xl_the-dark-knight-movie-poster_96214dbd.jpg', desc: 'When a menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman, James Gordon and Harvey Dent must work together to put an end to the madness.' },
    'devil': { title: 'The Devil Wears Prada 2', dur: '1h 50min', genre: 'Comedy, Drama', rel: '2026', dir: 'David Frankel', cast: 'Meryl Streep, Anne Hathaway', img: 'https://xl.movieposterdb.com/26_04/2026/33612209/xl_the-devil-wears-prada-2-movie-poster_6b73993b.jpg', desc: 'Miranda Priestly struggles against Emily Charlton, her former assistant turned rival executive, as they compete for advertising revenue amid declining print media, while Miranda nears retirement.', date: 'Available on: May 15, 2026' },
    'garfield': { title: 'The Garfield Movie', dur: '1h 41min', genre: 'Animation, Comedy', rel: '2024', dir: 'Mark Dindal', cast: 'Chris Pratt, Samuel L. Jackson', img: 'https://xl.movieposterdb.com/24_03/2024/5779228/xl_the-garfield-movie-movie-poster_3ccdd455.jpg', desc:'After an unexpected reunion with his long-lost father, a scruffy street cat, Garfield is forced to leave his perfectly pampered life in order to take part in a high-stakes heist. And an incredible outdoor adventure begins!', date: 'Available on: May 24, 2026' },
    'central': { title: 'Central Intelligence', dur: '1h 47min', genre: 'Action, Comedy', rel: '2016', dir: 'Rawson Marshall Thurber', cast: 'Dwayne Johnson, Kevin Hart', img: 'https://xl.movieposterdb.com/15_11/2016/1489889/xl_1489889_d65e6f4f.jpg', desc:'Accountant Calvin, who was the most popular boy at school, meets his ex-classmate, Bob, at a reunion. Little does he know that the meeting would wreak havoc in his quiet and peaceful life.', date: 'Available on: June 10, 2026' },
    'nohard': { title: 'No Hard Feelings', dur: '1h 43min', genre: 'Comedy', rel: '2023', dir: 'Gene Stupnitsky', cast: 'Jennifer Lawrence', img: 'https://xl.movieposterdb.com/23_06/2023/15671028/xl_no-hard-feelings-movie-poster_0bca72a9.jpg', desc:'On the brink of losing her childhood home, a desperate woman agrees to date a wealthy couple\'s introverted and awkward 19-year-old son. However, he proves to be more of a challenge than she expected, and time is running out before she loses it all.', date: 'Available on: June 18, 2026' },
    'barbie': { title: 'Barbie', dur: '1h 54min', genre: 'Comedy, Adventure', rel: '2023', dir: 'Greta Gerwig', cast: 'Margot Robbie, Ryan Gosling', img: 'https://xl.movieposterdb.com/23_06/2023/1517268/xl_barbie-movie-poster_780f2c78.jpg', desc: 'Barbie and Ken are having the time of their lives in the colorful and seemingly perfect world of Barbie Land. However, when they get a chance to go to the real world, they soon discover the joys and perils of living among humans.', date: 'Available on: July 2, 2026' },
    'gladiator': { title: 'Gladiator II', dur: '2h 30min', genre: 'Action, Drama', rel: '2024', dir: 'Ridley Scott', cast: 'Paul Mescal, Pedro Pascal', img: 'https://xl.movieposterdb.com/24_08/2024/9218128/xl_gladiator-2-movie-poster_c8f77715.jpg', desc: 'Years after witnessing the death of Maximus at the hands of his uncle, Lucius must enter the Colosseum after the powerful emperors of Rome conquer his home. With rage in his heart and the future of the empire at stake, he looks to the past to find the strength and honor needed to return the glory of Rome to its people.',  date: 'Available on: July 22, 2026' }
};

// MASTER NAVIGATION
function navigate() {
    const sections = ['home-section', 'movies-section', 'food-section', 'events-section', 'details-section', 'success-message'];
    sections.forEach(s => {
        const el = document.getElementById(s);
        if (el) el.style.display = 'none';
    });

    const hash = window.location.hash || '#home';
    window.scrollTo(0, 0);

    if (hash === '#home' || hash === '') {
        document.getElementById('home-section').style.display = 'block';
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
setInterval(() => { if (window.location.hash === '#home' || window.location.hash === '') changeSlide(1); }, 5000);

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

// NGARKIMI I FILMAVE NGA DATABASE
function loadMovies() {
    fetch("getMoviesfromDatabase.php")
        .then(res => res.json())
        .then(data => {
            const activeContainer = document.getElementById("activeMovies");
            const comingContainer = document.getElementById("comingMovies");
            activeContainer.innerHTML = "";
            comingContainer.innerHTML = "";

            data.active.forEach(movie => {
                let movieKey = movie.titulli.toLowerCase().split(' ')[0].replace(':', '');
                if (movieKey === 'the') movieKey = movie.titulli.toLowerCase().split(' ')[1];
                activeContainer.innerHTML += `
                    <div class="movie-card">
                        <img src="${movie.posteri}" alt="${movie.titulli}">
                        <div class="overlay"><a href="#details-${movieKey}" class="btn-more">BOOK TICKET</a></div>
                        <h3 style="text-align:center; padding:10px; font-size:16px;">${movie.titulli}</h3>
                    </div>`;
            });

            data.coming.forEach(movie => {
                let movieKey = movie.titulli.toLowerCase().split(' ')[0].replace(':', '');
                if (movieKey === 'the') movieKey = movie.titulli.toLowerCase().split(' ')[1];
                comingContainer.innerHTML += `
                    <div class="movie-card">
                        <img src="${movie.posteri}" alt="${movie.titulli}">
                        <div class="overlay"><a href="#coming-${movieKey}" class="btn-more">DETAILS</a></div>
                        <h3 style="text-align:center; padding:10px; font-size:16px;">${movie.titulli}</h3>
                    </div>`;
            });
        }).catch(err => console.error(err));
}
document.addEventListener("DOMContentLoaded", loadMovies);

// --- PJESA E RE: ZGJEDHJA E VENDEVE (LIMIT 5) ---
document.addEventListener('click', function(e) {
    if (e.target.classList.contains('seat') && !e.target.classList.contains('taken')) {
        const selectedCount = document.querySelectorAll('.seat.selected').length;
        if (e.target.classList.contains('selected')) {
            e.target.classList.remove('selected');
        } else {
            if (selectedCount < 5) {
                e.target.classList.add('selected');
            } else {
                alert("Mund të rezervoni deri në 5 vende.");
            }
        }
    }
});

// --- PJESA E RE: CONFIRM BOOKING (ME EFEKT TE KUQ) ---
const reserveBtn = document.querySelector("#booking-area .btn-reserve");
if (reserveBtn) {
    reserveBtn.addEventListener("click", () => {
        const selectedNodes = document.querySelectorAll('.seat.selected');
        if (selectedNodes.length === 0) { alert("Zgjidhni të paktën një vend!"); return; }

        let seatIds = [];
        let formData = new FormData();
        selectedNodes.forEach(seat => {
            let id = seat.getAttribute("data-id");
            seatIds.push(id);
            formData.append("seats[]", id);
        });

        formData.append("shfaqja_id", document.getElementById("booking-area").getAttribute("data-shfaqja-id"));

        fetch("book_seats.php", { method: "POST", body: formData })
        .then(res => res.json())
        .then(data => {
            if (data.status === "success") {
                // 1. I bejme vendet e kuqe (taken) menjehere
                selectedNodes.forEach(seat => {
                    seat.classList.remove("selected");
                    seat.classList.add("taken");
                });

                // 2. Presim pak qe te shihet ndryshimi, pastaj nxjerrim mesazhin e suksesit
                setTimeout(() => {
                    document.getElementById('details-section').style.display = 'none';
                    const successDiv = document.getElementById('success-message');
                    if(successDiv) {
                        successDiv.style.display = 'block';
                        document.getElementById('booked-seats-list').innerText = seatIds.join(", ");
                    }
                }, 1000);
            } else {
                alert(data.message);
            }
        }).catch(err => console.error(err));
    });
}

// CAROUSEL HERO NGA DB
function loadHeroCarousel() {
    fetch("getActiveMovies.php")
        .then(res => res.json())
        .then(movies => {
            const slidesContainer = document.getElementById("carousel-slides");
            if(!slidesContainer) return;
            slidesContainer.innerHTML = "";
            movies.forEach((movie, index) => {
                const slide = document.createElement("div");
                slide.className = "slide" + (index === 0 ? " active" : "");
                slide.innerHTML = `
                    <img src="${movie.posteri}" alt="${movie.titulli}">
                    <div class="hero-info">
                        <h1>${movie.titulli}</h1>
                        <a href="#details-${movie.filmi_id}" class="btn-reserve" style="text-decoration:none;">
                            <i class="fa fa-ticket"></i> BOOK TICKET
                        </a>
                    </div>`;
                slidesContainer.appendChild(slide);
            });
        });
}
document.addEventListener("DOMContentLoaded", loadHeroCarousel);