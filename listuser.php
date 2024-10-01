<?php
include 'koneksi.php'; // Sertakan koneksi database

// Memeriksa apakah ada proses pembaruan
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['update_user'])) {
    $user_id = intval($_POST['user_id']);
    $username = $_POST['username'];
    $level = $_POST['level'];
    $password = $_POST['password'];
    $confirm_password = $_POST['confirm_password'];

    // Validasi input
    $error = '';
    if (empty($username) || empty($level)) {
        $error = 'Semua field harus diisi.';
    } elseif ($password !== $confirm_password) {
        $error = 'Password dan konfirmasi password tidak cocok.';
    }

    // Jika tidak ada error, proses update
    if (empty($error)) {
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
            header("Location: listuser.php?status=updated");
            exit();
        } else {
            $error = 'Terjadi kesalahan saat memperbarui akun. Silakan coba lagi.';
        }
    }
}

// Membuat query untuk mengambil semua data dari tabel 'user'
$query = "SELECT * FROM user";

// Menjalankan query
$result = $koneksi->query($query);
?>

<!-- Navbar -->
<?php include 'navbar.php'; ?>
<!-- Sidebar -->
<?php include 'sidebar.php'; ?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        body {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .scrollbar-custom::-webkit-scrollbar {
            width: 10px;
            height: 10px;
        }

        .scrollbar-custom::-webkit-scrollbar-track {
            background: #f3f4f6;
        }

        .scrollbar-custom::-webkit-scrollbar-thumb {
            background: #6b7280;
            border-radius: 8px;
        }

        .scrollbar-custom::-webkit-scrollbar-thumb:hover {
            background: #374151;
        }

        .main-content {
            margin-top: 3rem;
            margin-left: 14rem;
            transition: margin-left 0.3s ease;
            padding: 1rem;
            flex-grow: 1;
        }

        #menu-button {
            transition: transform 0.3s ease;
        }

        .menu-button-shift {
            transform: translateX(8rem);
        }
    </style>
    <title>Dashboard</title>
</head>

<body class="bg-gray-100 flex min-h-screen scrollbar-custom">
    <!-- Main content -->
    <div id="main-content" class="main-content flex flex-col items-center">
        <!-- Hamburger Button -->
        <button id="menu-button" class="text-white lg:hidden absolute top-3 left-3 z-50">
            <i id="icon-hamburger" class="fas fa-bars fa-2x"></i>
            <i id="icon-close" class="fas fa-times fa-2x opacity-0"></i>
        </button>

        <div
            class="container absolute left-0 right-0 mx-auto max-w-[86vw] md:max-w-[90vw] lg:relative lg:left-auto lg:right-auto lg:mx-0 lg:max-w-[74vw]">
            <div class="bg-white shadow-md my-10 rounded-lg">
                <table class="min-w-full divide-y divide-gray-200">
                    <thead class="bg-gray-50">
                        <tr>
                            <th
                                class="px-6 py-3 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">
                                Username</th>
                            <th
                                class="px-6 py-3 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">
                                Level</th>
                            <th
                                class="px-6 py-3 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">
                                Action</th>
                        </tr>
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-200">
                        <?php
                        if ($result && mysqli_num_rows($result) > 0) {
                            while ($row = mysqli_fetch_assoc($result)) {
                                echo "<tr>";
                                echo "<td class='px-6 py-4 text-center whitespace-nowrap text-sm text-gray-500'>" . htmlspecialchars($row['username']) . "</td>";
                                echo "<td class='px-6 py-4 text-center whitespace-nowrap text-sm text-gray-500'>" . htmlspecialchars($row['level']) . "</td>";
                                echo "<td class='px-6 py-4 text-center whitespace-nowrap text-sm text-gray-500'>";
                                // Icon Edit
                                echo "<a href='form_editU.php?id=" . $row['id'] . "' class='text-gray-600 hover:text-gray-800'><i class='fas fa-edit'></i></a> ";
                                // Icon Delete
                                echo "<a href='#' class='text-gray-600 hover:text-gray-800' onclick=\"confirmDelete('" . $row['id'] . "')\"><i class='fas fa-trash-alt'></i></a>";
                                echo "</td>";
                                echo "</tr>";
                            }
                        } else {
                            echo '<tr><td colspan="3" class="px-6 py-4 text-center text-sm text-gray-500">No results found.</td></tr>';
                        }
                        ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script>
        // Confirmation for delete with SweetAlert2
        function confirmDelete(id) {
            Swal.fire({
                title: "Are you sure?",
                text: "You won't be able to revert this!",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#1f2937",
                cancelButtonColor: "#6b7280",
                confirmButtonText: "Yes, delete it!"
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location.href = "delete_user.php?id=" + id;
                }
            });
        }

        <?php
        // Check the status from the URL if available
        if (isset($_GET['status'])) {
            $status = $_GET['status'];
            if ($status == 'deleted') {
                echo "Swal.fire({ title: 'Deleted!', text: 'User has been deleted successfully.', icon: 'success' });";
            } elseif ($status == 'error') {
                echo "Swal.fire({ title: 'Error!', text: 'Failed to delete the user.', icon: 'error' });";
            } elseif ($status == 'noid') {
                echo "Swal.fire({ title: 'Error!', text: 'No user ID provided.', icon: 'error' });";
            } elseif ($status == 'updated') {
                echo "Swal.fire({ title: 'Updated!', text: 'User has been updated successfully.', icon: 'success' });";
            }
        }
        ?>
    </script>
</body>

</html>
