<?php
include "koneksi.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Tangkap data dari form
    $destination = $_POST['destination'];
    $nama_pengirim = $_POST['nama_pengirim'];
    $nama_penerima = $_POST['nama_penerima'];
    $tlp_pengirim = $_POST['tlp_pengirim'];
    $tlp_penerima = $_POST['tlp_penerima'];
    $alamat_pengirim = $_POST['alamat_pengirim'];
    $alamat_penerima = $_POST['alamat_penerima'];
    $service = $_POST['service'];
    $type = $_POST['type'];
    $qty = $_POST['qty'];
    $weight = $_POST['weight'];

    // Panggil Stored Procedure untuk memasukkan data
    $sql = "CALL InsertBks(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    $stmt = mysqli_prepare($koneksi, $sql);
    
    if ($stmt) {
        // Bind parameter
        mysqli_stmt_bind_param($stmt, "sssssssisii", $destination, $nama_pengirim, $nama_penerima, $tlp_pengirim, $tlp_penerima, $alamat_pengirim, $alamat_penerima, $service, $type, $qty, $weight);

        // Eksekusi Stored Procedure
        if (mysqli_stmt_execute($stmt)) {
            echo "Data berhasil dimasukkan.";
        } else {
            echo "Terjadi kesalahan: " . mysqli_error($koneksi);
        }

        // Tutup statement
        mysqli_stmt_close($stmt);
    } else {
        echo "Terjadi kesalahan dalam persiapan statement: " . mysqli_error($koneksi);
    }

    // Tutup koneksi
    mysqli_close($koneksi);
}
header("location:dashboard.php?alert=berhasil"); 
?>
