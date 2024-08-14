<?php include 'koneksi.php'; ?>
<?php include 'sidebar.php'; ?>
<?php include 'navbar.php'; ?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <title>User Feedback</title>
    <style>
        /* Custom scrollbar styles */
        .scrollbar-custom::-webkit-scrollbar {
            width: 12px;
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

<body class="bg-gray-100 flex min-h-screen scrollbar-custom">
    <!-- Sidebar -->
    <?php include 'sidebar.php'; ?>

    <!-- Main content -->
    <div id="main-content" class="flex-grow p-4 ml-0 md:ml-64 transition-all duration-300">
        <!-- Hamburger Button -->
        <button id="menu-button" class="text-white md:hidden absolute top-3 left-3 z-50">
            <i id="icon-hamburger" class="fas fa-bars fa-2x"></i>
            <i id="icon-close" class="fas fa-times fa-2x opacity-0"></i>
        </button>

        <!-- Page Content -->
        <div class="container mx-auto mt-16">
            <h1 class="text-3xl font-bold text-gray-700 mb-6 text-center">User Feedback</h1>
            <div class="bg-white shadow-lg rounded-xl border border-gray-200 p-6">
                <?php
                // Determine the current page and calculate the offset
                $limit = 5; // Number of comments per page
                $page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
                $offset = ($page - 1) * $limit;

                // Get the total number of comments
                $total_result = mysqli_query($koneksi, "SELECT COUNT(*) AS total FROM feedback");
                $total_row = mysqli_fetch_assoc($total_result);
                $total_comments = $total_row['total'];
                $total_pages = ceil($total_comments / $limit);

                // Fetch the feedback with LIMIT and OFFSET
                $result = mysqli_query($koneksi, "SELECT * FROM feedback ORDER BY id DESC LIMIT $limit OFFSET $offset");
                while ($row = mysqli_fetch_assoc($result)) {
                    echo '<div class="mb-6 flex justify-between items-start">';
                    echo '<div class="w-5/6">';
                    echo '<h2 class="text-xl font-bold text-gray-600">' . htmlspecialchars($row['name']) . '</h2>';
                    echo '<p class="mt-2 text-gray-700">' . nl2br(htmlspecialchars($row['comment'])) . '</p>';
                    echo '</div>';
                    echo '<p class="text-sm text-gray-500">' . htmlspecialchars($row['date']) . '</p>';
                    echo '</div>';
                }
                ?>

                <!-- Pagination -->
                <div class="flex justify-center mt-4">
                    <?php if ($page > 1): ?>
                        <a href="?page=<?php echo $page - 1; ?>" class="px-4 py-2 bg-gray-500 hover:bg-gray-700 text-white rounded-md">Previous</a>
                    <?php endif; ?>

                    <?php if ($page < $total_pages): ?>
                        <a href="?page=<?php echo $page + 1; ?>" class="ml-2 px-4 py-2 bg-gray-500 hover:bg-gray-700 text-white rounded-md">Next</a>
                    <?php endif; ?>
                </div>
            </div>
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
                mainContent.classList.add('main-content-shift'); // Tambahkan kelas pergeseran
                menuButton.classList.add('menu-button-shift'); // Tambahkan kelas pergeseran
            } else {
                sidebar.classList.add('-translate-x-full');
                sidebar.classList.remove('translate-x-0');
                iconHamburger.classList.remove('opacity-0');
                iconClose.classList.add('opacity-0');
                mainContent.classList.remove('main-content-shift'); // Hapus kelas pergeseran
                menuButton.classList.remove('menu-button-shift'); // Hapus kelas pergeseran
            }
        });
    </script>

</body>

</html>
