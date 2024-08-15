<!-- Sidebar -->
<?php include 'sidebar.php'; ?>

<!-- Navbar -->
<?php include 'navbar.php'; ?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.12.4/dist/sweetalert2.min.css" rel="stylesheet">
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

        .table-container::-webkit-scrollbar {
            width: 12px;
        }

        .table-container::-webkit-scrollbar-track {
            background: #f3f4f6;
        }

        .table-container::-webkit-scrollbar-thumb {
            background: #6b7280;
            border-radius: 8px;
        }

        .table-container::-webkit-scrollbar-thumb:hover {
            background: #374151;
        }

        .main-content {
            margin-top: 3rem;
            /* Ruang untuk navbar */
            margin-left: 16rem;
            /* Ruang untuk sidebar */
            transition: margin-left 0.3s ease;
            /* Transisi untuk pergeseran */
            padding: 1rem;
            /* Padding untuk konten */
            flex-grow: 1;
            /* Mengisi sisa ruang yang tersedia */
        }

        @media (max-width: 768px) {
            .main-content {
                margin-left: 0;
                /* Tanpa sidebar untuk layar kecil */
            }
        }

        .main-content-shift {
            margin-left: 10rem;
            /* Menggeser mengikuti sidebar */
        }

        #menu-button {
            transition: transform 0.3s ease;
        }

        .menu-button-shift {
            transform: translateX(8rem);
            /* Bergeser mengikuti sidebar */
        }
    </style>
    <title>Data</title>
</head>

