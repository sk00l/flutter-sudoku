import 'package:flutter/material.dart';

class GameBoard extends StatelessWidget {
  const GameBoard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 9,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
          // crossAxisSpacing: 4,
          // mainAxisSpacing: 4,
        ),
        itemBuilder: (BuildContext context, int outerIndex) {
          return GridView.builder(
            itemCount: 9,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1,
              // crossAxisSpacing: 2,
              // mainAxisSpacing
            ),
            itemBuilder: (BuildContext context, int innerIndex) {
              int rowIndex = (outerIndex ~/ 3) * 3 + innerIndex ~/ 3;
              int colIndex = (outerIndex % 3) * 3 + innerIndex % 3;
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(
                      width: rowIndex % 3 == 0 ? 2.0 : 0.5,
                      color: Colors.grey,
                    ),
                    left: BorderSide(
                      width: colIndex % 3 == 0 ? 2.0 : 0.5,
                      color: Colors.grey,
                    ),
                    right: BorderSide(
                      width: colIndex % 3 == 2 ? 2.0 : 0.5,
                      color: Colors.grey,
                    ),
                    bottom: BorderSide(
                      width: rowIndex % 3 == 2 ? 2.0 : 0.5,
                      color: Colors.grey,
                    ),
                  ),
                ),
                child: Center(child: Text("${rowIndex * 9 + colIndex + 1}")),
              );
            },
          );
        },
      ),
    );
  }
}
