<?php
include 'koneksi.php'; // Sertakan file koneksi database

$error = '';

// Ambil ID dari URL
if (isset($_GET['id'])) {
    $user_id = intval($_GET['id']); // Pastikan ID merupakan integer untuk keamanan

    // Proses pengeditan jika form disubmit
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        // Ambil data
        $username = $_POST['username'];
        $password = $_POST['password'];
        $confirm_password = $_POST['confirm_password'];
        $level = $_POST['level'];

        // Validasi input
        if (empty($username) || empty($level)) {
            $error = 'Semua field harus diisi.';
        } elseif ($password !== $confirm_password) {
            $error = 'Password dan konfirmasi password tidak cocok.';
        } else {
            // Hash password jika ada perubahan
            $hashed_password = !empty($password) ? password_hash($password, PASSWORD_BCRYPT) : null;

            // Query untuk memperbarui pengguna
            $query = "UPDATE user SET username = ?, level = ?" . ($hashed_password ? ", password = ?" : "") . " WHERE id = ?";
            $stmt = $koneksi->prepare($query);

            if ($hashed_password) {
                $stmt->bind_param("sssi", $username, $level, $hashed_password, $user_id);
            } else {
                $stmt->bind_param("ssi", $username, $level, $user_id);
            }

            if ($stmt->execute()) {
                // Redirect ke listuser.php dengan status
                header("Location: listuser.php?status=updated");
                exit();
            } else {
                $error = 'Terjadi kesalahan saat memperbarui akun. Silakan coba lagi.';
            }
        }
    }
} else {
    $error = 'No user ID provided.';
}

// Jika ada error, redirect kembali ke form edit dengan error message
if ($error) {
    header("Location: form_editU.php?id=$user_id&error=" . urlencode($error));
    exit();
}