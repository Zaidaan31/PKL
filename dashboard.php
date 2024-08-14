<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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
    <title>Dashboard</title>
</head>
<body class="bg-gray-100 flex min-h-screen">
    <!-- Sidebar -->
    <?php include 'sidebar.php'; ?>

    <!-- Navbar -->
    <?php include 'navbar.php'; ?>

    <!-- Main content -->
    <div id="main-content" class="main-content flex flex-col items-center">
        <!-- Hamburger Button -->
        <button id="menu-button" class="text-white md:hidden absolute top-3 left-3 z-50">
            <i id="icon-hamburger" class="fas fa-bars fa-2x"></i>
            <i id="icon-close" class="fas fa-times fa-2x opacity-0"></i>
        </button>

        <div class="container mx-auto my-16">
            <h1 class="text-2xl md:text-3xl lg:text-4xl xl:text-5xl font-bold text-gray-700 mb-2 text-center">Dashboard</h1>
            <div class="bg-white shadow-lg rounded-xl border border-gray-200 p-6">
                <h1 class="text-xl md:text-2xl lg:text-3xl xl:text-4xl font-bold text-gray-700 mb-6">Welcome to My App</h1>
                <h2 class="text-lg md:text-xl lg:text-2xl xl:text-3xl text-gray-500">Lorem ipsum dolor sit amet</h2>
                <p class="mt-4 text-sm md:text-md lg:text-lg xl:text-xl text-gray-900">
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                </p>
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
