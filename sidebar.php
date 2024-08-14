<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>

<body>
<div id="sidebar" class="fixed inset-y-0 left-0 z-30 w-40 md:w-64 bg-gray-800 text-white transform -translate-x-full transition-transform duration-300 md:translate-x-0">
    <div class="flex flex-col items-center py-7 px-2">
        <h1 class="text-3xl font-bold">My App</h1>
        <nav class="flex flex-col w-full items-center justify-center space-y-2 mt-4">
            <a href="dashboard.php" class="flex items-center py-2 px-4 w-full text-white hover:bg-gray-500 transition duration-300">
                <i class="fas fa-home text-lg"></i>
                <span class="ml-3 justify-center font-bold text-base">Home</span>
            </a>
            <a href="index.php" class="flex items-center py-2 px-4 w-full text-white hover:bg-gray-500 transition duration-300">
                <i class="fas fa-database text-lg"></i>
                <span class="ml-3 justify-center font-bold text-base">Data</span>
            </a>
            <a href="feedback_user.php" class="flex items-center py-2 px-4 w-full text-white hover:bg-gray-500 transition duration-300">
                <i class="fas fa-comments text-lg"></i>
                <span class="ml-3 justify-center font-bold text-base">User Feedback</span>
            </a>
            <a href="feedback.php" class="flex items-center py-2 px-4 w-full text-white hover:bg-gray-500 transition duration-300">
                <i class="fas fa-commenting text-lg"></i>
                <span class="ml-3 justify-center font-bold text-base">Feedback</span>
            </a>
        </nav>
    </div>
</div>
</body>

</html>
