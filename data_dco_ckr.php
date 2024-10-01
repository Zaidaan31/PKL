<?php
include 'koneksi.php'; // Sertakan koneksi database

// Define total number of results you want per page.
$results_per_page = 50;

// Initialize filter variables
$destination = isset($_GET['destination']) ? $_GET['destination'] : '';
$startDate = isset($_GET['startDate']) ? $_GET['startDate'] : '';
$endDate = isset($_GET['endDate']) ? $_GET['endDate'] : '';

// Check if we need to apply filters
// Initialize filter query with proper handling for empty dates
$filter_query = "";
if ($destination || $startDate || $endDate) {
    $filter_query = "AND (tr.tujuan LIKE '%$destination%' OR '$destination' = '')";

    if ($startDate && $endDate) {
        $filter_query .= " AND (tr.tanggal BETWEEN '$startDate' AND '$endDate')";
    }
}

// Count total number of results for pagination
$count_query = "SELECT COUNT(*) AS total 
                FROM trans tr
                INNER JOIN barang b ON tr.id_barang_ckr = b.id
                INNER JOIN service s ON tr.id_service = s.id
                WHERE tr.id_barang_ckr <> 0 
                -- AND MONTH(tr.tanggal) = MONTH(CURDATE())
                -- AND YEAR(tr.tanggal) = YEAR(CURDATE())
                $filter_query";

$count_result = mysqli_query($koneksi, $count_query);

if (!$count_result) {
    die("Query failed: " . mysqli_error($koneksi));
}

$count_row = mysqli_fetch_assoc($count_result);

$total_results = $count_row['total'] ?? 0; // Set default to 0 if not set

// Determine the total number of pages available.
$number_of_pages = ceil($total_results / $results_per_page);
// echo($number_of_pages);

// Determine which page number the visitor is currently on.
$page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
$page = ($page < 1) ? 1 : $page; // Ensure page is not less than 1

// Determine the SQL LIMIT starting number for the results on the displaying page.
$starting_limit_number = ($page - 1) * $results_per_page;

// Call stored procedure with or without filters
if ($destination || $startDate || $endDate) {
    $query = "CALL GetFilteredDatackr($starting_limit_number, $results_per_page, '$destination', '$startDate', '$endDate')";
} else {
    $query = "CALL GetDCOckr($starting_limit_number, $results_per_page)";
}

$result = mysqli_query($koneksi, $query);

