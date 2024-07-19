// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sudoku/screens/widgets/sudoku_board.dart';
import 'package:sudoku/screens/widgets/timer_container.dart';

class GameScreen extends StatefulWidget {
  final int clueCount;
  const GameScreen({
    super.key,
    required this.clueCount,
  });

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Center(
          child: Text('Sudoku'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const TimerContainer(),
            const Gap(12),
            SudokuBoard(
              clueCount: widget.clueCount,
            ),
          ],
        ),
      ),
    );
  }
}
