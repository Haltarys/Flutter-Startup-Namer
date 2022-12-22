import 'package:flutter/material.dart';
import 'package:startup_namer/theme.dart';
import 'package:startup_namer/random_words.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: theme(),
      home: const RandomWords(),
    );
  }
}
