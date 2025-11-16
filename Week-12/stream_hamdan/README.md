# Pemrograman Mobile – Week 12

**Nama:** Hamdan Azizul Hakim <br>
**NIM:** 2341720251 <br>
**Kelas:** TI-3G

---

## Praktikum 1 – Dart Streams

Pada Praktikum 1, kita mempelajari struktur dasar aplikasi Flutter, dimulai dari fungsi `void main()` yang menjalankan aplikasi melalui `runApp()` dan menampilkan widget utama `MyApp`. Widget `MyApp` sebagai StatelessWidget digunakan untuk mengonfigurasi aplikasi menggunakan `MaterialApp`, termasuk menentukan judul dan tema tampilan seperti `primarySwatch: Colors.deepPurple`. Selanjutnya, halaman awal aplikasi ditetapkan pada `StreamHomePage`, yang merupakan StatefulWidget sehingga mampu menyimpan dan mengubah state. Pengolahan state dilakukan di kelas `_StreamHomePageState`, yang nantinya akan kita kembangkan untuk membuat antarmuka aplikasi yang interaktif dan dinamis.

Keyword `yield*` pada kode tersebut berfungsi untuk meneruskan (delegate) seluruh data yang dihasilkan oleh sebuah stream lain ke dalam stream yang sedang dibuat, sehingga setiap nilai yang diproduksi oleh `Stream.periodic` langsung dialirkan ke stream utama tanpa perlu ditangani satu per satu. Pada kode tersebut, `Stream.periodic` menghasilkan nilai baru setiap satu detik, lalu fungsi `(int t)` digunakan untuk menentukan indeks warna dengan melakukan operasi `t % colors.length`, sehingga stream akan mengeluarkan warna secara berurutan dan berulang berdasarkan daftar `colors`.

Berikut ouput:

<img src="images/Soal4.gif" width="300">

Perbedaan penggunaan **`listen()`** dan **`await for`** pada langkah 9 terletak pada cara keduanya menangani aliran data dari sebuah stream. Ketika menggunakan **`listen()`**, kita mendaftarkan sebuah *callback* yang akan dipanggil setiap kali stream mengirimkan data baru; cara ini bersifat non-blocking, artinya fungsi `changeColor()` akan langsung selesai dieksekusi sementara listener tetap aktif menerima data secara asinkron di belakang layar. Sementara itu, penggunaan **`await for`** membuat fungsi tersebut “menunggu” setiap nilai yang keluar dari stream secara berurutan; fungsi tidak akan selesai sampai stream selesai menghasilkan data (blocking secara asinkron dalam konteks function). Dengan kata lain, **`listen()`** lebih fleksibel untuk penanganan event jangka panjang, sedangkan **`await for`** cocok ketika kita ingin memproses stream secara berurutan dan menunggu sampai seluruh data selesai diproses.
