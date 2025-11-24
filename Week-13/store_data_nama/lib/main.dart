import 'package:flutter/material.dart';
import 'dart:convert';
import 'model/pizza.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  List<Pizza> myPizzas = [];
  int appCounter = 0;
  bool showList = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JSON Hamdan'),
        actions: [
          IconButton(
            tooltip: showList ? 'Tampilkan Counter' : 'Tampilkan List',
            onPressed: () => setState(() => showList = !showList),
            icon: Icon(showList ? Icons.list : Icons.countertops),
          ),
          IconButton(
            tooltip: 'Reset Counter',
            onPressed: resetCounter,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: showList
          ? myPizzas.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: myPizzas.length,
                    itemBuilder: (context, index) {
                      final p = myPizzas[index];
                      return ListTile(
                        title: Text(p.pizzaName),
                        subtitle: Text(p.description),
                        trailing: Text(p.price.toStringAsFixed(2)),
                      );
                    },
                  )
          : Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('You have opened the app $appCounter times.'),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () => deletePreferences(),
                    child: const Text('Reset counter'),
                  ),
                ],
              ),
            ),
    );
  }

  Future<List<Pizza>> readJsonFile() async {
    final raw = await DefaultAssetBundle.of(
      context,
    ).loadString('assets/pizzalist.json');
    final List<dynamic> decoded = jsonDecode(raw) as List<dynamic>;
    final pizzas = decoded
        .map((e) => Pizza.fromJson(e as Map<String, dynamic>))
        .toList();
    // Debug print JSON normal (list of objects)
    debugPrint(convertToJson(pizzas));
    return pizzas;
  }

  String convertToJson(List<Pizza> pizzas) {
    return jsonEncode(pizzas.map((p) => p.toJson()).toList());
  }

  Future readAndWritePreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final current = (prefs.getInt('appCounter') ?? 0) + 1;
    await prefs.setInt('appCounter', current);
    setState(() => appCounter = current);
  }

  Future<void> resetCounter() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('appCounter', 0);
    setState(() => appCounter = 0);
  }

  Future deletePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    setState(() => appCounter = 0);
  }

  @override
  void initState() {
    super.initState();
    readAndWritePreferences();
    readJsonFile().then((value) {
      if (!mounted) return;
      setState(() => myPizzas = value);
    });
  }
}
