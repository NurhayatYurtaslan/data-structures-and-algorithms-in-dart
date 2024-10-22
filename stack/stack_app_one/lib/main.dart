import 'package:flutter/material.dart';
import 'package:stack_app_one/view_home/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(), // Doğrudan HomePage'i kullan
    );
  }
}
