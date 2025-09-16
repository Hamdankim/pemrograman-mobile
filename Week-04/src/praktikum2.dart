void main(List<String> args) {
  // Set berisi nama-nama unsur halogen
  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  print(halogens);

  // Dua Set kosong
  var names1 = <String>{};
  var names2 = <String>{};

  // Tambahkan data menggunakan .add()
  names1.add("Hamdan Azizul Hakim");
  names1.add("14");

  // Tambahkan data menggunakan .addAll()
  names2.addAll({"Hamdan Azizul Hakim", "14"});

  print(names1);
  print(names2);
}
