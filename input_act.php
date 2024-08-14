<?php
include 'koneksi.php';
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
$rand = rand();
mysqli_query($koneksi, "INSERT INTO `dco` VALUES('','$service','$manifest','$manifest_date','$destination', '$cnote',
'$colly', '$weight', '$delivery', '$delivery_sps', '$linehaul', '$linehaul_next', '$amount', '$operational_cost')");
header("location:index.php?alert=berhasil"); 
