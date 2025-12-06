// main.dart
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import '1.loading_page.dart'; // hoặc welcome_page

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Khởi tạo Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Andating App',
      theme: ThemeData.dark(),
      home: const LoadingPage(), // Gọi trang loading
    );
  }
}
