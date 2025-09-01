late String age;  // deklarasi variable tanpa inisialisasi
void main() {
print(age); // ERROR, karena belum diinisialisasi
age = "18";
print(age); // Berhasil, karena sudah diinisialisasi

// Aturan 1
// Nullable Variable
String? nickname;   // secara default null
nickname = "Hakim"; // bisa diisi string
nickname = null;    // bisa diisi null

// Non-nullable Variable
String name = "Hamdan"; // harus diisi string
name = "Azizul";        // bisa diisi string
//name = null;          // ERROR, tidak bisa diisi null

// Aturan 2
String? nim; // otomatis bernilai null
//String name; // ERROR, harus diisi string

// Aturan 3
String? address = null;
//print(addres.length); //ERROR, karena address bisa null


}



