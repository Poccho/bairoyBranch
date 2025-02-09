<?php
require('../configs/db.php'); // Include your database connection file

// Query to fetch the required columns
$query = "SELECT invoiceId, date, totalAmount, salesPersonId, customerId, serialNumber FROM invoice"; // Replace 'invoices' with your table name

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
              <title>Invoices</title>
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
              <h1>Invoices</h1>
              <table>
                  <thead>
                      <tr>
                          <th>Invoice ID</th>
                          <th>Date</th>
                          <th>Total Amount</th>
                          <th>Sales Person ID</th>
                          <th>Customer ID</th>
                          <th>Serial Number</th>
                      </tr>
                  </thead>
                  <tbody>';
    
    // Fetch and display rows
    while ($row = $result->fetch_assoc()) {
        echo '<tr>
                  <td>' . htmlspecialchars($row['invoiceId']) . '</td>
                  <td>' . htmlspecialchars($row['date']) . '</td>
                  <td>' . htmlspecialchars(number_format($row['totalAmount'], 2)) . '</td>
                  <td>' . htmlspecialchars($row['salesPersonId']) . '</td>
                  <td>' . htmlspecialchars($row['customerId']) . '</td>
                  <td>' . htmlspecialchars($row['serialNumber']) . '</td>
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
