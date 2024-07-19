import 'package:fluid_dialog/fluid_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
import 'package:sudoku/screens/widgets/difficluty_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'SUDOKO',
              style: GoogleFonts.oswald(fontSize: 80),
            ),
            const Gap(12),
            SizedBox(
              width: 200,
              child: NeoPopButton(
                color: Colors.white,
                bottomShadowColor: Colors.grey,
                rightShadowColor: Colors.grey.shade200,
                animationDuration: const Duration(milliseconds: 200),
                depth: 3,
                onTapUp: () {
                  showDialog(
                      context: context,
                      builder: (context) => FluidDialog(
                          rootPage: FluidDialogPage(
                              builder: (context) =>
                                  const DifficlutyContainer())));
                },
                border: Border.all(
                  color: Colors.grey.shade200,
                  width: 1,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Play",
                        style: GoogleFonts.oswald(fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
