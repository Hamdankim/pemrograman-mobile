import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:kamera_flutter/widget/filter_carousel.dart';
import 'package:kamera_flutter/widget/takepicture_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final cameras = await availableCameras();
  final firstCamera = cameras.first;

  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => TakePictureScreen(camera: firstCamera),
        '/filter': (context) {
          // Ambil argumen imagePath dari halaman sebelumnya
          final imagePath = ModalRoute.of(context)?.settings.arguments as String?;
          return PhotoFilterCarousel(imagePath: imagePath);
        },
      },
    ),
  );
}
