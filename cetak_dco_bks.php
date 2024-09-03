<?php
require('fpdf.php');
include 'koneksi.php';

// Define custom font size and row height adjustments
define('FONT_SIZE', 7); // Smaller font size to fit more data
define('HEADER_FONT_SIZE', 8);
define('ROW_HEIGHT', 4); // Adjust row height to match the smaller font

// Retrieve parameters from the request (if any)
$starting_limit_number = isset($_GET['starting_limit_number']) ? intval($_GET['starting_limit_number']) : 0;
$results_per_page = isset($_GET['results_per_page']) ? intval($_GET['results_per_page']) : 50;

// Create a new PDF instance
$pdf = new FPDF('P', 'mm', 'A4');
$pdf->AddPage();

// Header section
$pdf->SetFont('Arial', 'B', 10);
$pdf->Cell(0, 10, 'Delivery Cost Outbound', 0, 1, 'C');
$pdf->Ln(2); // Add space between lines

// Details section
$pdf->SetFont('Arial', '', HEADER_FONT_SIZE);
$pdf->Cell(30, 5, 'Origin', 0, 0);
$pdf->Cell(30, 5, ': Bekasi', 0, 1);
$pdf->Cell(30, 5, 'Destination', 0, 0);
$pdf->Cell(30, 5, ': All Destination', 0, 1);
$pdf->Cell(30, 5, 'Service', 0, 0);
$pdf->Cell(30, 5, ': All Service', 0, 1);
$pdf->Ln(2); // Add space between details and table

// Table headers
$pdf->SetFont('Arial', 'B', FONT_SIZE);
$header = array('Service', 'Destination', 'Code', 'Date', 'Customer Name', 'Recipient Name', 'Quantity', 'Weight', 'Total Amount');
$widths = array(15, 20, 32, 23, 23, 23, 12, 12, 20); // Adjusted widths for smaller font

// Draw header cells with bottom border only
foreach ($header as $index => $col) {
    $pdf->Cell($widths[$index], 7, $col, 'B'); // 'B' = bottom border only
}
$pdf->Ln();

// Retrieve data from the database
$query = "CALL GetDCObks($starting_limit_number, $results_per_page)";
$result = mysqli_query($koneksi, $query);

if (!$result) {
    die("Query failed: " . mysqli_error($koneksi));
}

// Initialize total amount
$totalAmount = 0;

// Table data without any borders
$pdf->SetFont('Arial', '', FONT_SIZE);
while ($row = mysqli_fetch_assoc($result)) {
    // Check if the current page has enough space for the next row
    if ($pdf->GetY() + ROW_HEIGHT > 290) { // 290 mm is an approximate value for the bottom of the page
        $pdf->AddPage(); // Add a new page if not enough space
        // Redraw the table headers on the new page
        $pdf->SetFont('Arial', 'B', FONT_SIZE);
        foreach ($header as $index => $col) {
            $pdf->Cell($widths[$index], 7, $col, 'B');
        }
        $pdf->Ln();
        $pdf->SetFont('Arial', '', FONT_SIZE);
    }

    $pdf->Cell($widths[0], ROW_HEIGHT, htmlspecialchars($row['Service']), 0);
    $pdf->Cell($widths[1], ROW_HEIGHT, htmlspecialchars($row['Tujuan']), 0);
    $pdf->Cell($widths[2], ROW_HEIGHT, htmlspecialchars($row['Kode']), 0);
    $pdf->Cell($widths[3], ROW_HEIGHT, htmlspecialchars($row['Tanggal']), 0);
    $pdf->Cell($widths[4], ROW_HEIGHT, htmlspecialchars($row['Pengirim']), 0);
    $pdf->Cell($widths[5], ROW_HEIGHT, htmlspecialchars($row['Penerima']), 0);
    $pdf->Cell($widths[6], ROW_HEIGHT, htmlspecialchars($row['Kuantitas']), 0);
    $pdf->Cell($widths[7], ROW_HEIGHT, htmlspecialchars($row['Berat']), 0);
    $pdf->Cell($widths[8], ROW_HEIGHT, htmlspecialchars($row['Amount']), 0);
    $pdf->Ln();

    // Accumulate the total amount
    $totalAmount += $row['Amount'];
}

// Add a line after the table body to signify the end of the table
$pdf->Cell(array_sum($widths), 0, '', 'T'); // 'T' = top border

// Add the total amount row
$pdf->SetFont('Arial', 'B', FONT_SIZE);
$pdf->Ln(2); // Space before total row
$pdf->Cell(array_sum(array_slice($widths, 0, 8)), ROW_HEIGHT, 'Total Amount:', 0, 0, 'R');
$pdf->Cell($widths[8], ROW_HEIGHT, htmlspecialchars($totalAmount), 0, 0, 'L'); // Align total amount with the last column
$pdf->Ln();

// Output the PDF
$pdf->Output();
?>
