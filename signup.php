<?php
include 'koneksi.php'; // Sertakan file koneksi database
include 'navbar.php';
include 'sidebar.php';

$error = '';
$success = '';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];
    $confirm_password = $_POST['confirm_password'];
    $level = $_POST['level'];

    // Validasi input
    if (empty($username) || empty($password) || empty($confirm_password) || empty($level)) {
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
            $query = "INSERT INTO user (username, password, level) VALUES (?, ?, ?)";
            $stmt = $koneksi->prepare($query);
            $stmt->bind_param("sss", $username, $hashed_password, $level);

            if ($stmt->execute()) {
                $success = 'Akun berhasil dibuat.';
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <title>Sign Up</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        .main-content {
            margin-top: 3rem; /* Ruang untuk navbar */
            margin-left: 16rem; /* Ruang untuk sidebar */
            transition: margin-left 0.3s ease; /* Transisi untuk pergeseran */
            padding: 1rem; /* Padding untuk konten */
            flex-grow: 1; /* Mengisi sisa ruang yang tersedia */
        }
        @media (max-width: 768px) {
            .main-content {
                margin-left: 0; /* Tanpa sidebar untuk layar kecil */
            }
        }
        .main-content-shift {
            margin-left: 10rem; /* Menggeser mengikuti sidebar */
        }
        #menu-button {
            transition: transform 0.3s ease;
        }
        .menu-button-shift {
            transform: translateX(8rem); /* Bergeser mengikuti sidebar */
        }
    </style>
</head>
<body class="bg-gray-100 flex min-h-screen">
    <!-- Main content -->
    <div id="main-content" class="main-content flex flex-col items-center">
        <button id="menu-button" class="text-white lg:hidden absolute top-3 left-3 z-50">
            <i id="icon-hamburger" class="fas fa-bars fa-2x"></i>
            <i id="icon-close" class="fas fa-times fa-2x opacity-0"></i>
        </button>

        <div class="bg-white shadow-lg rounded-lg p-8 max-w-md w-full mx-auto my-10">
            <h1 class="text-2xl font-bold text-gray-700 mb-6 text-center">New User</h1>

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
                <div class="mb-6">
                    <label for="level" class="block text-gray-700 font-bold mb-2">User Level</label>
                    <select name="level" id="level" class="w-full h-10 px-3 py-2 border rounded text-gray-900 focus:outline-none focus:ring focus:ring-gray-200">
                        <option value="">---</option>
                        <option value="finance ckr">Finance Cikarang</option>
                        <option value="finance bks">Finance Bekasi</option>
                        <option value="finance jkt">Finance Jakarta</option>
                        <option value="finance dpk">Finance Depok</option>
                        <option value="finance bgr">Finance Bogor</option>
                        <option value="finance tgr">Finance Tanggerang</option>
                        <option value="sales ckr">Sales Counter Cikarang</option>
                        <option value="sales bks">Sales Counter Bekasi</option>
                        <option value="sales jkt">Sales Counter Jakarta</option>
                        <option value="sales dpk">Sales Counter Depok</option>
                        <option value="sales bgr">Sales Counter Bogor</option>
                        <option value="sales tgr">Sales Counter Tanggerang</option>
                    </select>
                </div>
                <button type="submit" class="w-full bg-gray-700 text-white font-bold py-2 rounded hover:bg-gray-800 transition duration-300">Sign Up</button>
            </form>
        </div>
    </div>

    <script>
        const menuButton = document.getElementById('menu-button');
        const sidebar = document.getElementById('sidebar');
        const mainContent = document.getElementById('main-content');
        const iconHamburger = document.getElementById('icon-hamburger');
        const iconClose = document.getElementById('icon-close');

        menuButton.addEventListener('click', () => {
            if (sidebar.classList.contains('-translate-x-full')) {
                sidebar.classList.remove('-translate-x-full');
                sidebar.classList.add('translate-x-0');
                iconHamburger.classList.add('opacity-0');
                iconClose.classList.remove('opacity-0');
                mainContent.classList.add('main-content-shift');
                menuButton.classList.add('menu-button-shift');
            } else {
                sidebar.classList.add('-translate-x-full');
                sidebar.classList.remove('translate-x-0');
                iconHamburger.classList.remove('opacity-0');
                iconClose.classList.add('opacity-0');
                mainContent.classList.remove('main-content-shift');
                menuButton.classList.remove('menu-button-shift');
            }
        });
    </script>
</body>
</html>
