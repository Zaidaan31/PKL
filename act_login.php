<?php
session_start();
include 'koneksi.php'; // Sertakan koneksi database

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = trim(mysqli_real_escape_string($koneksi, $_POST['username']));
    $password = trim($_POST['password']);
    // Level tidak diperlukan di sini karena akan diambil dari database

    // Query untuk memeriksa kredensial pengguna
    $query = "SELECT id, username, password, level FROM user WHERE username = ?";
    $stmt = $koneksi->prepare($query);
    
    if ($stmt) {
        $stmt->bind_param("s", $username);
        $stmt->execute();
        $stmt->store_result();

        if ($stmt->num_rows > 0) {
            $stmt->bind_result($user_id, $db_username, $db_password, $db_level);
            $stmt->fetch();

            // Cek password
            if (password_verify($password, $db_password)) {
                // Menyimpan informasi pengguna ke dalam sesi
                $_SESSION['id'] = $user_id;
                $_SESSION['username'] = $db_username;
                $_SESSION['level'] = $db_level; // Simpan level dari database

                // Redirect ke halaman utama
                header('Location: dashboard.php');
                exit();
            } else {
                $error = "Username atau password salah.";
            }
        } else {
            $error = "Username atau password salah.";
        }

        $stmt->close();
    } else {
        $error = "Terjadi kesalahan pada query.";
    }
}

