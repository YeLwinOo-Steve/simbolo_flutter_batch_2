import 'package:flutter/material.dart';

class BoxBasics extends StatelessWidget {
  const BoxBasics({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
        ),

        /// size
        Container(
          width: 250,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}
