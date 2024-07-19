import 'package:flutter/material.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';

class DifficultyButton extends StatelessWidget {
  final String difficulty;
  final int clueCount;
  final ValueChanged<int> onSelected;

  const DifficultyButton({
    super.key,
    required this.difficulty,
    required this.clueCount,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return NeoPopButton(
      color: const Color.fromRGBO(0, 0, 0, 1),
      buttonPosition: Position.center,
      onTapUp: () {
        onSelected(clueCount);
      },
      border: const Border.fromBorderSide(
        BorderSide(color: Colors.white, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(difficulty, style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
