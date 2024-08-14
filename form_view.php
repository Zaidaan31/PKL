<?php
include 'koneksi.php';
$id = $_GET['id'];
$query = "SELECT * FROM dco WHERE '$id' = id";
$result = mysqli_query($koneksi, $query);

if (mysqli_num_rows($result) == 1) {
    $data = mysqli_fetch_assoc($result);
    ?>

    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
        <style>
        /* Custom scrollbar styles */
        .scrollbar-custom::-webkit-scrollbar {
            width: 12px;
        }

        .scrollbar-custom::-webkit-scrollbar-track {
            background: #f3f4f6;
            /* Light gray color */
        }

        .scrollbar-custom::-webkit-scrollbar-thumb {
            background: #6b7280;
            /* gray color */
            border-radius: 8px;
        }

        .scrollbar-custom::-webkit-scrollbar-thumb:hover {
            background: #374151;
            /* Darker gray color on hover */
        }
    </style>
        <title>View Form</title>
    </head>

    <body class="bg-gray-100 flex items-center justify-center min-h-screen scrollbar-custom">
        <div class="bg-white shadow-md rounded-3xl p-6 md:p-10 my-6 mx-7 md:my-10 w-full max-w-4xl">
            <h1 class="text-xl md:text-2xl font-bold mb-4 text-center">VIEW FORM</h1>
            <div class="flex justify-center mb-6 md:mb-10">
                <hr class="border-t-4 rounded-lg border-black w-16 md:w-24">
            </div>
            <form action="edit_act.php" method="post" enctype="multipart/form-data">
                <input type="hidden" name="id" value="<?php echo $data['id']; ?>">

                <div class="grid grid-cols-1 md:grid-cols-2 gap-4 md:gap-6 mb-4 md:mb-6">
                    <div>
                        <label for="service" class="block text-gray-700 font-medium mb-2">Service</label>
                        <input type="text" id="service" name="service" readonly disabled class="form-input w-full px-3 py-2 border border-gray-300 rounded-3xl shadow-sm" value="<?php echo $data['service']; ?>" placeholder="">
                    </div>
                    <div>
                        <label for="delivery" class="block text-gray-700 font-medium mb-2">Delivery</label>
                        <input type="text" id="delivery" name="delivery" readonly disabled class="form-input w-full px-3 py-2 border border-gray-300 rounded-3xl shadow-sm" value="<?php echo $data['delivery']; ?>" placeholder="">
                    </div>
                </div>

                <div class="grid grid-cols-1 md:grid-cols-2 gap-4 md:gap-6 mb-4 md:mb-6">
                    <div>
                        <label for="manifest" class="block text-gray-700 font-medium mb-2">Manifest</label>
                        <input type="text" id="manifest" name="manifest" readonly disabled class="form-input w-full px-3 py-2 border border-gray-300 rounded-3xl shadow-sm" value="<?php echo $data['manifest']; ?>" placeholder="">
                    </div>
                    <div>
                        <label for="delivery_sps" class="block text-gray-700 font-medium mb-2">Delivery SPS</label>
                        <input type="text" id="delivery_sps" name="delivery_sps" readonly disabled class="form-input w-full px-3 py-2 border border-gray-300 rounded-3xl shadow-sm" value="<?php echo $data['delivery_sps']; ?>" placeholder="">
                    </div>
                </div>

                <div class="grid grid-cols-1 md:grid-cols-2 gap-4 md:gap-6 mb-4 md:mb-6">
                    <div>
                        <label for="manifest_date" class="block text-gray-700 font-medium mb-2">Manifest Date</label>
                        <input type="text" id="manifest_date" name="manifest_date" readonly disabled class="form-input w-full px-3 py-2 border border-gray-300 rounded-3xl shadow-sm" value="<?php echo $data['manifest_date']; ?>" placeholder="yyyy-mm-dd">
                    </div>
                    <div>
                        <label for="linehaul" class="block text-gray-700 font-medium mb-2">Linehaul</label>
                        <input type="text" id="linehaul" name="linehaul" readonly disabled class="form-input w-full px-3 py-2 border border-gray-300 rounded-3xl shadow-sm" value="<?php echo $data['linehaul']; ?>" placeholder="">
                    </div>
                </div>

                <div class="grid grid-cols-1 md:grid-cols-2 gap-4 md:gap-6 mb-4 md:mb-6">
                    <div>
                        <label for="destination" class="block text-gray-700 font-medium mb-2">Destination</label>
                        <input type="text" id="destination" name="destination" readonly disabled class="form-input w-full px-3 py-2 border border-gray-300 rounded-3xl shadow-sm" value="<?php echo $data['destination']; ?>" placeholder="">
                    </div>
                    <div>
                        <label for="linehaul_next" class="block text-gray-700 font-medium mb-2">Linehaul Next</label>
                        <input type="text" id="linehaul_next" name="linehaul_next" readonly disabled class="form-input w-full px-3 py-2 border border-gray-300 rounded-3xl shadow-sm" value="<?php echo $data['linehaul_next']; ?>" placeholder="">
                    </div>
                </div>

                <div class="grid grid-cols-1 md:grid-cols-2 gap-4 md:gap-6 mb-4 md:mb-6">
                    <div>
                        <label for="cnote" class="block text-gray-700 font-medium mb-2">Cnote</label>
                        <input type="text" id="cnote" name="cnote" readonly disabled class="form-input w-full px-3 py-2 border border-gray-300 rounded-3xl shadow-sm" value="<?php echo $data['cnote']; ?>" placeholder="">
                    </div>
                    <div>
                        <label for="amount" class="block text-gray-700 font-medium mb-2">Amount</label>
                        <input type="text" id="amount" name="amount" readonly disabled class="form-input w-full px-3 py-2 border border-gray-300 rounded-3xl shadow-sm" value="<?php echo $data['amount']; ?>" placeholder="">
                    </div>
                </div>

                <div class="grid grid-cols-1 md:grid-cols-2 gap-4 md:gap-6 mb-4 md:mb-6">
                    <div>
                        <label for="colly" class="block text-gray-700 font-medium mb-2">Colly</label>
                        <input type="text" id="colly" name="colly" readonly disabled class="form-input w-full px-3 py-2 border border-gray-300 rounded-3xl shadow-sm" value="<?php echo $data['colly']; ?>" placeholder="">
                    </div>
                    <div>
                        <label for="operational_cost" class="block text-gray-700 font-medium mb-2">Operational Cost</label>
                        <input type="text" id="operational_cost" name="operational_cost" readonly disabled class="form-input w-full px-3 py-2 border border-gray-300 rounded-3xl shadow-sm" value="<?php echo $data['operational_cost']; ?>" placeholder="">
                    </div>
                </div>

                <div class="grid grid-cols-1 md:grid-cols-2 gap-4 md:gap-6 mb-4 md:mb-6">
                    <div>
                        <label for="weight" class="block text-gray-700 font-medium mb-2">Weight</label>
                        <input type="text" id="weight" name="weight" readonly disabled class="form-input w-full px-3 py-2 border border-gray-300 rounded-3xl shadow-sm" value="<?php echo $data['weight']; ?>" placeholder="">
                    </div>
                    <div class="flex items-center justify-end mt-4 md:mt-0 space-x-2">
                        <a href="index.php" class="inline-flex items-center justify-center px-3 py-2 md:px-4 md:py-2 border border-transparent text-base md:text-lg font-bold rounded-xl text-gray-500 bg-gray-100 hover:bg-gray-200">Cancel</a>
                    </div>
                </div>
            </form>
        </div>
    </body>

    </html>
    <?php
}
?>
