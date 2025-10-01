import 'package:belanja/models/item.dart';
import 'package:belanja/widgets/item_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Item> items = [
    Item(
      name: 'Sugar',
      price: 5000,
      imageUrl:
          'images/sugar.jpg',
      stock: 50,
      rating: 4.5,
    ),
    Item(
      name: 'Salt',
      price: 2000,
      imageUrl: 'images/salt.webp',
      stock: 30,
      rating: 4.2,
    ),
    Item(
      name: 'Flour',
      price: 8000,
      imageUrl: 'images/flour.webp',
      stock: 25,
      rating: 4.7,
    ),
    Item(
      name: 'Oil',
      price: 15000,
      imageUrl: 'images/oil.webp',
      stock: 15,
      rating: 4.3,
    ),
    Item(
      name: 'Milk',
      price: 12000,
      imageUrl: 'images/milk.png',
      stock: 20,
      rating: 4.8,
    ),
    Item(
      name: 'Eggs',
      price: 25000,
      imageUrl: 'images/eggs.webp',
      stock: 40,
      rating: 4.6,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Belanja App"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.7,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ItemCard(item: items[index]);
                },
              ),
            ),
          ),
          // Footer dengan Nama dan NIM
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: Colors.grey[200],
            child: const Column(
              children: [
                Text(
                  'Nama: Hamdan',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('NIM: 2341720251'),
                SizedBox(height: 8),
                Text(
                  'Belanja App © 2024',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
