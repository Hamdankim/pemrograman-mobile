void main(List<String> args) {
  var gifts = {
    // Key:    Value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 1,
  };

  var nobleGases = {2: 'helium', 10: 'neon', 18: 2};

  var mhs1 = Map<String, String>();
  gifts['first'] = 'partridge';
  gifts['second'] = 'turtledoves';
  gifts['fifth'] = 'golden rings';

  var mhs2 = Map<int, String>();
  nobleGases[2] = 'helium';
  nobleGases[10] = 'neon';
  nobleGases[18] = 'argon';

  // Menambahkan Nama dan Nim pada semua variabel Map
  gifts['Nama'] = 'Hamdan Azizul Hakim';
  gifts['Nim'] = '2341720251';
  nobleGases[3] = 'Hamdan Azizul Hakim';
  nobleGases[4] = '2341720251';
  mhs1['Nama'] = 'Hamdan Azizul Hakim';
  mhs1['Nim'] = '2341720251';
  mhs2[1] = 'Hamdan Azizul Hakim';
  mhs2[2] = '2341720251';

  print(gifts);
  print(nobleGases);
  print(mhs1);
  print(mhs2);
}
