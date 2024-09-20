<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        .custom-background{
            background-image: linear-gradient(45deg, rgba(187, 187, 187,0.04) 0%, rgba(187, 187, 187,0.04) 50%,rgba(86, 86, 86,0.04) 50%, rgba(86, 86, 86,0.04) 100%),linear-gradient(135deg, rgba(166, 166, 166,0.04) 0%, rgba(166, 166, 166,0.04) 50%,rgba(92, 92, 92,0.04) 50%, rgba(92, 92, 92,0.04) 100%),linear-gradient(90deg, rgb(20,20,20),rgb(20,20,20)); background-size: 142px 142px;
        }
        .custom-bg-form{
            background-image: linear-gradient(112.5deg, rgb(214, 214, 214) 0%, rgb(214, 214, 214) 10%,rgb(195, 195, 195) 10%, rgb(195, 195, 195) 53%,rgb(176, 176, 176) 53%, rgb(176, 176, 176) 55%,rgb(157, 157, 157) 55%, rgb(157, 157, 157) 60%,rgb(137, 137, 137) 60%, rgb(137, 137, 137) 88%,rgb(118, 118, 118) 88%, rgb(118, 118, 118) 91%,rgb(99, 99, 99) 91%, rgb(99, 99, 99) 100%),linear-gradient(157.5deg, rgb(214, 214, 214) 0%, rgb(214, 214, 214) 10%,rgb(195, 195, 195) 10%, rgb(195, 195, 195) 53%,rgb(176, 176, 176) 53%, rgb(176, 176, 176) 55%,rgb(157, 157, 157) 55%, rgb(157, 157, 157) 60%,rgb(137, 137, 137) 60%, rgb(137, 137, 137) 88%,rgb(118, 118, 118) 88%, rgb(118, 118, 118) 91%,rgb(99, 99, 99) 91%, rgb(99, 99, 99) 100%),linear-gradient(135deg, rgb(214, 214, 214) 0%, rgb(214, 214, 214) 10%,rgb(195, 195, 195) 10%, rgb(195, 195, 195) 53%,rgb(176, 176, 176) 53%, rgb(176, 176, 176) 55%,rgb(157, 157, 157) 55%, rgb(157, 157, 157) 60%,rgb(137, 137, 137) 60%, rgb(137, 137, 137) 88%,rgb(118, 118, 118) 88%, rgb(118, 118, 118) 91%,rgb(99, 99, 99) 91%, rgb(99, 99, 99) 100%),linear-gradient(90deg, rgb(195, 195, 195),rgb(228, 228, 228)); background-blend-mode:overlay,overlay,overlay,normal;
        }
    </style>
</head>
<body class="custom-background flex items-center justify-center min-h-screen">
    <div class="custom-bg-form p-6 rounded-lg shadow-lg w-full max-w-md">
        <h2 class="text-2xl font-bold mb-4 text-gray-700">Login</h2>

        <form action="act_login.php" method="POST">
            <label class="block mb-2 text-sm font-medium text-gray-600" for="username">Username</label>
            <input type="text" id="username" name="username" class="block w-full p-2 border border-gray-300 rounded mb-4" autofocus required>
            
            <label class="block mb-2 text-sm font-medium text-gray-600" for="password">Password</label>
            <input type="password" id="password" name="password" class="block w-full p-2 border border-gray-300 rounded mb-4" required>
            
            <button type="submit" class="w-full bg-gray-600 text-white p-2 rounded">Login</button>
        </form>
    </div>

    <!-- Script untuk menampilkan SweetAlert jika ada kesalahan login -->
    <?php if (isset($_GET['error'])): ?>
    <script>
        Swal.fire({
            icon: "error",
            title: "Oops...",
            text: "<?php echo htmlspecialchars($_GET['error']); ?>",
        });
    </script>
    <?php endif; ?>
</body>
</html>
