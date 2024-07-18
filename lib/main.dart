import 'package:flutter/material.dart';
import 'package:sudoku/constants/game_sizes.dart';
import 'package:sudoku/screens/game_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    GameSizes.init(context);
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const GameScreen(),
    );
  }
}
