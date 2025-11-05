# Pemrograman Mobile – Week 11

**Nama:** Hamdan Azizul Hakim <br>
**NIM:** 2341720251 <br>
**Kelas:** TI-3G

---

## Praktikum 1 – Mengunduh Data dari Web Service (API)

Pada Praktikum ini pertama kita membuat project flutter baru dengan nama books, setelah itu kita tambahkan dependensi baru yaitu http yang berfungsi untuk menghubungkan flutter ke jaringan HTTP.

Setelah itu kita lakukan perubahan pada kode main dan juga menambahkan nama kita pada title. Selanjutnya kita cari buku favorit di Google Books, kemudian kita salin ID buku tersebut ke path yang ada di kode main.

Kemudian kita coba akses URL dengan ID baru yang telah kita tambahkan. Maka akan tampil data JSON seperti dibawah:

<img src="images/W11_Soal2.png" width="300">

Langkah selanjutnya kita tambahkan kode untuk menampilkan data JSON diatas ke dalam aplikasi books kita, pada kode tambahan terdapat method **substring** yang berfungsi untuk membatasi panjang data yang ditampilkan di UI aplikasi books dan juga method **catchError** yang berfungsi untuk mengambil pesan error jika terdapat error.

Berikut hasil output aplikasi books pada praktikum 1:

<img src="images/W11_Soal3.gif" width="300">

---

## Praktikum 2 – Menggunakan await/async untuk menghindari callbacks

Pada Praktikum 2, langkah 1 kita tambahkan tiga method di dalam class `_FuturePageState`. Kode di atas berisi tiga fungsi asinkron di Dart `returnOneAsync()`, `returnTwoAsync()`, dan `returnThreeAsync()` yang masing-masing menunggu selama **3 detik** menggunakan `Future.delayed()` sebelum mengembalikan nilai **1**, **2**, dan **3**. Karena menggunakan kata kunci `async` dan `await`, eksekusi setiap fungsi tidak langsung menghasilkan nilai, melainkan **mengembalikan objek `Future<int>`** yang akan berisi hasilnya setelah penundaan selesai. Dengan kata lain, fungsi-fungsi ini mensimulasikan proses yang memerlukan waktu (seperti mengambil data dari internet) tanpa menghentikan eksekusi program utama.

Pada langkah 2, kita membuat method `count()` yang bersifat **asinkron** untuk menjalankan tiga fungsi sebelumnya (`returnOneAsync()`, `returnTwoAsync()`, dan `returnThreeAsync()`) secara **berurutan**. Fungsi ini menggunakan `await` agar setiap pemanggilan menunggu hasil dari fungsi sebelumnya sebelum melanjutkan ke berikutnya, sehingga prosesnya berjalan berantai, total waktu tunda menjadi sekitar 9 detik (3 detik tiap fungsi). Nilai yang dikembalikan dari ketiga fungsi tersebut dijumlahkan dan disimpan ke variabel `total`. Setelah perhitungan selesai, `setState()` dipanggil untuk memperbarui nilai variabel `result` di UI, sehingga tampilan aplikasi ikut berubah sesuai hasil total yang baru.

Berikut hasil output pada praktikum 2:

<img src="images/W11_Soal4.gif" width="300">

---

## Praktikum 3 – Menggunakan Completer di Future

Pada Praktikum 3 kita tambahkan kode yang menggunakan konsep **`Completer`** di Dart untuk membuat **Future yang dapat dikontrol secara manual**. Pertama, variabel `completer` dideklarasikan sebagai `late Completer`, artinya akan diinisialisasi sebelum dipakai. Method `getNumber()` membuat instance `Completer<int>()` baru, memanggil fungsi `calculate()`, dan mengembalikan `completer.future` — sebuah `Future<int>` yang akan selesai di kemudian hari. Fungsi `calculate()` menunggu **5 detik** menggunakan `Future.delayed()`, lalu memanggil `completer.complete(42)` untuk **menyelesaikan Future** dan mengembalikan nilai 42. Dengan cara ini, `Completer` memungkinkan kamu memisahkan logika perhitungan atau penentuan nilai dari proses Future itu sendiri, sehingga kamu bisa menyelesaikan Future kapan pun kamu mau.

Berikut hasil output dari praktikum diatas:

<img src="images/W11_Soal5.gif" width="300">

Langkah selanjutnya kita tambahkan kode yang berisi fungsi `calculate2()`dan juga mengubah kode pada fungsi onPressed().

Perbedaan antara kode sebelumnya dengan kode terbaru terletak pada **penanganan error dan cara mendapatkan hasil Future**. Pada kode sebelumnya, fungsi `calculate()` hanya menunggu 5 detik menggunakan `Future.delayed()` lalu menyelesaikan `Future` dengan nilai 42, tanpa ada mekanisme untuk menangani kemungkinan error. Sedangkan pada kode terbaru, fungsi `calculate()` dibungkus dengan **try-catch**, sehingga jika terjadi kesalahan selama eksekusi, `Future` akan diselesaikan dengan error menggunakan `completer.completeError({})`. Selain itu, pemanggilan `getNumber()` menggunakan **`.then()`** untuk menangani hasil normal dan memperbarui UI melalui `setState()`, serta **`.catchError()`** untuk menangani error dan menampilkan pesan yang sesuai. Dengan demikian, kode terbaru lebih aman dan robust karena siap menghadapi exception tanpa membuat aplikasi crash, sementara kode sebelumnya hanya cocok untuk kasus sederhana tanpa kemungkinan error.

Berikut hasil output dari praktikum diatas:

<img src="images/W11_Soal6.gif" width="300">

---

## Praktikum 4 – Memanggil Future secara paralel

Pada Praktikum 4, kita memperkenalkan penggunaan **`FutureGroup`** untuk menjalankan beberapa `Future` secara **bersamaan (concurrent)** dan menunggu semua selesai sebelum melanjutkan. Konsepnya adalah menambahkan beberapa `Future` ke dalam sebuah `FutureGroup`, lalu menutup grup tersebut agar menandai tidak ada `Future` tambahan. Setelah semua `Future` selesai, hasilnya dikumpulkan menjadi sebuah list, kemudian dijumlahkan dan disimpan ke variabel `result` melalui `setState()` agar UI diperbarui. Dengan pendekatan ini, semua `Future` dijalankan **bersamaan**, sehingga total waktu eksekusi lebih efisien dibanding menjalankan setiap `Future` secara berurutan.

Berikut output pada praktikum diatas:

<img src="images/W11_Soal7.gif" width="300">