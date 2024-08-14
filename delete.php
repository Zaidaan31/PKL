<?php
include 'koneksi.php';

// Mendapatkan ID buku yang akan dihapus
$id = $_GET['id'];

// Query untuk menghapus data dari tabel dco
$query = "DELETE FROM dco WHERE id='$id'";

// Eksekusi query
if (mysqli_query($koneksi, $query)) {
    // Jika berhasil, redirect ke index.php dengan pesan berhasil
    header("Location: index.php?alert=berhasil");
    exit();
} else {
    // Jika gagal, tampilkan pesan error
    echo "Error: " . $query . "<br>" . mysqli_error($koneksi);
}

// Menutup koneksi
mysqli_close($koneksi);

