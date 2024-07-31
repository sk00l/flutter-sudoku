// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sudoku/screens/shared/app_container.dart';

class ActionButtons extends StatelessWidget {
  final VoidCallback onHint;
  final VoidCallback onSolve;
  final VoidCallback onRedo;
  const ActionButtons({
    super.key,
    required this.onHint,
    required this.onSolve,
    required this.onRedo,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: onRedo,
          child: AppContainer(
            title: "New",
            icon: const Icon(FontAwesomeIcons.rotateLeft),
          ),
        ),
        InkWell(
          onTap: onSolve,
          child: AppContainer(
            title: "Solve Puzzle",
            icon: const Icon(FontAwesomeIcons.flagCheckered),
          ),
        ),
        InkWell(
          onTap: onHint,
          child: AppContainer(
            title: "Hint",
            icon: const Icon(FontAwesomeIcons.lightbulb),
          ),
        ),
      ],
    );
  }
}
