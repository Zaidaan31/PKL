<?php
include 'koneksi.php'; // Sertakan file koneksi database

session_start();

$error = '';
$success = '';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];
    $confirm_password = $_POST['confirm_password'];

    // Validasi input
    if (empty($username) || empty($password) || empty($confirm_password)) {
        $error = 'Semua field harus diisi.';
    } elseif ($password !== $confirm_password) {
        $error = 'Password dan konfirmasi password tidak cocok.';
    } else {
        // Hash password
        $hashed_password = password_hash($password, PASSWORD_BCRYPT);

        // Query untuk memeriksa apakah username sudah ada
        $query = "SELECT id FROM user WHERE username = ?";
        $stmt = $koneksi->prepare($query);
        $stmt->bind_param("s", $username);
        $stmt->execute();
        $stmt->store_result();

        if ($stmt->num_rows > 0) {
            $error = 'Username sudah digunakan.';
        } else {
            // Query untuk menambahkan pengguna baru
            $query = "INSERT INTO user (username, password) VALUES (?, ?)";
            $stmt = $koneksi->prepare($query);
            $stmt->bind_param("ss", $username, $hashed_password);

            if ($stmt->execute()) {
                $success = 'Akun berhasil dibuat. Silakan <a href="login.php" class="text-gray-600 hover:underline">login</a>.';
            } else {
                $error = 'Terjadi kesalahan saat membuat akun. Silakan coba lagi.';
            }

            $stmt->close();
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <title>Sign Up</title>
</head>
<body class="bg-gray-100 min-h-screen flex items-center justify-center">
    <div class="bg-white shadow-lg rounded-lg p-8 max-w-md w-full">
        <h1 class="text-2xl font-bold text-gray-700 mb-6 text-center">Sign Up</h1>

        <?php if ($error): ?>
            <div class="bg-red-100 text-red-700 p-4 rounded mb-4">
                <?php echo htmlspecialchars($error); ?>
            </div>
        <?php endif; ?>

        <?php if ($success): ?>
            <div class="bg-green-100 text-green-700 p-4 rounded mb-4">
                <?php echo $success; ?>
            </div>
        <?php endif; ?>

        <form action="signup.php" method="POST">
            <div class="mb-4">
                <label for="username" class="block text-gray-700 font-bold mb-2">Username</label>
                <input type="text" id="username" name="username" class="w-full px-3 py-2 border rounded text-gray-900 focus:outline-none focus:ring focus:ring-gray-200" required>
            </div>
            <div class="mb-4">
                <label for="password" class="block text-gray-700 font-bold mb-2">Password</label>
                <input type="password" id="password" name="password" class="w-full px-3 py-2 border rounded text-gray-900 focus:outline-none focus:ring focus:ring-gray-200" required>
            </div>
            <div class="mb-6">
                <label for="confirm_password" class="block text-gray-700 font-bold mb-2">Confirm Password</label>
                <input type="password" id="confirm_password" name="confirm_password" class="w-full px-3 py-2 border rounded text-gray-900 focus:outline-none focus:ring focus:ring-gray-200" required>
            </div>
            <button type="submit" class="w-full bg-gray-700 text-white font-bold py-2 rounded hover:bg-gray-800 transition duration-300">Sign Up</button>
        </form>
        <p class="mt-4 text-center text-gray-700">Already have an account? <a href="login.php" class="text-gray-600 hover:underline">Login</a></p>
    </div>
</body>
</html>
