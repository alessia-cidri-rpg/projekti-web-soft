<?php
session_start();    // E nisim sesionin që ta kapim atë aktualin
session_unset();    // Heqim të gjitha variablat e sesionit (user_id, role, email)
session_destroy();  // E shkatërrojmë plotësisht sesionin në server

header("Location: cin.php"); // E kthejmë përdoruesit te faqja kryesore
exit();
?>