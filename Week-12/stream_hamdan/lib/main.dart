import 'package:flutter/material.dart';
import 'stream.dart';
import 'dart:async';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: StreamHomePage());
  }
}

class StreamHomePage extends StatefulWidget {
  const StreamHomePage({super.key});

  @override
  State<StreamHomePage> createState() => _StreamHomePageState();
}

class _StreamHomePageState extends State<StreamHomePage> {
  int lastNumber = 0;

  late NumberStream numberStream;
  late StreamController numberStreamController;

  Color bgColor = Colors.blueGrey;
  late ColorStream colorStream;

  @override
  void initState() {
    super.initState();

    // Inisialisasi stream angka
    numberStream = NumberStream();
    numberStreamController = numberStream.controller;

    numberStreamController.stream.listen((event) {
      setState(() {
        lastNumber = event;
      });
    }).onError((error) {
      setState(() {
        lastNumber = -1;
      });
    });

    // Inisialisasi stream warna
    colorStream = ColorStream();
    changeColor();
  }

  void changeColor() {
    colorStream.getColors().listen((eventColor) {
      setState(() {
        bgColor = eventColor;
      });
    });
  }

  void addRandomNumber() {
    Random random = Random();
    int value = random.nextInt(10);
    numberStream.addNumberToSink(value);
    // numberStream.addError();
  }

  @override
  void dispose() {
    numberStreamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stream Praktikum')),
      body: Container(
        width: double.infinity,
        color: bgColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              lastNumber.toString(),
              style: const TextStyle(fontSize: 40, color: Colors.white),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: addRandomNumber,
              child: const Text("New Random Number"),
            ),
          ],
        ),
      ),
    );
  }
}
