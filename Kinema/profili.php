<?php
session_start();

// a ka bere login, perndryshe te home page
if (!isset($_SESSION['user_id'])) {
    header("Location: cin.php");
    exit();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profili Im - Velora Cinema</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="AllPages.css"> <style>
        body {
            background-color: #0b0b0b;
            color: #fff;
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .profile-container {
            background-color: #141414;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(255, 0, 0, 0.1);
            text-align: center;
            width: 350px;
            border: 1px solid #222;
        }
        .profile-card i {
            font-size: 80px;
            color: #ff0000; /* Ngjyra kryesore e kinemasë */
            margin-bottom: 20px;
        }
        .profile-card h2 {
            margin: 10px 0;
            font-size: 24px;
        }
        .profile-info {
            margin: 20px 0;
            background: #1c1c1c;
            padding: 15px;
            border-radius: 5px;
            text-align: left;
        }
        .profile-info p {
            margin: 8px 0;
            font-size: 14px;
            color: #ccc;
        }
        .profile-info strong {
            color: #fff;
        }
        .btn-back {
            display: inline-block;
            background-color: #ff0000;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            margin-top: 15px;
            transition: 0.3s;
        }
        .btn-back:hover {
            background-color: #cc0000;
        }
    </style>
</head>
<body>

    <div class="profile-container">
        <div class="profile-card">
            <i class="fa fa-user-circle"></i>
            <h2>My Profile</h2>
            
            <div class="profile-info">
                <p><strong>Email:</strong> <?php echo $_SESSION['email']; ?></p>
            </div>

            <a href="cin.php" class="btn-back"><i class="fa fa-arrow-left"></i> Go Back</a>
        </div>
    </div>

</body>
</html>