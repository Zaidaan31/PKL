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
    <title>Feedback Form</title>
    <style>
        .form-container {
            max-width: 600px;
            margin: auto;
            padding: 2rem;
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
    </style>
</head>

<body class="bg-gray-100 min-h-screen flex flex-col scrollbar-custom">
    <!-- Sidebar -->
    <div id="sidebar" class="fixed top-0 left-0 h-full bg-gray-700 text-white w-64 transform -translate-x-full md:translate-x-0 transition-transform duration-300">
        <?php include 'sidebar.php'; ?>
    </div>

    <!-- Main Content -->
    <div id="main-content" class="flex-grow p-4 ml-0 md:ml-64 transition-all duration-300 mt-20">
        <!-- Hamburger Button -->
        <button id="menu-button" class="text-white md:hidden absolute top-3 left-3 z-50">
            <i id="icon-hamburger" class="fas fa-bars fa-2x"></i>
            <i id="icon-close" class="fas fa-times fa-2x opacity-0"></i>
        </button>

        <div class="form-container bg-white shadow-lg rounded-xl border border-gray-200">
            <h1 class="text-2xl font-bold text-gray-700 mb-4 text-center">Feedback Form</h1>

            <form action="submit_feedback.php" method="post" class="space-y-4">
                <div>
                    <label for="name" class="block text-lg font-medium text-gray-600">Name</label>
                    <input type="text" id="name" name="name" required
                        class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-gray-500 focus:border-gray-500 sm:text-sm">
                </div>

                <div>
                    <label for="comment" class="block text-lg font-medium text-gray-600">Comment</label>
                    <textarea id="comment" name="comment" rows="4" required
                        class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-gray-500 focus:border-gray-500 sm:text-sm"></textarea>
                </div>

                <div class="flex justify-end">
                    <button type="submit"
                        class="bg-gray-500 text-white py-2 px-4 rounded-lg hover:bg-gray-600 transition duration-300">Submit</button>
                </div>
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
