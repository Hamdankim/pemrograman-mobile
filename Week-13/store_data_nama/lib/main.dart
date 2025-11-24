import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
// import 'dart:convert'; // (Dikomentari: hanya perlu untuk fitur JSON pizza)
// import 'package:shared_preferences/shared_preferences.dart'; // (Dikomentari: hanya perlu untuk counter)
// import 'model/pizza.dart'; // (Dikomentari: halaman pizza tidak ditampilkan)

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter JSON Demo Hamdan',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // =============== PATH PROVIDER STATE ===============
  String documentsPath = '';
  String tempPath = '';
  late File myFile;
  String fileText = '';

  // =============== (Dikomentari) PIZZA & COUNTER FEATURE ===============
  // List<Pizza> myPizzas = [];
  // bool showList = true;
  // int appCounter = 0; // counter shared preferences

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('JSON Hamdan'),
  //       actions: [
  //         IconButton(
  //           tooltip: showList ? 'Tampilkan Counter' : 'Tampilkan List',
  //           onPressed: () => setState(() => showList = !showList),
  //           icon: Icon(showList ? Icons.list : Icons.countertops),
  //         ),
  //         IconButton(
  //           tooltip: 'Reset Counter',
  //           onPressed: resetCounter,
  //           icon: const Icon(Icons.refresh),
  //         ),
  //       ],
  //     ),
  //     body: showList
  //         ? myPizzas.isEmpty
  //               ? const Center(child: CircularProgressIndicator())
  //               : ListView.builder(
  //                   itemCount: myPizzas.length,
  //                   itemBuilder: (context, index) {
  //                     final p = myPizzas[index];
  //                     return ListTile(
  //                       title: Text(p.pizzaName),
  //                       subtitle: Text(p.description),
  //                       trailing: Text(p.price.toStringAsFixed(2)),
  //                     );
  //                   },
  //                 )
  //         : Center(
  //             child: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 Text('You have opened the app $appCounter times.'),
  //                 const SizedBox(height: 12),
  //                 ElevatedButton(
  //                   onPressed: () => deletePreferences(),
  //                   child: const Text('Reset counter'),
  //                 ),
  //               ],
  //             ),
  //           ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Path Provider Hamdan')),
      body: _buildPathProviderPage(),
    );
  }

  // Halaman utama yang diminta: hanya Path Provider + operasi file
  Widget _buildPathProviderPage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Path Provider Demo',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Text('Documents path: $documentsPath'),
          Text('Temp path: $tempPath'),
          const SizedBox(height: 16),
          Row(
            children: [
              ElevatedButton(
                onPressed: readFile,
                child: const Text('Read File'),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: writeFile,
                child: const Text('Write File'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text('File content:'),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              fileText.isEmpty ? '(File kosong / belum dibaca)' : fileText,
            ),
          ),
          const SizedBox(height: 32),
          // ========== Bagian fitur lain dikomentari ==========
          const Text(
            'Fitur lain (Pizza / Counter) sedang dinonaktifkan.',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  // Widget lama (Pizza & Counter) dikomentari:
  // Widget _buildPizzaListOrLoader() { ... }
  // Widget _buildCounterAndPaths() { ... }

  // Future<List<Pizza>> readJsonFile() async { ... } (Dikomentari)
  // String convertToJson(List<Pizza> pizzas) { ... } (Dikomentari)

  // Future<void> readAndWritePreferences() async { ... } (Dikomentari)
  // Future<void> resetCounter() async { ... } (Dikomentari)
  // Future<void> deletePreferences() async { ... } (Dikomentari)

  Future<void> getPaths() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final tempDir = await getTemporaryDirectory();
    if (mounted) {
      setState(() {
        documentsPath = docsDir.path;
        tempPath = tempDir.path;
      });
    }
  }

  Future<bool> writeFile() async {
    try {
      if (!myFile.existsSync()) {
        myFile.createSync(recursive: true);
      }
      await myFile.writeAsString('Margherita, Capricciosa, Napoli');
      return true;
    } catch (_) {
      return false;
    }
  }

  // @override
  // void initState() {
  //   super.initState();
  //   // readAndWritePreferences();
  //   // readJsonFile().then((value) {
  //   //   if (!mounted) return;
  //   //   setState(() => myPizzas = value);
  //   // });
  //   getPaths();
  // }

  Future<bool> readFile() async {
    try {
      if (!myFile.existsSync()) {
        return false;
      }
      final fileContent = await myFile.readAsString();
      if (mounted) setState(() => fileText = fileContent);
      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    _initAsync();
  }

  Future<void> _initAsync() async {
    await getPaths();
    myFile = File('$documentsPath/pizzas.txt');
    await writeFile();
    // Fitur lain (pizza & counter) dinonaktifkan.
  }
}
