<?php
session_start();

if(isset($_SESSION['salesPersonId'])){
  header('Location: views/dashboard.php');
}

require("controllers/login.php");

?>

<head>
  <link rel="stylesheet" href="css/login.css">
</head>

<form class="login" method="POST">
  <div class="photo-placeholder">
    <img src="documentation\assets\LouGehIconCropped.png" alt="LouGeh" id="LouGeh">
  </div>
  
  <input type="text" placeholder="Email" name="email" required>
  
  <input type="password" placeholder="Password" id="password" name="password" required>
  
  <span id="togglePassword" class="toggle-password">Show password</span>
  
  <button type="submit" class="button">Login</button>
</form>

<script src="js\login.js"></script>

