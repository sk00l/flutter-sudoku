import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sudoku/screens/widgets/sudoku_board.dart';
import 'package:sudoku/screens/widgets/timer_container.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Sudoku')),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            TimerContainer(),
            Gap(12),
            SudokuBoard(),
          ],
        ),
      ),
    );
  }
}
