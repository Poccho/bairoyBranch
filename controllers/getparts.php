<?php
require('../configs/db.php'); // Include your database connection file

// Query to fetch the required columns
$query = "SELECT partId, brand, partName, price FROM parts"; // Replace 'parts' with your table name

$stmt = $conn->prepare($query);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    // Start building the HTML table
    echo '<!DOCTYPE html>
          <html lang="en">
          <head>
              <meta charset="UTF-8">
              <meta name="viewport" content="width=device-width, initial-scale=1.0">
              <title>Parts Inventory</title>
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
              <h1>Parts Inventory</h1>
              <table>
                  <thead>
                      <tr>
                          <th>Part ID</th>
                          <th>Brand</th>
                          <th>Part Name</th>
                          <th>Price</th>
                      </tr>
                  </thead>
                  <tbody>';
    
    // Fetch and display rows
    while ($row = $result->fetch_assoc()) {
        echo '<tr>
                  <td>' . htmlspecialchars($row['partId']) . '</td>
                  <td>' . htmlspecialchars($row['brand']) . '</td>
                  <td>' . htmlspecialchars($row['partName']) . '</td>
                  <td> $' . htmlspecialchars(number_format($row['price'], 2)) . '</td>
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
