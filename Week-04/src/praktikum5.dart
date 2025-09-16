void main(List<String> args) {
  var record = ('first', a: 2, b: true, 'last');
  print(record);

  var pasangan = (10, 20);
  print('Sebelum tukar: $pasangan');

  var hasil = tukar(pasangan);
  print('Sesudah tukar: $hasil');

  (String, int) mahasiswa = ('Hamdan Azizul Hakim', 2341720251);
  print(mahasiswa);

  var mahasiswa2 = ('Hamdan Azizul Hakim', a: 2341720251, b: true, 'last');

  print(mahasiswa2.$1); // Prints 'first'
  print(mahasiswa2.a); // Prints 2
  print(mahasiswa2.b); // Prints true
  print(mahasiswa2.$2); // Prints 'last'
}

(int, int) tukar((int, int) record) {
  var (a, b) = record;
  return (b, a);
}
