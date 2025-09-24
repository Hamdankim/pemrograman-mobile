# Pemrograman Mobile - Week 5

**NIM:** 2341720251  
**Nama:** Hamdan Azizul Hakim  

---

## Praktikum 1

<img src="images/p1.png" width="500"> 

Pada praktikum ini kita memulai dengan membuat project flutter baru dengan nama hello_world, flutter akan otomatis setup seluruh package yang dibutuhkan.

---

## Praktikum 2

<img src="images/p2_1.jpg " width="300" height="600">

<img src="images/p2_2.png " width="500">

Pada praktikum 2 kita menghubungkan perangkat android kita untuk menjalankan aplikasi atau untuk debugging saat ini. Langkah pertama kita aktifkan developer mode, kemudian kita aktifkan debugging USB dan juga kita aktifkan debug wireless, setelah itu kita hubungkan perangkat kita menggunakan alamat ip dan port wifi. Jika berhasil maka perangkat kita bisa digunakan untuk prosess debugging.

---

## Praktikum 3

<img src="images/p3_1.png " width="500">

<img src="images/p3_2.png " width="500">

Selanjutnya pada praktikum ini kita coba langsung run project flutter dengan output device chrome. Gambar diatas merupakan tampilan awal project hello_world kita.

---

## Praktikum 4

  <img src="images/p4_1.png" width="500">

  Percobaan diatas merupakan text widget yang hanya menampilkan text pada aplikasi.

  <img src="images/p4_2.png" width="500">


  <img src="images/p4_3.png" width="500">

  <img src="images/p4_4.png" width="500">

  <img src="images/p4_5.png" width="500">

  <img src="images/p4_6.png" width="500">

  <img src="images/p4_7.png" width="500">

  Percobaan selanjutnya kita menampilkan logo POLINEMA pada aplikasi, pertama kita membuat file image_widget dari turunan StatelessWidget kemudian kita override widget dengan mereturn gambar yang diambil dari folder assets, selanjutnya kita juga lakukan penyesuaian asset pada file pubspec.yaml dan juga menambahkan file logo POLINEMA pada folder assets. Setelah itu, pada main kita ubah const menjadi MyImageWidget sesuai dengan class yang ada di file image_widget. Terakhir kita lakukan debugging sehingga logo POLINEMA muncul pada aplikasi kita.

---

## Praktikum 5

<img src="images/p5_1.png" width="500">

Pada bagian ini diperkenalkan widget dari iOS yaitu CupertinoButton dan CupertinoActivityIndicator. Tujuannya adalah menunjukkan bahwa Flutter tidak hanya mendukung gaya desain Material milik Android, tetapi juga dapat menampilkan komponen bergaya iOS secara native. Dengan begitu, aplikasi bisa dibuat lebih fleksibel dan sesuai kebutuhan platform.

<img src="images/p5_2.png" width="500">

Floating Action Button adalah salah satu button khas Material Design yang biasanya digunakan untuk aksi utama dalam sebuah halaman. Praktikum ini menekankan penggunaan FAB dengan ikon tertentu dan warna khusus, sehingga mahasiswa memahami cara menambahkan interaksi yang menonjol pada antarmuka aplikasi.

<img src="images/p5_3.png" width="500">

<img src="images/p5_3a.png" width="300" height="500">

<img src="images/p5_3b.png" width="300" height="500">

<img src="images/p5_3c.jpg" width="300" height="500">

<img src="images/p5_3d.jpg" width="300" height="500">

Scaffold berfungsi sebagai kerangka utama dalam membangun antarmuka berbasis Material Design. Komponen ini mempermudah penataan elemen seperti AppBar, body, BottomAppBar, dan FloatingActionButton. Dengan Scaffold, struktur aplikasi menjadi lebih konsisten dan mengikuti standar desain modern.

<img src="images/p5_4.png" width="300" height="500">

<img src="images/p5_4a.jpg" width="300" height="500">

Dialog digunakan untuk memberikan pesan interaktif kepada pengguna, baik berupa informasi maupun konfirmasi. Flutter menyediakan AlertDialog dan SimpleDialog untuk kebutuhan tersebut. Dalam praktikum ini, mahasiswa belajar menampilkan AlertDialog sederhana dengan tombol aksi yang bisa menutup dialog.

<img src="images/p5_5.jpg" width="300" height="500">

Flutter mendukung berbagai widget input agar pengguna dapat memberikan data atau memilih opsi tertentu. Contohnya TextField untuk memasukkan teks, Checkbox dan RadioButton untuk pilihan, serta Slider dan Switch untuk pengaturan nilai. Dengan memahami widget ini, aplikasi dapat lebih interaktif dan fungsional.

<img src="images/p5_6.png" width="300" height="500">

<img src="images/p5_6a.jpg" width="300" height="500">

Selain input teks dan pilihan sederhana, Flutter juga menyediakan Date & Time Picker untuk memilih tanggal maupun waktu. Widget ini memudahkan pengguna dalam memasukkan data temporal dengan format yang konsisten. Implementasi pada praktikum menampilkan tanggal terpilih dan membuktikan bahwa Flutter mampu mengelola input yang lebih kompleks.