if (!$result) {
    die("Query failed: " . mysqli_error($koneksi));
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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
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
            <div class="flex mb-1 relative">

                <div class="w-1/2 pb-0">
                    <button id="showF"
                        class="bg-gray-300 text-gray-800 font-semibold px-4 py-[6px] text-sm lg:px-4 lg:py-[10px] lg:text-lg rounded-md flex justify-start mt-10 items-center hover:bg-gray-400 transition-all">
                        <i class="fa-solid fa-filter"></i>
                        <span class="ml-2">Filter</span>
                    </button>

                    <form action="" method="get">
                        <div id="cardContainer"
                            class="hidden p-6 mt-7 rounded-lg shadow-md absolute top-16 left-4 w-96 bg-white z-50">
                            <label
                                class="block text-center text-gray-600 font-semibold py-2 bg-gray-200 rounded-t-lg">FILTER</label>

                            <div class="space-y-4 mt-4">
                                <div>
                                    <label for="startDate" class="block text-sm font-medium text-gray-700">Date:</label>
                                    <div class="flex space-x-4 mt-1">
                                        <input type="text" id="startDate" name="startDate" placeholder="Start Date"
                                            class="block w-full pl-3 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500 lg:text-md">
                                        <input type="text" id="endDate" name="endDate" placeholder="End Date"
                                            class="block w-full pl-3 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500 lg:text-md">
                                    </div>
                                </div>
                                <div>
                                    <label for="destination"
                                        class="block text-sm font-medium text-gray-700">Destination:</label>
                                    <input type="text" id="destination" name="destination" placeholder="Destination"
                                        class="block w-full mt-1 pl-3 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500 lg:text-md">
                                </div>


                                <div class="flex space-x-4">
                                    <button type="reset" id="resetFilter"
                                        class="bg-gray-300 text-gray-800 font-semibold py-2 px-4 rounded-md hover:bg-gray-400 transition-all">Reset</button>
                                    <button type="submit"
                                        class="bg-gray-500 text-white font-semibold py-2 px-4 rounded-md hover:opacity-75 transition-all">Apply</button>
                                </div>
                            </div>
                        </div>
                    </form>

                </div>
                <div class="w-1/2">
                    <a href="cetak_dco_ckr.php"
                        class="absolute top-0 right-0 bg-gray-400 text-white mt-10 mx-5 px-4 py-2 text-sm rounded-lg hover:opacity-75 lg:py-[10px] lg:px-5 lg:text-lg transition duration-300">
                        <i class="fas fa-print mr-2"></i>
                        <span class="font-bold">Print</span>
                    </a>
                </div>
            </div>
            <div class="bg-white shadow-md rounded-lg scrollbar-custom overflow-x-auto">
                    <table class="min-w-full divide-y divide-gray-200">
                    <thead class="bg-gray-50">
                        <tr>
                            <th class="px-6 py-3 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">Service</th>
                            <th class="px-6 py-3 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">Destination</th>
                            <th class="px-6 py-3 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">Item Code</th>
                            <th class="px-6 py-3 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">Transaction Code</th>
                            <th class="px-6 py-3 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">Date</th>
                            <th class="px-6 py-3 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">Customer Name</th>
                            <th class="px-6 py-3 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">Receiver Name</th>
                            <th class="px-6 py-3 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">Quantity</th>
                            <th class="px-6 py-3 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">Weight</th>
                            <th class="px-6 py-3 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">Amount</th>
                        </tr>
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-200">
                        <?php
                        if ($result && mysqli_num_rows($result) > 0) {
                            while ($row = mysqli_fetch_assoc($result)) {
                                echo "<tr>";
                                echo "<td class='px-6 py-4 text-center whitespace-nowrap text-sm text-gray-500'>" . htmlspecialchars($row['Service']) . "</td>";
                                echo "<td class='px-6 py-4 text-center whitespace-nowrap text-sm text-gray-500'>" . htmlspecialchars($row['Tujuan']) . "</td>";
                                echo "<td class='px-6 py-4 text-center whitespace-nowrap text-sm text-gray-500'>" . htmlspecialchars($row['Kode']) . "</td>";
                                echo "<td class='px-6 py-4 text-center whitespace-nowrap text-sm text-gray-500'>" . htmlspecialchars($row['kode_trans']) . "</td>";
                                echo "<td class='px-6 py-4 text-center whitespace-nowrap text-sm text-gray-500'>" . htmlspecialchars($row['Tanggal']) . "</td>";
                                echo "<td class='px-6 py-4 text-center whitespace-nowrap text-sm text-gray-500'>" . htmlspecialchars($row['Pengirim']) . "</td>";
                                echo "<td class='px-6 py-4 text-center whitespace-nowrap text-sm text-gray-500'>" . htmlspecialchars($row['Penerima']) . "</td>";
                                echo "<td class='px-6 py-4 text-center whitespace-nowrap text-sm text-gray-500'>" . htmlspecialchars($row['Kuantitas']) . "</td>";
                                echo "<td class='px-6 py-4 text-center whitespace-nowrap text-sm text-gray-500'>" . htmlspecialchars($row['Berat']) . "</td>";
                                echo "<td class='px-6 py-4 text-center whitespace-nowrap text-sm text-gray-500'>" . htmlspecialchars($row['Amount']) . "</td>";
                                echo "</tr>";
                            }
                        } else {
                            echo '<tr><td colspan="9" class="px-6 py-4 text-center text-sm text-gray-500">No results found.</td></tr>';
                        }
                        ?>
                    </tbody>
                </table>
            </div>

            <!-- Pagination Links -->
            <?php if (isset($number_of_pages) && $number_of_pages >= 1): ?>
            <div class="pagination mt-4">
                <?php for ($page = 1; $page <= $number_of_pages; $page++): ?>
                <a href="data_dco_ckr.php?page=<?php echo $page; ?>"
                    class="bg-white hover:opacity-75 px-4 py-2 border"><?php echo $page; ?></a>
                <?php endfor; ?>
            </div>
            <?php endif; ?>
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

            document.addEventListener('DOMContentLoaded', function () {
                flatpickr('#startDate', {
                    dateFormat: 'Y-m-d',
                    allowInput: true
                });
                flatpickr('#endDate', {
                    dateFormat: 'Y-m-d',
                    allowInput: true
                });
            });

            // Reset the form fields on page load
            window.onload = function () {
                var urlParams = new URLSearchParams(window.location.search);
                if (!urlParams.has('destination') && !urlParams.has('startDate') && !urlParams.has('endDate')) {
                    document.querySelector('form').reset();
                }
            };

            document.getElementById('showF').addEventListener('click', function () {
                var card = document.getElementById('cardContainer');
                if (card.style.display === 'none' || card.style.display === '') {
                    card.style.display = 'block';
                } else {
                    card.style.display = 'none';
                }
            });
            document.getElementById('resetFilter').addEventListener('click', function () {
                // Clear query parameters from the URL
                const url = new URL(window.location.href);
                url.searchParams.delete('destination');
                url.searchParams.delete('startDate');
                url.searchParams.delete('endDate');

                // Reload the page with the reset URL
                window.location.href = url.toString();
            });

        </script>

</body>

</html>