<body class="bg-gray-100 flex min-h-screen scrollbar-custom">

    <!-- Modal -->
    <div id="confirmation-modal"
        class="fixed inset-0 bg-gray-500 bg-opacity-50 flex items-center justify-center hidden z-40">
        <div class="bg-white rounded-lg shadow-lg p-6 max-w-sm w-full">
            <h2 class="text-lg font-bold text-gray-900">Are you sure?</h2>
            <p class="mt-2 text-gray-600">Do you really want to delete this data? This action cannot be undone.</p>
            <div class="flex justify-end mt-4">
                <button id="cancel-button"
                    class="bg-gray-500 text-white py-2 px-4 rounded-lg hover:bg-gray-600 mr-2">Cancel</button>
                <button id="confirm-button"
                    class="bg-red-500 text-white py-2 px-4 rounded-lg hover:bg-red-600">Delete</button>
            </div>
        </div>
    </div>

    <!-- Main content -->
    <div id="main-content"
        class="flex-grow flex flex-col items-center p-4 ml-0 md:ml-64 transition-all duration-300 mt-16">
        <!-- Hamburger Button -->
        <button id="menu-button" class="text-white md:hidden absolute top-3 left-3 z-50">
            <i id="icon-hamburger" class="fas fa-bars fa-2x"></i>
            <i id="icon-close" class="fas fa-times fa-2x opacity-0"></i>
        </button>

        <div class="self-start ml-8 mb-4">
            <!-- Action Button Row -->
            <a href="input_form.php">
                <button
                    class="bg-gray-500 text-white py-3 px-8 rounded-lg hover:shadow-2xl hover:bg-opacity-75 font-bold transition duration-300">
                    Create
                </button>
            </a>
        </div>

        <!-- Table Container -->
        <div class="table-container overflow-x-auto scrollbar-custom max-w-[78vw] shadow-2xl rounded-lg border border-gray-200">
            <table class=" bg-white rounded-lg">
                <thead class="bg-gray-700 text-white">
                    <tr>
                        <th class="py-4 px-2 sm:px-4">Service</th>
                        <th class="py-4 px-2 sm:px-4">Manifest</th>
                        <th class="py-4 px-2 sm:px-4">Manifest Date</th>
                        <th class="py-4 px-2 sm:px-4">Destination</th>
                        <th class="py-4 px-2 sm:px-4">Cnote</th>
                        <th class="py-4 px-2 sm:px-4">Colly</th>
                        <th class="py-4 px-2 sm:px-4">Weight</th>
                        <th class="py-4 px-2 sm:px-4">Delivery</th>
                        <th class="py-4 px-2 sm:px-4">Delivery SPS</th>
                        <th class="py-4 px-2 sm:px-4">Linehaul</th>
                        <th class="py-4 px-2 sm:px-4">Linehaul Next</th>
                        <th class="py-4 px-2 sm:px-4">Amount</th>
                        <th class="py-4 px-2 sm:px-4">Operational Cost</th>
                        <th class="py-4 px-2 sm:px-4">Actions</th>
                    </tr>
                </thead>
                <tbody class="text-gray-900 text-center">
                    <?php
                    // Pagination logic
                    $limit = 5; // Number of rows per page
                    $page = isset($_GET['page']) ? (int) $_GET['page'] : 1;
                    $offset = ($page - 1) * $limit;

                    $data = mysqli_query($koneksi, "SELECT * FROM dco LIMIT $limit OFFSET $offset");
                    while ($d = mysqli_fetch_array($data)) {
                        ?>
                        <tr
                            class="odd:bg-gray-100 even:bg-gray-200 hover:bg-gray-300 cursor-pointer transition duration-300">
                            <td class="py-2 px-2 sm:px-3 whitespace-nowrap"><?php echo $d['service']; ?></td>
                            <td class="py-2 px-2 sm:px-3 whitespace-nowrap"><?php echo $d['manifest']; ?></td>
                            <td class="py-2 px-2 sm:px-3 whitespace-nowrap"><?php echo $d['manifest_date']; ?></td>
                            <td class="py-2 px-2 sm:px-3 whitespace-nowrap"><?php echo $d['destination']; ?></td>
                            <td class="py-2 px-2 sm:px-3 whitespace-nowrap"><?php echo $d['cnote']; ?></td>
                            <td class="py-2 px-2 sm:px-3 whitespace-nowrap"><?php echo $d['colly']; ?></td>
                            <td class="py-2 px-2 sm:px-3 whitespace-nowrap"><?php echo $d['weight']; ?></td>
                            <td class="py-2 px-2 sm:px-3 whitespace-nowrap"><?php echo $d['delivery']; ?></td>
                            <td class="py-2 px-2 sm:px-3 whitespace-nowrap"><?php echo $d['delivery_sps']; ?></td>
                            <td class="py-2 px-2 sm:px-3 whitespace-nowrap"><?php echo $d['linehaul']; ?></td>
                            <td class="py-2 px-2 sm:px-3 whitespace-nowrap"><?php echo $d['linehaul_next']; ?></td>
                            <td class="py-2 px-2 sm:px-3 whitespace-nowrap"><?php echo $d['amount']; ?></td>
                            <td class="py-2 px-2 sm:px-3 whitespace-nowrap"><?php echo $d['operational_cost']; ?></td>
                            <td class="py-2 px-2 sm:px-3 flex justify-center space-x-2">
                                <a href="form_edit.php?id=<?php echo $d['id']; ?>"
                                    class="text-gray-700 hover:text-gray-900 transition duration-300"><i
                                        class="fas fa-edit"></i></a>
                                <a href="form_view.php?id=<?php echo $d['id']; ?>"
                                    class="text-gray-700 hover:text-gray-900 transition duration-300"><i
                                        class="fas fa-eye"></i></a>
                                <a href="delete.php?id=<?php echo $d['id']; ?>" data-confirm
                                    class="text-red-700 hover:text-red-900 transition duration-300"><i
                                        class="fas fa-trash-alt"></i></a>
                            </td>
                        </tr>
                        <?php
                    }
                    ?>
                </tbody>
            </table>
        </div>

        <!-- Pagination controls -->
        <div class="flex justify-center mt-4">
            <?php
            // Get total number of rows
            $result = mysqli_query($koneksi, "SELECT COUNT(*) AS total FROM dco");
            $row = mysqli_fetch_assoc($result);
            $total_rows = $row['total'];
            $total_pages = ceil($total_rows / $limit);

            // Pagination links
            if ($total_pages > 1) {
                for ($i = 1; $i <= $total_pages; $i++) {
                    echo '<a href="?page=' . $i . '" class="mx-2 py-2 px-4 bg-gray-500 text-white rounded-full hover:bg-gray-700 transition duration-300">' . $i . '</a>';
                }
            }
            ?>
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

    <script>
        const modal = document.getElementById('confirmation-modal');
        const cancelButton = document.getElementById('cancel-button');
        const confirmButton = document.getElementById('confirm-button');
        // Swal.fire({
        //     title: "Are you sure?",
        //     text: "You won't be able to revert this!",
        //     icon: "warning",
        //     showCancelButton: true,
        //     confirmButtonColor: "#3085d6",
        //     cancelButtonColor: "#d33",
        //     confirmButtonText: "Yes, delete it!"
        // }).then((result) => {
        //     if (result.isConfirmed) {
        //         Swal.fire({
        //             title: "Deleted!",
        //             text: "Your file has been deleted.",
        //             icon: "success"
        //         });
        //     }
        // });
        let deleteUrl = '';

        function showModal(url) {
            modal.classList.remove('hidden');
            deleteUrl = url;
        }

        function hideModal() {
            modal.classList.add('hidden');
            deleteUrl = '';
        }

        cancelButton.addEventListener('click', hideModal);

        confirmButton.addEventListener('click', () => {
            if (deleteUrl) {
                window.location.href = deleteUrl;
            }
            hideModal();
        });

        // Attach click event to delete links
        document.querySelectorAll('[data-confirm]').forEach(link => {
            link.addEventListener('click', (event) => {
                event.preventDefault();
                showModal(link.href);
            });
        });
    </script>
</body>

</html>