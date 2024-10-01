<?php
include 'koneksi.php'; // Sertakan file koneksi database
include 'navbar.php';
include 'sidebar.php';

$error = '';

// Ambil ID dari URL
if (isset($_GET['id'])) {
    $user_id = intval($_GET['id']); // Pastikan ID merupakan integer untuk keamanan

    // Ambil data pengguna berdasarkan ID
    $query = "SELECT username, level FROM user WHERE id = ?";
    $stmt = $koneksi->prepare($query);
    $stmt->bind_param("i", $user_id);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $user = $result->fetch_assoc();
        $username = $user['username'];
        $level = $user['level'];
    } else {
        $error = 'Pengguna tidak ditemukan.';
    }
} else {
    $error = 'No user ID provided.';
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
    <title>Edit User</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        .main-content {
            margin-top: 3rem;
            margin-left: 16rem;
            transition: margin-left 0.3s ease;
            padding: 1rem;
            flex-grow: 1;
        }
        @media (max-width: 768px) {
            .main-content {
                margin-left: 0;
            }
        }
    </style>
</head>
<body class="bg-gray-100 flex min-h-screen">
    <div id="main-content" class="main-content flex flex-col items-center">
        <div class="bg-white shadow-lg rounded-lg p-8 max-w-md w-full mx-auto my-10">
            <h1 class="text-2xl font-bold text-gray-700 mb-6 text-center">Edit User</h1>

            <?php if ($error): ?>
                <div class="bg-red-100 text-red-700 p-4 rounded mb-4">
                    <?php echo htmlspecialchars($error); ?>
                </div>
            <?php endif; ?>

            <form action="update_user.php?id=<?php echo $user_id; ?>" method="POST">
                <div class="mb-4">
                    <label for="username" class="block text-gray-700 font-bold mb-2">Username</label>
                    <input type="text" id="username" name="username"
                        class="w-full px-3 py-2 border rounded text-gray-900 focus:outline-none focus:ring focus:ring-gray-200"
                        value="<?php echo htmlspecialchars($username); ?>" required>
                </div>
                <div class="mb-4">
                    <label for="password" class="block text-gray-700 font-bold mb-2">New Password (Leave blank to keep current)</label>
                    <input type="password" id="password" name="password"
                        class="w-full px-3 py-2 border rounded text-gray-900 focus:outline-none focus:ring focus:ring-gray-200">
                </div>
                <div class="mb-6">
                    <label for="confirm_password" class="block text-gray-700 font-bold mb-2">Confirm New Password</label>
                    <input type="password" id="confirm_password" name="confirm_password"
                        class="w-full px-3 py-2 border rounded text-gray-900 focus:outline-none focus:ring focus:ring-gray-200">
                </div>
                <div class="mb-6">
                    <label for="level" class="block text-gray-700 font-bold mb-2">User Level</label>
                    <select name="level" id="level"
                        class="w-full h-10 px-3 py-2 border rounded text-gray-900 focus:outline-none focus:ring focus:ring-gray-200"
                        required>
                        <option value="">---</option>
                        <option value="finance ckr" <?php echo ($level == 'finance ckr') ? 'selected' : ''; ?>>Finance Cikarang</option>
                        <option value="finance bks" <?php echo ($level == 'finance bks') ? 'selected' : ''; ?>>Finance Bekasi</option>
                        <option value="finance jkt" <?php echo ($level == 'finance jkt') ? 'selected' : ''; ?>>Finance Jakarta</option>
                        <option value="finance dpk" <?php echo ($level == 'finance dpk') ? 'selected' : ''; ?>>Finance Depok</option>
                        <option value="finance bgr" <?php echo ($level == 'finance bgr') ? 'selected' : ''; ?>>Finance Bogor</option>
                        <option value="finance tgr" <?php echo ($level == 'finance tgr') ? 'selected' : ''; ?>>Finance Tanggerang</option>
                        <option value="sales ckr" <?php echo ($level == 'sales ckr') ? 'selected' : ''; ?>>Sales Counter Cikarang</option>
                        <option value="sales bks" <?php echo ($level == 'sales bks') ? 'selected' : ''; ?>>Sales Counter Bekasi</option>
                        <option value="sales jkt" <?php echo ($level == 'sales jkt') ? 'selected' : ''; ?>>Sales Counter Jakarta</option>
                        <option value="sales dpk" <?php echo ($level == 'sales dpk') ? 'selected' : ''; ?>>Sales Counter Depok</option>
                        <option value="sales bgr" <?php echo ($level == 'sales bgr') ? 'selected' : ''; ?>>Sales Counter Bogor</option>
                        <option value="sales tgr" <?php echo ($level == 'sales tgr') ? 'selected' : ''; ?>>Sales Counter Tanggerang</option>
                    </select>
                </div>
                <div class="flex justify-between">
                    <button type="submit"
                        class="w-full bg-gray-700 text-white font-bold py-2 rounded hover:bg-gray-800 transition duration-300">Update</button>
                    <a href="listuser.php"
                        class="ml-4 w-full text-center text-gray-500 bg-gray-200 hover:bg-gray-300 font-bold py-2 rounde transition duration-300">Cancel</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
