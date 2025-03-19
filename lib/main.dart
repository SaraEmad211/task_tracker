import 'package:flutter/material.dart';
import 'package:to_do_list/Sign_In.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
      home: Sign_in(),
    );
  }
}