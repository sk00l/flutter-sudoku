import 'package:flutter/material.dart';

class KeypadWidget extends StatelessWidget {
  final Function(int) onKeyPressed;
  final Function onDeletePressed;

  const KeypadWidget({
    super.key,
    required this.onKeyPressed,
    required this.onDeletePressed,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 10,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        childAspectRatio: 1,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
      ),
      //built a grid view with FixedCrossAxisCount of 5 so that 5 itesm are displayed in a row
      //so that the total number of items displayed are 10
      itemBuilder: (context, index) {
        //since we only want numbers between 1-9 and a delete button, we can use an if else statement to check the index
        // for the last grid with index 9, we will return a delete button
        if (index == 9) {
          // Return delete button at the last position
          return GestureDetector(
            onTap: () => onDeletePressed(),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: const Center(
                child: Icon(
                  Icons.backspace,
                ),
              ),
            ),
          );
        } else {
          //and for everything else a number from 1-9 by doing their respective index +1
          // Return number buttons from 1 to 9
          return GestureDetector(
            onTap: () => onKeyPressed(index + 1),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Center(
                child: Text(
                  (index + 1).toString(),
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
