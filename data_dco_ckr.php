<?php
include 'koneksi.php'; // Sertakan koneksi database

// Define total number of results you want per page.
$results_per_page = 50;

// Find out the number of results stored in the database.
$query = "SELECT COUNT(*) AS total FROM customer WHERE id_barang!=0";
$result = mysqli_query($koneksi, $query);

if (!$result) {
    die("Query failed: " . mysqli_error($koneksi));
}

$row = mysqli_fetch_assoc($result);

// Check if $row is not null before accessing its elements
if ($row && isset($row['total'])) {
    $total_results = $row['total'];
} else {
    $total_results = 0;
}

if ($total_results > 0) {
    // Determine the total number of pages available.
    $number_of_pages = ceil($total_results / $results_per_page);

    // Determine which page number the visitor is currently on.
    $page = isset($_GET['page']) ? $_GET['page'] : 1;

    // Determine the SQL LIMIT starting number for the results on the displaying page.
    $starting_limit_number = ($page - 1) * $results_per_page;

    // Retrieve selected results from the database and display them on the page.
    $query = "CALL GetDCOckr($starting_limit_number, $results_per_page)";
    $result = mysqli_query($koneksi, $query);

    if (!$result) {
        die("Query failed: " . mysqli_error($koneksi));
    }
} else {
    // If there are no results, handle it appropriately
    echo "No results found.";
}
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

<body class="bg-gray-100 flex min-h-screen">
    <!-- Main content -->
    <div id="main-content" class="main-content flex flex-col items-center">
        <button id="menu-button" class="text-white lg:hidden absolute top-3 left-3 z-50">
            <i id="icon-hamburger" class="fas fa-bars fa-2x"></i>
            <i id="icon-close" class="fas fa-times fa-2x opacity-0"></i>
        </button>

        <div
            class="container absolute left-0 right-0 mx-auto max-w-[86vw] md:max-w-[90vw] lg:relative lg:left-auto lg:right-auto lg:mx-0 lg:max-w-[74vw]">
            <div class="flex justify-end mb-5">
                <a href="cetak_dco_ckr.php"
                    class="bg-gray-400 text-white my-3 mx-5 px-4 py-2 text-sm tex rounded-lg hover:opacity-75 lg:py-3 lg:px-5 lg:text-lg  transition duration-300">
                    <i class="fas fa-print mr-2"></i>
                    <span class="font-bold">Print</span>
                </a>
            </div>
            <div class="bg-white shadow-md rounded-lg scrollbar-custom overflow-x-auto">
                <table class="min-w-full divide-y divide-gray-200 ">
                    <thead class="bg-gray-50">
                        <tr>
                            <th
                                class="px-6 py-3 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">
                                Service</th>
                            <th
                                class="px-6 py-3 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">
                                Destination</th>
                            <th
                                class="px-6 py-3 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">
                                Code</th>
                            <th
                                class="px-6 py-3 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">
                                Date</th>
                            <th
                                class="px-6 py-3 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">
                                Customer Name</th>
                            <th
                                class="px-6 py-3 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">
                                Recipient Name</th>
                            <th
                                class="px-6 py-3 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">
                                Quantity</th>
                            <th
                                class="px-6 py-3 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">
                                Weight</th>
                            <th
                                class="px-6 py-3 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">
                                Amount</th>
                        </tr>
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-200">
                        <?php while ($row = mysqli_fetch_assoc($result)): ?>
                            <tr>
                                <td class="px-6 py-4 text-center whitespace-nowrap text-sm text-gray-500">
                                    <?php echo htmlspecialchars($row['Service']); ?></td>
                                <td class="px-6 py-4 text-center whitespace-nowrap text-sm text-gray-500">
                                    <?php echo htmlspecialchars($row['Tujuan']); ?></td>
                                <td class="px-6 py-4 text-center whitespace-nowrap text-sm text-gray-500">
                                    <?php echo htmlspecialchars($row['Kode']); ?></td>
                                <td class="px-6 py-4 text-center whitespace-nowrap text-sm text-gray-500">
                                    <?php echo htmlspecialchars($row['Tanggal']); ?></td>
                                <td class="px-6 py-4 text-center whitespace-nowrap text-sm text-gray-500">
                                    <?php echo htmlspecialchars($row['Pengirim']); ?></td>
                                <td class="px-6 py-4 text-center whitespace-nowrap text-sm text-gray-500">
                                    <?php echo htmlspecialchars($row['Penerima']); ?></td>
                                <td class="px-6 py-4 text-center whitespace-nowrap text-sm text-gray-500">
                                    <?php echo htmlspecialchars($row['Kuantitas']); ?></td>
                                <td class="px-6 py-4 text-center whitespace-nowrap text-sm text-gray-500">
                                    <?php echo htmlspecialchars($row['Berat']); ?></td>
                                <td class="px-6 py-4 text-center whitespace-nowrap text-sm text-gray-500">
                                    <?php echo htmlspecialchars($row['Amount']); ?></td>
                            </tr>
                        <?php endwhile; ?>
                    </tbody>
                </table>
            </div>
            <div class="flex justify-between my-5">
                <!-- Pagination Links -->
                <div class="pagination">
                    <?php for ($page = 1; $page <= $number_of_pages; $page++): ?>
                        <a href="data_dco_ckr.php?page=<?= $page; ?>" class="bg-white hover:opacity-75 px-4 py-2 border"><?= $page; ?></a>
                    <?php endfor; ?>
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