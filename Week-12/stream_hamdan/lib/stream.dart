import 'package:flutter/material.dart';
import 'dart:async';

class ColorStream {
  final List<Color> colors = [
    Colors.blueGrey,
    Colors.amber,
    Colors.deepPurple,
    Colors.lightBlue,
    Colors.teal,
    Colors.pink,
    Colors.green,
    Colors.orange,
    Colors.red,
    Colors.indigo,
  ];

  Stream<Color> getColors() async* {
    yield* Stream.periodic(const Duration(seconds: 1), (int t) {
      int index = t % colors.length;
      return colors[index];
    });
  }
}

class NumberStream {
  final StreamController<int> controller = StreamController<int>();

  /// Menambahkan angka baru ke stream
  void addNumberToSink(int newNumber) {
    controller.sink.add(newNumber);
  }

  /// Menutup stream (dipanggil di dispose())
  void dispose() {
    controller.close();
  }

  addError() {
    controller.sink.addError("error");
  }
}
