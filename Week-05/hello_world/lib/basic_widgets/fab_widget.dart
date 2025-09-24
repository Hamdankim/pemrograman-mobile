
import 'package:flutter/material.dart';

class FabWidgetApp extends StatelessWidget {
  const FabWidgetApp({super.key});

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
          },
          backgroundColor: Colors.pink,
          child: const Icon(Icons.thumb_up),
        ),
      ),
    );
  }
}