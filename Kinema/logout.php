<?php
session_start();    
session_unset();    // hiqne varibala t userit te sesionit
session_destroy();  // bye bye sesioni me serverin

header("Location: cin.php"); // ktheu te home
exit();
?>