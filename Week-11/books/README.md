# Pemrograman Mobile – Week 11

**Nama:** Hamdan Azizul Hakim <br>
**NIM:** 2341720251 <br>
**Kelas:** TI-3G

---

## Praktikum 1 – Mengunduh Data dari Web Service (API)

Pada Praktikum ini pertama kita membuat project flutter baru dengan nama books, setelah itu kita tambahkan dependensi baru yaitu http yang berfungsi untuk menghubungkan flutter ke jaringan HTTP.

Setelah itu kita lakukan perubahan pada kode main dan juga menambahkan nama kita pada title. Selanjutnya kita cari buku favorit di Google Books, kemudian kita salin ID buku tersebut ke path yang ada di kode main.

Kemudian kita coba akses URL dengan ID baru yang telah kita tambahkan. Maka akan tampil data JSON seperti dibawah:

![](images/W11_Soal2.png)

Langkah selanjutnya kita tambahkan kode untuk menampilkan data JSON diatas ke dalam aplikasi books kita, pada kode tambahan terdapat method **substring** yang berfungsi untuk membatasi panjang data yang ditampilkan di UI aplikasi books dan juga method **catchError** yang berfungsi untuk mengambil pesan error jika terdapat error.

Berikut hasil output aplikasi books pada praktikum 1:

![](images/W11_Soal3.gif)

## Praktikum 2 – Menggunakan await/async untuk menghindari callbacks

Pada Praktikum 2, langkah 1 kita tambahkan tiga method di dalam class `_FuturePageState`. Kode di atas berisi tiga fungsi asinkron di Dart `returnOneAsync()`, `returnTwoAsync()`, dan `returnThreeAsync()` yang masing-masing menunggu selama **3 detik** menggunakan `Future.delayed()` sebelum mengembalikan nilai **1**, **2**, dan **3**. Karena menggunakan kata kunci `async` dan `await`, eksekusi setiap fungsi tidak langsung menghasilkan nilai, melainkan **mengembalikan objek `Future<int>`** yang akan berisi hasilnya setelah penundaan selesai. Dengan kata lain, fungsi-fungsi ini mensimulasikan proses yang memerlukan waktu (seperti mengambil data dari internet) tanpa menghentikan eksekusi program utama.

Pada langkah 2, kita membuat method `count()` yang bersifat **asinkron** untuk menjalankan tiga fungsi sebelumnya (`returnOneAsync()`, `returnTwoAsync()`, dan `returnThreeAsync()`) secara **berurutan**. Fungsi ini menggunakan `await` agar setiap pemanggilan menunggu hasil dari fungsi sebelumnya sebelum melanjutkan ke berikutnya, sehingga prosesnya berjalan berantai, total waktu tunda menjadi sekitar 9 detik (3 detik tiap fungsi). Nilai yang dikembalikan dari ketiga fungsi tersebut dijumlahkan dan disimpan ke variabel `total`. Setelah perhitungan selesai, `setState()` dipanggil untuk memperbarui nilai variabel `result` di UI, sehingga tampilan aplikasi ikut berubah sesuai hasil total yang baru.

Berikut hasil output pada praktikum 2:

![](images/W11_Soal4.gif)