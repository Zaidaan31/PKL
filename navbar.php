<?php
include 'koneksi.php'; // Sertakan koneksi database
session_start();

// Cek apakah pengguna sudah login
if (!isset($_SESSION['id'])) {
    header('Location: login.php');
    exit();
}

// Ambil ID pengguna dari sesi
$user_id = $_SESSION['id'];

// Query untuk mendapatkan nama pengguna
$query = "SELECT username FROM user WHERE id = ?";
$stmt = $koneksi->prepare($query);
$stmt->bind_param("i", $user_id);
$stmt->execute();
$stmt->bind_result($username);
$stmt->fetch();
$stmt->close();
?>

<nav id="nav" class="bg-gradient-to-r from-gray-600 to-gray-500 text-white px-4 py-3 shadow-md fixed top-0 right-0 w-full z-30">
    <div class="container mx-auto flex justify-between items-center">
        <div class="flex-grow flex items-center justify-end space-x-4 relative">
            <div class="flex items-center space-x-2">
                <!-- Profile Icon -->
                <svg class="w-8 h-8 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 14.5a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM12 16c-2.5 0-7 1.5-7 4.5v1h14v-1c0-3-4.5-4.5-7-4.5z" />
                </svg>
                <!-- Username -->
                <span class="text-sm md:text-lg font-semibold"><?php echo htmlspecialchars($username); ?></span>
            </div>

            <!-- Dropdown Trigger -->
            <div class="relative">
                <button class="focus:outline-none flex items-center space-x-2" id="dropdownButton">
                    <svg id="arrowIcon" class="w-6 h-6 text-white transform transition-transform duration-300" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
                    </svg>
                </button>

                <!-- Dropdown Menu -->
                <div id="dropdownMenu" class="absolute right-0 mt-4 w-48 bg-white rounded-lg shadow-lg py-2 hidden z-10">
                    <a href="logout.php" class="block px-4 py-2 text-gray-700 hover:bg-gray-100 transition duration-150 ease-in-out">
                        <div class="flex items-center space-x-3">
                            <svg class="w-5 h-5 text-red-600" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1m0-12V5m0 16v-2" />
                            </svg>
                            <span class="font-medium">Logout</span>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
</nav>

<script>
    // Toggle dropdown menu visibility and rotate the arrow icon
    document.getElementById('dropdownButton').addEventListener('click', function() {
        var dropdownMenu = document.getElementById('dropdownMenu');
        var arrowIcon = document.getElementById('arrowIcon');
        dropdownMenu.classList.toggle('hidden');
        arrowIcon.classList.toggle('rotate-180');
    });

    // Hide dropdown when clicking outside
    document.addEventListener('click', function(e) {
        var dropdownMenu = document.getElementById('dropdownMenu');
        var dropdownButton = document.getElementById('dropdownButton');
        if (!dropdownButton.contains(e.target) && !dropdownMenu.contains(e.target)) {
            dropdownMenu.classList.add('hidden');
            arrowIcon.classList.remove('rotate-180');
        }
    });
</script>
