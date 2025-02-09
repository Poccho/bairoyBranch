<?php
require('../configs/db.php'); // Database connection

// Query to fetch the required columns
$query = "SELECT serviceTicketId, date, description, serialNumber, customerId FROM serviceticket"; // Replace 'service_tickets' with your table name

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
              <title>Service Tickets</title>
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
              <h1>Service Tickets</h1>
              <table>
                  <thead>
                      <tr>
                          <th>Service Ticket ID</th>
                          <th>Date</th>
                          <th>Description</th>
                          <th>Serial Number</th>
                          <th>Customer ID</th>
                      </tr>
                  </thead>
                  <tbody>';
    
    // Fetch and display rows
    while ($row = $result->fetch_assoc()) {
        echo '<tr>
                  <td>' . htmlspecialchars($row['serviceTicketId']) . '</td>
                  <td>' . htmlspecialchars($row['date']) . '</td>
                  <td>' . htmlspecialchars($row['description']) . '</td>
                  <td>' . htmlspecialchars($row['serialNumber']) . '</td>
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
