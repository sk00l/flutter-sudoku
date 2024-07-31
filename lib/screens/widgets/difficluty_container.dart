import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sudoku/screens/game_screen.dart';
import 'package:sudoku/screens/widgets/difficluty_button.dart';

class DifficlutyContainer extends StatefulWidget {
  const DifficlutyContainer({super.key});

  @override
  State<DifficlutyContainer> createState() => _DifficlutyContainerState();
}

class _DifficlutyContainerState extends State<DifficlutyContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 240,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Select Difficulty",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(12),
              DifficultyButton(
                difficulty: 'Easy',
                clueCount: 40,
                onSelected: (clueCount) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GameScreen(clueCount: clueCount),
                    ),
                  ).then((_) {
                    Navigator.pop(context);
                  });
                },
              ),
              const Gap(20),
              DifficultyButton(
                difficulty: 'Medium',
                clueCount: 35,
                onSelected: (clueCount) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GameScreen(clueCount: clueCount),
                    ),
                  ).then((_) {
                    Navigator.pop(context);
                  });
                },
              ),
              const Gap(20),
              DifficultyButton(
                difficulty: 'Hard',
                clueCount: 18,
                onSelected: (clueCount) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GameScreen(clueCount: clueCount),
                    ),
                  ).then((_) {
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
