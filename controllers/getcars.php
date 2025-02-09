<?php
require('../configs/db.php'); // Database connection

// Query to fetch the required columns
$query = "SELECT serialNumber, make, year, model, type, salesPersonId, customerId FROM car"; // Replace 'cars' with your table name

$stmt = $conn->prepare($query);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    echo '<!DOCTYPE html>
          <html lang="en">
          <head>
              <meta charset="UTF-8">
              <meta name="viewport" content="width=device-width, initial-scale=1.0">
              <title>Car Inventory</title>
              <style>
                table {
                    width: 100%;
                    border-collapse: collapse;
                }
                th, td {
                    border: 1px solid #ddd;
                    padding: 8px;
                    text-align: left;
                }
                th {
                    background-color: #f2f2f2;
                }
              </style>
          </head>
          <body>
              <h1>Car Inventory</h1>
              <table>
                  <thead>
                      <tr>
                          <th>Serial Number</th>
                          <th>Make</th>
                          <th>Year</th>
                          <th>Model</th>
                          <th>Type</th>
                          <th>Sales Person ID</th>
                          <th>Customer ID</th>
                      </tr>
                  </thead>
                  <tbody>';
    
    // Fetch and display rows
    while ($row = $result->fetch_assoc()) {
        echo '<tr>
                  <td>' . htmlspecialchars($row['serialNumber']) . '</td>
                  <td>' . htmlspecialchars($row['make']) . '</td>
                  <td>' . htmlspecialchars($row['year']) . '</td>
                  <td>' . htmlspecialchars($row['model']) . '</td>
                  <td>' . htmlspecialchars($row['type']) . '</td>
                  <td>' . htmlspecialchars($row['salesPersonId']) . '</td>
                  <td>' . htmlspecialchars($row['customerId']) . '</td>
              </tr>';
    }

    echo '      </tbody>
              </table>
          </body>
          </html>';
} else {
    echo '<p>No records found.</p>';
}

$stmt->close();
$conn->close();
?>
