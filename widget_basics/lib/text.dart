import 'package:flutter/material.dart';

class TextBasics extends StatelessWidget {
  const TextBasics({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          "Lists",
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "Hello Flutter! How are you?",
          textAlign: TextAlign.start,
          textDirection: TextDirection.ltr,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: TextStyle(
              color: Colors.red,
              fontSize: 50.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              wordSpacing: 1.0,
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.dotted),
        ),
      ],
    );
  }
}
