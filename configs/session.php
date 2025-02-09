<?php
session_start();

if(!isset($_SESSION['salesPersonId'])){
  header('Location: ../index.php');
}
?>