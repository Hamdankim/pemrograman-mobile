import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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
  // PATH PROVIDER
  String documentsPath = '';
  String tempPath = '';
  late File myFile;
  String fileText = '';

  // SECURE STORAGE
  final storage = const FlutterSecureStorage();
  final myKey = 'myPass';
  final pwdController = TextEditingController();
  String myPass = '';

  @override
  void initState() {
    super.initState();
    _initAsync();
  }

  Future<void> _initAsync() async {
    await getPaths();
    myFile = File('$documentsPath/pizzas.txt');
    await writeFile();
  }

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

  Future<bool> readFile() async {
    try {
      if (!myFile.existsSync()) return false;

      final content = await myFile.readAsString();
      if (mounted) setState(() => fileText = content);

      return true;
    } catch (_) {
      return false;
    }
  }

  Future<void> writeSecureStorage() async {
    await storage.write(key: myKey, value: pwdController.text);
  }

  Future<String?> readFromSecureStorage() async {
    return await storage.read(key: myKey);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Path Provider & Secure Storage')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ======== SECURE STORAGE ========
              const Text(
                'Secure Storage',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: pwdController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter secret password',
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      await writeSecureStorage();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Saved to secure storage')),
                      );
                    },
                    child: const Text('Save Value'),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: () async {
                      final value = await readFromSecureStorage();
                      setState(() => myPass = value ?? '');
                    },
                    child: const Text('Read Value'),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'Stored Password: ${myPass.isEmpty ? "(empty)" : myPass}',
                style: const TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 32),

              // ======== PATH PROVIDER ========
              const Text(
                'Path Provider',
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
              const Text('File content:'),
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
            ],
          ),
        ),
      ),
    );
  }
}
