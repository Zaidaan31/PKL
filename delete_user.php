<?php
include 'koneksi.php'; // Sertakan koneksi ke database

// Periksa apakah parameter 'id' ada di URL
if (isset($_GET['id'])) {
    // Ambil ID dari URL
    $id = intval($_GET['id']); // Pastikan ID merupakan integer untuk keamanan

    // Query untuk menghapus data berdasarkan ID
    $query = "DELETE FROM user WHERE id = ?";

    // Siapkan statement
    if ($stmt = $koneksi->prepare($query)) {
        // Bind parameter
        $stmt->bind_param("i", $id);

        // Eksekusi query
        if ($stmt->execute()) {
            // Redirect setelah penghapusan berhasil
            header("Location: listuser.php?status=deleted");
            exit; // Pastikan tidak ada eksekusi kode setelah ini
        } else {
            // Jika eksekusi query gagal, arahkan ke halaman error dengan parameter status
            header("Location: listuser.php?status=error");
            exit;
        }

        // Tutup statement
        $stmt->close();
    } else {
        // Jika gagal menyiapkan statement
        header("Location: listuser.php?status=error");
        exit;
    }
} else {
    // Jika ID tidak ada di URL
    header("Location: listuser.php?status=noid");
    exit;
}

// Tutup koneksi
$koneksi->close();
?>
