<?php
require('configs\db.php');

function sanitizeInput($input)
{
  $input = trim($input);
  $input = stripslashes($input);
  $input = htmlspecialchars($input);
  return $input;
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
  $email = sanitizeInput($_POST['email']);
  $password = sanitizeInput($_POST['password']);

  $stmt = $conn->prepare("SELECT salesPersonId, password, firstName, email FROM salesperson WHERE email = ?");
  $stmt->bind_param("s", $email);
  $stmt->execute();
  $stmt->store_result();

  if ($stmt->num_rows > 0) {
    $stmt->bind_result($userId, $storedPassword, $firstName, $email); 
    $stmt->fetch();

    if (password_verify($password, $storedPassword)) {
      session_start();
      $_SESSION['salesPersonId'] = $userId;
      $_SESSION['email'] = $email;
      $_SESSION['firstName'] = $firstName;

      header("Location: views/dashboard.php");
      exit();
    } else {
      echo '<script>
              document.addEventListener("DOMContentLoaded", function() {
                  alert("Incorrect username or password!");
              });
            </script>';
    }
  } else {
    echo '<script>
            document.addEventListener("DOMContentLoaded", function() {
                alert("User not found");
            });
          </script>';
  }

  $stmt->close();
}

$conn->close();
?>
