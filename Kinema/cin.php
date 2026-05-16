<?php session_start(); ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Velora Cinema</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="AllPages.css">
    <link rel="apple-touch-icon" sizes="180x180" href="favicon/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="favicon/favicon-16x16.png">
    <link rel="shortcut icon" href="favicon/favicon.ico">
    <link rel="manifest" href="favicon/site.webmanifest">
</head>

<body>

<!-- HEADER -->
<header>
    <a href="#home" class="logo" style="text-decoration: none;">VELORA CINEMA</a>
    <nav>
        <a href="#food">Food</a>
        <a href="#events">Events</a>
    </nav>
    <div class="user-menu">
        <i class="fa fa-bars" onclick="toggleDropdown()"></i>
<div id="dropdown" class="dropdown-menu">
    <?php if (isset($_SESSION['user_id'])): ?>
        
        <span style="padding: 10px 15px; color: #888; font-size: 0.85em; display: block; border-bottom: 1px solid #333;">
            <i class="fa fa-user"></i> <?php echo isset($_SESSION['email']) ? $_SESSION['email'] : 'Përdorues'; ?>
        </span>
        
        <?php if (isset($_SESSION['role']) && $_SESSION['role'] === 'admin'): ?>
            <a href="admin.php" style="color: var(--primary);">
                <i class="fa fa-user-shield"></i> Admin Panel
            </a>
        <?php else: ?>
            <a href="profili.php">
                <i class="fa fa-id-card"></i> Profili yt
            </a>
        <?php endif; ?>

        <a href="logout.php" style="border-top: 1px solid #333; color: #ff4d4d;">
            <i class="fa fa-sign-out-alt"></i> Log Out
        </a>

    <?php else: ?>
        
        <a href="#" onclick="openLogin()">Log In</a>
        <a href="#" onclick="openSignUp()">Sign Up</a>
        
    <?php endif; ?>
</div>
    </div>
</header>

<!-- LOGIN MODAL -->
<div id="loginModal" class="modal-overlay">
    <div class="modal-content">
        <span class="close-modal" onclick="closeAuth()">&times;</span>
        <h2>Log In</h2>
        <form id="loginForm" action="login.php" method="post">
            <input type="email" placeholder="Email" name="email" id="loginEmail" required>
            <input type="password" placeholder="Password" name="password" id="loginPass" required>
            <button type="submit" class="btn-auth">Log In</button>
        </form>
        <p>You don’t have an account? <span onclick="openSignUp()">Register here</span></p>
    </div>
</div>

<!-- SIGN UP MODAL -->
<div id="signupModal" class="modal-overlay">
    <div class="modal-content">
        <span class="close-modal" onclick="closeAuth()">&times;</span>
        <h2>Sign up</h2>
        <form id="signupForm" action="signup.php" method="POST">
           <input type="email" placeholder="Email Address" name="email" id="signupEmail" required>
           <input type="password" placeholder="Password" name="password" id="signupPass" required>
           <button type="submit" class="btn-auth">Sign Up</button>
        </form>
        <p>Already have an account? <span onclick="openLogin()">Log in</span></p>
    </div>
</div>

<main id="main-content">
    <!-- HOME PAGE CONTENT -->
    <section id="home-section">
        <div class="hero-carousel">
            <div class="arrow arrow-left" onclick="changeSlide(-1)">&#10094;</div>
            <div class="arrow arrow-right" onclick="changeSlide(1)">&#10095;</div>

            <div class="slide active">
                <img src="https://image.tmdb.org/t/p/original/9n2tJBplPbgR2ca05hS5CKXwP2c.jpg">
                <div class="hero-info">
                    <h1>The Super Mario</h1>
                    <a href="#details-mario" class="btn-reserve" style="text-decoration:none;"><i class="fa fa-ticket"></i> BOOK TICKET</a>
                </div>
            </div>
            <div class="slide">
                <img src="https://image.tmdb.org/t/p/original/8b8R8l88Qje9dn9OE8PY05Nxl1X.jpg">
                <div class="hero-info">
                    <h1>Dune: Part Two</h1>
                    <a href="#details-dune" class="btn-reserve" style="text-decoration:none;"><i class="fa fa-ticket"></i> BOOK TICKET</a>
                </div>
            </div>
            <div class="slide">
                <img src="https://image.tmdb.org/t/p/original/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg">
                <div class="hero-info">
                    <h1>Oppenheimer</h1>
                    <a href="#details-oppenheimer" class="btn-reserve" style="text-decoration:none;"><i class="fa fa-ticket"></i> BOOK TICKET</a>
                </div>
            </div>
        </div>

        <!-- SEKSIONI: NOW IN CINEMA -->
        <h2 class="section-title">Now in Cinema</h2>
            <div id="activeMovies" class="movie-grid">
                <!-- Filmat do të injektohen këtu nga JS -->
            </div>

        <!-- SEKSIONI: COMING SOON -->
        <h2 class="section-title">Coming Soon</h2>
            <div id="comingMovies" class="movie-grid">
            <!-- Filmat do të injektohen këtu nga JS -->
            </div>

        <h2 class="section-title">Current Promotions</h2>
        <div class="promo-grid">
            <div class="promo-box"><img src="https://images.unsplash.com/photo-1517604931442-7e0c8ed2963c?q=80&w=500"><div class="promo-content"><h3>🎓 Student Discount -20%</h3><p>Available every weekday for all students</p></div></div>
            <div class="promo-box"><img src="https://images.unsplash.com/photo-1594909122845-11baa439b7bf?q=80&w=500"><div class="promo-content"><h3>🍿 Free Popcorn Tuesdays</h3><p>Buy a ticket and get free popcorn every Tuesday.</p></div></div>
            <div class="promo-box"><img src="Photos/mysteryMoviejpg.jpg"><div class="promo-content"><h3>👪 Family Sunday</h3><p>Half-price tickets for children every Sunday before 6:00 PM.</p></div></div>
        </div>
    </section>
