<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Ambil data dari form
    $name = htmlspecialchars($_POST['name']);
    $comment = htmlspecialchars($_POST['comment']);

    // Koneksi ke database
    include 'koneksi.php';

    // Simpan data ke database
    $query = "INSERT INTO feedback (name, date, comment) VALUES ('$name', NOW(), '$comment')";
    mysqli_query($koneksi, $query);
    header("location:dashboard.php?alert=berhasil"); 


    // Tutup koneksi
    mysqli_close($koneksi);
} else {
    echo "<p class='text-center text-red-600'>Invalid request method.</p>";
}

