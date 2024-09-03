<?php
if (!isset($_SESSION['id'])) {
    header("Location: login.php");
    exit();
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* Custom scrollbar styles */
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
    </style>
</head>

<body>
    <div id="sidebar"
        class="fixed inset-y-0 left-0 z-40 w-40 md:w-40 lg:w-56 scrollbar-custom overflow-y-auto bg-gray-700 text-white transform -translate-x-full transition-transform duration-300 lg:translate-x-0">
        <div class="flex flex-col items-center py-7 px-2">
            <h1 class="text-3xl font-bold">Menu</h1>
            <nav class="flex flex-col w-full items-center justify-center space-y-2 mt-4">
                <a href="dashboard.php"
                    class="flex items-center py-2 px-4 w-full text-white hover:bg-gray-500 transition duration-300">
                    <i class="fas fa-home text-lg"></i>
                    <span class="ml-3 justify-center font-bold text-base">Home</span>
                </a>
                <?php if ($_SESSION['level'] == 'admin'): ?>
                <a href="signup.php"
                    class="flex items-center py-2 px-4 w-full text-white hover:bg-gray-500 transition duration-300">
                    <i class="fas fa-file-alt text-lg"></i>
                    <span class="ml-3 justify-center font-bold text-base">Daftar Akun Baru</span>
                </a>
                <?php endif;?>
                <?php if ($_SESSION['level'] == 'admin' || $_SESSION['level'] == 'sales ckr'): ?>
                    <a href="form.php"
                        class="flex items-center py-2 px-4 w-full text-white hover:bg-gray-500 transition duration-300">
                        <i class="fas fa-file-alt text-lg"></i>
                        <span class="ml-3 justify-center font-bold text-base">Input Form</span>
                    </a>
                <?php endif; ?>
                <?php if ($_SESSION['level'] == 'admin' || $_SESSION['level'] == 'finance ckr'): ?>
                    <a href="data_dco_ckr.php"
                        class="flex items-center py-2 px-4 w-full text-white hover:bg-gray-500 transition duration-300">
                        <i class="fas fa-database text-lg"></i>
                        <span class="ml-3 justify-center font-bold text-base">DCO Cikarang</span>
                    </a>
                    <a href="data_dci_ckr.php"
                        class="flex items-center py-2 px-4 w-full text-white hover:bg-gray-500 transition duration-300">
                        <i class="fas fa-database text-lg"></i>
                        <span class="ml-3 justify-center font-bold text-base">DCI Cikarang</span>
                    </a>
                <?php endif; ?>
                <?php if ($_SESSION['level'] == 'admin' || $_SESSION['level'] == 'sales bks'): ?>
                    <a href="form_bekasi.php"
                        class="flex items-center py-2 px-4 w-full text-white hover:bg-gray-500 transition duration-300">
                        <i class="fas fa-file-alt text-lg"></i>
                        <span class="ml-3 justify-center font-bold text-base">Input Form</span>
                    </a>
                <?php endif; ?>
                <?php if ($_SESSION['level'] == 'admin' || $_SESSION['level'] == 'finance bks'): ?>
                    <a href="data_dco_bks.php"
                        class="flex items-center py-2 px-4 w-full text-white hover:bg-gray-500 transition duration-300">
                        <i class="fas fa-database text-lg"></i>
                        <span class="ml-3 justify-center font-bold text-base">DCO Bekasi</span>
                    </a>
                    <a href="data_dci_bks.php"
                        class="flex items-center py-2 px-4 w-full text-white hover:bg-gray-500 transition duration-300">
                        <i class="fas fa-database text-lg"></i>
                        <span class="ml-3 justify-center font-bold text-base">DCI Bekasi</span>
                    </a>
                <?php endif; ?>
                <?php if ($_SESSION['level'] == 'admin' || $_SESSION['level'] == 'sales jkt'): ?>
                    <a href="form_jakarta.php"
                        class="flex items-center py-2 px-4 w-full text-white hover:bg-gray-500 transition duration-300">
                        <i class="fas fa-file-alt text-lg"></i>
                        <span class="ml-3 justify-center font-bold text-base">Input Form</span>
                    </a>
                <?php endif; ?>
                <?php if ($_SESSION['level'] == 'admin' || $_SESSION['level'] == 'finance jkt'): ?>
                    <a href="data_dco_jkt.php"
                        class="flex items-center py-2 px-4 w-full text-white hover:bg-gray-500 transition duration-300">
                        <i class="fas fa-database text-lg"></i>
                        <span class="ml-3 justify-center font-bold text-base">DCO Jakarta</span>
                    </a>
                    <a href="data_dci_jkt.php"
                        class="flex items-center py-2 px-4 w-full text-white hover:bg-gray-500 transition duration-300">
                        <i class="fas fa-database text-lg"></i>
                        <span class="ml-3 justify-center font-bold text-base">DCI Jakarta</span>
                    </a>
                <?php endif; ?>
                <?php if ($_SESSION['level'] == 'admin' || $_SESSION['level'] == 'sales dpk'): ?>
                    <a href="form_depok.php"
                        class="flex items-center py-2 px-4 w-full text-white hover:bg-gray-500 transition duration-300">
                        <i class="fas fa-file-alt text-lg"></i>
                        <span class="ml-3 justify-center font-bold text-base">Input Form</span>
                    </a>
                <?php endif; ?>
                <?php if ($_SESSION['level'] == 'admin' || $_SESSION['level'] == 'finance dpk'): ?>
                    <a href="data_dco_dpk.php"
                        class="flex items-center py-2 px-4 w-full text-white hover:bg-gray-500 transition duration-300">
                        <i class="fas fa-database text-lg"></i>
                        <span class="ml-3 justify-center font-bold text-base">DCO Depok</span>
                    </a>
                    <a href="data_dci_dpk.php"
                        class="flex items-center py-2 px-4 w-full text-white hover:bg-gray-500 transition duration-300">
                        <i class="fas fa-database text-lg"></i>
                        <span class="ml-3 justify-center font-bold text-base">DCI Depok</span>
                    </a>
                <?php endif; ?>
                <?php if ($_SESSION['level'] == 'admin' || $_SESSION['level'] == 'sales bgr'): ?>
                    <a href="form_bogor.php"
                        class="flex items-center py-2 px-4 w-full text-white hover:bg-gray-500 transition duration-300">
                        <i class="fas fa-file-alt text-lg"></i>
                        <span class="ml-3 justify-center font-bold text-base">Input Form</span>
                    </a>
                <?php endif; ?>
                <?php if ($_SESSION['level'] == 'admin' || $_SESSION['level'] == 'finance bgr'): ?>
                    <a href="data_dco_bgr.php"
                        class="flex items-center py-2 px-4 w-full text-white hover:bg-gray-500 transition duration-300">
                        <i class="fas fa-database text-lg"></i>
                        <span class="ml-3 justify-center font-bold text-base">DCO Bogor</span>
                    </a>
                    <a href="data_dci_bgr.php"
                        class="flex items-center py-2 px-4 w-full text-white hover:bg-gray-500 transition duration-300">
                        <i class="fas fa-database text-lg"></i>
                        <span class="ml-3 justify-center font-bold text-base">DCI Bogor</span>
                    </a>
                <?php endif; ?>
                <?php if ($_SESSION['level'] == 'admin' || $_SESSION['level'] == 'sales tgr'): ?>
                <a href="form_tanggerang.php"
                    class="flex items-center py-2 px-4 w-full text-white hover:bg-gray-500 transition duration-300">
                    <i class="fas fa-file-alt text-lg"></i>
                    <span class="ml-3 justify-center font-bold text-base">Input Form</span>
                </a>
                <?php endif; ?>
                <?php if ($_SESSION['level'] == 'admin' || $_SESSION['level'] == 'finance tgr'): ?>
                <a href="data_dco_tgr.php"
                    class="flex items-center py-2 px-4 w-full text-white hover:bg-gray-500 transition duration-300">
                    <i class="fas fa-database text-lg"></i>
                    <span class="ml-3 justify-center font-bold text-base">DCO Tanggerang</span>
                </a>
                <a href="data_dci_tgr.php"
                    class="flex items-center py-2 px-4 w-full text-white hover:bg-gray-500 transition duration-300">
                    <i class="fas fa-database text-lg"></i>
                    <span class="ml-3 justify-center font-bold text-base">DCI Tanggerang</span>
                </a>
                <?php endif; ?>
            </nav>
        </div>
    </div>
</body>

</html>