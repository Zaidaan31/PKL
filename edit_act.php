<?php
include 'koneksi.php';

$id = $_POST['id'];
$service = $_POST['service'];
$manifest = $_POST['manifest'];
$manifest_date = $_POST['manifest_date'];
$destination = $_POST['destination'];
$cnote = $_POST['cnote'];
$colly = $_POST['colly'];
$weight = $_POST['weight'];
$delivery = $_POST['delivery'];
$delivery_sps = $_POST['delivery_sps'];
$linehaul = $_POST['linehaul'];
$linehaul_next = $_POST['linehaul_next'];
$amount = $_POST['amount'];
$operational_cost = $_POST['operational_cost'];

// Persiapkan pernyataan update
$query = "UPDATE dco SET 
    service = ?, 
    manifest = ?, 
    manifest_date = ?, 
    destination = ?, 
    cnote = ?, 
    colly = ?, 
    weight = ?, 
    delivery = ?, 
    delivery_sps = ?, 
    linehaul = ?, 
    linehaul_next = ?, 
    amount = ?, 
    operational_cost = ? 
WHERE id = ?";

if ($stmt = $koneksi->prepare($query)) {
    // Mengikat parameter ke pernyataan
    $stmt->bind_param(
        'sssssssssssssi',
        $service,
        $manifest,
        $manifest_date,
        $destination,
        $cnote,
        $colly,
        $weight,
        $delivery,
        $delivery_sps,
        $linehaul,
        $linehaul_next,
        $amount,
        $operational_cost,
        $id
    );

    // Menjalankan pernyataan
    if ($stmt->execute()) {
        header("Location: index.php?alert=berhasil");
    } else {
        echo "Error menjalankan query: " . $stmt->error;
    }

    // Menutup pernyataan
    $stmt->close();
} else {
    echo "Error menyiapkan query: " . $koneksi->error;
}

// Menutup koneksi
$koneksi->close();

