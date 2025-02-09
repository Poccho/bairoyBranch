<?php 
require("navbar/navbar.php");
require("../configs/session.php");
require("../configs/db.php"); 
require("../controllers/dashboard.php")

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cars and Invoices</title>
    <style>
        table {
            width: 45%;
            border-collapse: collapse;
            margin: 10px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .table-container {
            display: inline-block;
            width: 40%;
            vertical-align: top;
        }
    </style>
</head>
<body>
    <div class="table-container">
        <h2>Cars Assigned to Salesperson</h2>
        <table>
            <thead>
                <tr>
                    <th>Serial Number</th>
                    <th>Make</th>
                    <th>Year</th>
                    <th>Model</th>
                    <th>Type</th>
                    <th>Customer ID</th>
                </tr>
            </thead>
            <tbody>
                <?php if ($resultCars->num_rows > 0): ?>
                    <?php while ($row = $resultCars->fetch_assoc()): ?>
                        <tr>
                            <td><?php echo htmlspecialchars($row['serialNumber']); ?></td>
                            <td><?php echo htmlspecialchars($row['make']); ?></td>
                            <td><?php echo htmlspecialchars($row['year']); ?></td>
                            <td><?php echo htmlspecialchars($row['model']); ?></td>
                            <td><?php echo htmlspecialchars($row['type']); ?></td>
                            <td><?php echo htmlspecialchars($row['customerId']); ?></td>
                        </tr>
                    <?php endwhile; ?>
                <?php else: ?>
                    <tr>
                        <td colspan="6">No cars found for this salesperson.</td>
                    </tr>
                <?php endif; ?>
            </tbody>
        </table>
    </div>

    <div class="table-container">
        <h2>Invoices Assigned to Salesperson</h2>
        <table>
            <thead>
                <tr>
                    <th>Invoice ID</th>
                    <th>Date</th>
                    <th>Total Amount</th>
                    <th>Customer ID</th>
                    <th>Serial Number</th>
                </tr>
            </thead>
            <tbody>
                <?php if ($resultInvoices->num_rows > 0): ?>
                    <?php while ($row = $resultInvoices->fetch_assoc()): ?>
                        <tr>
                            <td><?php echo htmlspecialchars($row['invoiceId']); ?></td>
                            <td><?php echo htmlspecialchars($row['date']); ?></td>
                            <td><?php echo htmlspecialchars(number_format($row['totalAmount'], 2)); ?></td>
                            <td><?php echo htmlspecialchars($row['customerId']); ?></td>
                            <td><?php echo htmlspecialchars($row['serialNumber']); ?></td>
                        </tr>
                    <?php endwhile; ?>
                <?php else: ?>
                    <tr>
                        <td colspan="5">No invoices found for this salesperson.</td>
                    </tr>
                <?php endif; ?>
            </tbody>
        </table>
    </div>
</body>
</html>

<?php
$stmtCars->close();
$stmtInvoices->close();
$conn->close();
?>
