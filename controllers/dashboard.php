<?php
if (!isset($_SESSION['salesPersonId'])) {
    echo '<p>Error: Salesperson not logged in.</p>';
    exit;
}

$salesPersonId = $_SESSION['salesPersonId'];

$queryCars = "SELECT serialNumber, make, year, model, type, customerId 
              FROM car
              WHERE salesPersonId = ?"; 

$stmtCars = $conn->prepare($queryCars);
$stmtCars->bind_param("i", $salesPersonId);
$stmtCars->execute();
$resultCars = $stmtCars->get_result();

$queryInvoices = "SELECT invoiceId, date, totalAmount, customerId, serialNumber 
                  FROM invoice
                  WHERE salesPersonId = ?"; 

$stmtInvoices = $conn->prepare($queryInvoices);
$stmtInvoices->bind_param("i", $salesPersonId);
$stmtInvoices->execute();
$resultInvoices = $stmtInvoices->get_result();
?>