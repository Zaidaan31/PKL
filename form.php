<?php include "koneksi.php";?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 flex items-center justify-center min-h-screen">
    <div class="w-full max-w-4xl bg-white rounded-lg shadow-md my-10 p-8">
        <h2 class="text-2xl font-semibold text-gray-700 mb-6">Pengiriman Barang</h2>
        <form action="act.php" method="post">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div>
                    <label class="block text-gray-700" for="nama_pengirim">Nama Pengirim</label>
                    <input type="text" name="nama_pengirim" required class="mt-1 block w-full px-3 py-2 bg-gray-100 border border-gray-300 rounded-md focus:outline-none focus:ring focus:ring-gray-200">
                </div>
                <div>
                    <label class="block text-gray-700" for="nama_penerima">Nama Penerima</label>
                    <input type="text" name="nama_penerima" required class="mt-1 block w-full px-3 py-2 bg-gray-100 border border-gray-300 rounded-md focus:outline-none focus:ring focus:ring-gray-200">
                </div>
                <div>
                    <label class="block text-gray-700" for="tlp_pengirim">Nomor Telp Pengirim</label>
                    <input type="text" name="tlp_pengirim" required class="mt-1 block w-full px-3 py-2 bg-gray-100 border border-gray-300 rounded-md focus:outline-none focus:ring focus:ring-gray-200">
                </div>
                <div>
                    <label class="block text-gray-700" for="tlp_penerima">Nomor Telp Penerima</label>
                    <input type="text" name="tlp_penerima" required class="mt-1 block w-full px-3 py-2 bg-gray-100 border border-gray-300 rounded-md focus:outline-none focus:ring focus:ring-gray-200">
                </div>
                <div>
                    <label class="block text-gray-700" for="alamat_pengirim">Alamat Pengirim</label>
                    <textarea name="alamat_pengirim" required rows="4" class="mt-1 block w-full px-3 py-2 bg-gray-100 border border-gray-300 rounded-md focus:outline-none focus:ring focus:ring-gray-200"></textarea>
                </div>
                <div>
                    <label class="block text-gray-700" for="alamat_penerima">Alamat Penerima</label>
                    <textarea name="alamat_penerima" required rows="4" class="mt-1 block w-full px-3 py-2 bg-gray-100 border border-gray-300 rounded-md focus:outline-none focus:ring focus:ring-gray-200"></textarea>
                </div>
                <div>
                    <label class="block text-gray-700" for="service">Service</label>
                    <select name="service" id="service" class="mt-1 block w-full px-3 py-2 bg-gray-100 border border-gray-300 rounded-md focus:outline-none focus:ring focus:ring-gray-200">
                        <option>---</option>
                        <?php
                            $query = mysqli_query($koneksi, "SELECT id, nama FROM service");
                            while($data = mysqli_fetch_array($query)){
                                echo "<option value=$data[id]> $data[nama] </option>";
                            }
                        ?>
                    </select>
                </div>
                <div>
                    <label class="block text-gray-700" for="type">Tipe Barang</label>
                    <input type="text" name="type" class="mt-1 block w-full px-3 py-2 bg-gray-100 border border-gray-300 rounded-md focus:outline-none focus:ring focus:ring-gray-200">
                </div>
                <div>
                    <label class="block text-gray-700" for="destination">Tujuan</label>
                    <select name="destination" id="destination" class="mt-1 block w-full px-3 py-2 bg-gray-100 border border-gray-300 rounded-md focus:outline-none focus:ring focus:ring-gray-200">
                        <option>---</option>
                        <option value="BEKASI">BEKASI</option>
                        <option value="JAKARTA">JAKARTA</option>
                        <option value="DEPOK">DEPOK</option>
                        <option value="BOGOR">BOGOR</option>
                        <option value="TANGGERANG">TANGGERANG</option>
                    </select>
                </div>
                <div>
                    <label class="block text-gray-700" for="qty">Kuantitas</label>
                    <input type="text" name="qty" class="mt-1 block w-full px-3 py-2 bg-gray-100 border border-gray-300 rounded-md focus:outline-none focus:ring focus:ring-gray-200">
                </div>
                <div>
                    <label class="block text-gray-700" for="weight">Berat</label>
                    <input type="text" name="weight" class="mt-1 block w-full px-3 py-2 bg-gray-100 border border-gray-300 rounded-md focus:outline-none focus:ring focus:ring-gray-200">
                </div>
            </div>
            <div class="flex items-center justify-start mt-10">
                <button type="submit" class="bg-gray-500 text-white py-2 px-4 rounded-xl mr-5 text-base md:text-lg font-bold shadow-md hover:bg-gray-600">Submit</button>
                <a href="dashboard.php" class="inline-flex items-center justify-center px-3 py-2 md:px-4 md:py-2 border border-transparent text-base md:text-lg font-bold rounded-xl text-gray-500 bg-gray-100 hover:bg-gray-200">Cancel</a>
            </div>
        </form>
    </div>
    <script>
        document.querySelector('form').addEventListener('submit', function() {
            this.querySelector('input[type="submit"]').disabled = true;
        });
    </script>
</body>
</html>