<!--
    MOVIES PAGE 
    <section id="movies-section" style="display:none; padding-top: 100px;">
        <h2 class="section-title">All Movies</h2>
        <div class="movie-grid">
            <div class="movie-card"><img src="https://image.tmdb.org/t/p/w500/8b8R8l88Qje9dn9OE8PY05Nxl1X.jpg"><div class="overlay"><a href="#details-dune" class="btn-more">READ MORE</a></div></div>
            <div class="movie-card"><img src="https://image.tmdb.org/t/p/w500/t6HIqrRAclMCA60NsSmeqe9RmNV.jpg"><div class="overlay"><a href="#details-avatar" class="btn-more">READ MORE</a></div></div>
            <div class="movie-card"><img src="https://image.tmdb.org/t/p/w500/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg"><div class="overlay"><a href="#details-mario" class="btn-more">READ MORE</a></div></div>
            <div class="movie-card"><img src="https://image.tmdb.org/t/p/w500/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg"><div class="overlay"><a href="#details-oppenheimer" class="btn-more">READ MORE</a></div></div>
            <div class="movie-card"><img src="Photos/Joker.jpg"><div class="overlay"><a href="#details-joker" class="btn-more">READ MORE</a></div></div>
            <div class="movie-card"><img src="Photos/the-dark-knight-movie.jpg"><div class="overlay"><a href="#details-batman" class="btn-more">READ MORE</a></div></div>
        </div>
    </section>
-->
    <!-- FOOD PAGE -->
    <section id="food-section" style="display:none; padding-top: 100px;">
        <h2 class="section-title">Food & Drinks</h2>
        <div class="promo-grid">
            <div class="promo-box"><img src="https://images.unsplash.com/photo-1572177191856-3cde618dee1f?q=80&w=500"><div class="promo-content"><h3>Popcorn XL</h3><p>Salt, Butter, or Caramel - €4.50</p></div></div>
            <div class="promo-box"><img src="Photos/Nachos.webp"><div class="promo-content"><h3>Nachos Supreme</h3><p>With cheese sauce and jalapenos - €5.00</p></div></div>
            <div class="promo-box"><img src="Photos/Drinks.jpg"><div class="promo-content"><h3>Soft Drinks</h3><p>Cola, Fanta, Sprite 0.5L - 2.50€</p></div></div>
        </div>
    </section>

    <!-- EVENTS PAGE -->
    <section id="events-section" style="display:none; padding-top: 100px;">
        <h2 class="section-title">Upcoming Events</h2>
        <div class="promo-grid">
            <div class="promo-box"><div class="promo-content"><h3>🎬 Mystery Movie Night</h3><p>Returns this Friday at 7:00 PM. The movie is revealed only when the lights go out.</p></div></div>
            <div class="promo-box"><div class="promo-content"><h3>⭐ Premiere: The Devil Wears Prada 2</h3><p>Special red carpet event on May 15.</p></div></div>
        </div>
    </section>

    <!-- DETAILS SECTION -->
    <section id="details-section" class="movie-details-container">
        <div class="details-flex">
            <img id="detail-img" src="" class="poster-large">
            <div class="movie-info-text">
                <h1 id="detail-title"></h1>
                <ul class="info-list">
                    <li><b>Duration:</b> <span id="detail-dur"></span></li>
                    <li><b>Genre:</b> <span id="detail-genre"></span></li>
                    <li><b>Release Date:</b> <span id="detail-rel"></span></li>
                    <li><b>Director:</b> <span id="detail-dir"></span></li>
                    <li><b>Cast:</b> <span id="detail-cast"></span></li>
                </ul>
                <p id="detail-desc" style="line-height: 1.6; color: #aaa;"></p>
                <div id="coming-soon-tag" style="display:none; background: var(--primary); padding: 10px; border-radius: 5px; font-weight: bold; margin-top: 20px; text-align: center;"></div>
            </div>
        </div>
        <div id="booking-area" class="booking-section">
            <h2>Choose Your Seats</h2>
            <div class="screen"></div>
            <div class="seats-grid">
                <div class="seat"></div><div class="seat"></div><div class="seat taken"></div>
                <div class="seat"></div><div class="seat"></div><div class="seat"></div>
                <div class="seat"></div><div class="seat"></div><div class="seat taken"></div>
                <div class="seat"></div><div class="seat selected"></div><div class="seat"></div>
                <div class="seat"></div><div class="seat"></div><div class="seat taken"></div>
                <div class="seat"></div><div class="seat"></div><div class="seat"></div>
                <div class="seat"></div><div class="seat"></div><div class="seat taken"></div>
                <div class="seat"></div><div class="seat selected"></div><div class="seat"></div>
                <div class="seat"></div><div class="seat"></div><div class="seat taken"></div>
                <div class="seat"></div><div class="seat"></div><div class="seat taken"></div>
                <div class="seat"></div><div class="seat"></div> 
            </div>
            <button class="btn-reserve" style="margin: 30px auto;">Confirm Booking</button>
        </div>
    </section>
</main>

<footer>
    <div class="footer-col">
        <h3>Movies</h3>
        <a href="#movies">Now in Cinema</a>
        <a href="#home">Coming Soon</a>
        <a href="#movies">All Movies</a>
    </div>
    <div class="footer-col">
        <h3>Velora</h3>
        <a href="#">About Us</a>
        <a href="#">Contact</a>
        <a href="#">FAQ</a>
    </div>
    <div class="footer-col"><p>© 2026 Velora Cinema</p></div>
</footer>

<script src="PjesaJS.js"></script>
</body>
</html>