<?php
include 'koneksi.php'; // Sertakan koneksi database

session_start();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Query untuk memeriksa kredensial pengguna
    $query = "SELECT id, username, password FROM user WHERE username = ?";
    $stmt = $koneksi->prepare($query);
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $stmt->store_result();

    if ($stmt->num_rows > 0) {
        $stmt->bind_result($user_id, $db_username, $db_password);
        $stmt->fetch();

        // Cek password
        if (password_verify($password, $db_password)) {
            $_SESSION['id'] = $user_id;
            $_SESSION['username'] = $db_username;
            header('Location: dashboard.php'); // Redirect ke halaman utama
            exit();
        } else {
            $error = "Invalid username or password.";
        }
    } else {
        $error = "Invalid username or password.";
    }

    $stmt->close();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex items-center justify-center min-h-screen">
    <div class="bg-white p-6 rounded-lg shadow-lg w-full max-w-md">
        <h2 class="text-2xl font-bold mb-4 text-gray-700">Login</h2>
        <?php if (isset($error)) { ?>
            <div class="mb-4 p-2 bg-red-200 text-red-800 rounded"><?php echo htmlspecialchars($error); ?></div>
        <?php } ?>
        <form action="" method="POST">
            <label class="block mb-2 text-sm font-medium text-gray-600" for="username">Username</label>
            <input type="text" id="username" name="username" class="block w-full p-2 border border-gray-300 rounded mb-4" required>
            
            <label class="block mb-2 text-sm font-medium text-gray-600" for="password">Password</label>
            <input type="password" id="password" name="password" class="block w-full p-2 border border-gray-300 rounded mb-4" required>
            
            <button type="submit" class="w-full bg-gray-600 text-white p-2 rounded">Login</button>
        </form>
        <div class="mt-4 text-center">
            <p class="text-gray-600">Don't have an account?</p>
            <a href="signup.php" class="text-gray-600 hover:underline">Sign up here</a>
        </div>
    </div>
</body>
</html>
