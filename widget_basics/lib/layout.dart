import 'package:flutter/material.dart';

class LayoutBasics extends StatelessWidget {
  const LayoutBasics({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.centerRight,
          children: [
            Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.green,
            ),
          ],
        )
      ],
    );
  }
}
