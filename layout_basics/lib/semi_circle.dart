import 'package:flutter/material.dart';

class SemiCircle extends StatelessWidget {
  const SemiCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Semi Circle'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 150,
          decoration: const BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(150),
              topRight: Radius.circular(150),
            ),
          ),
        ),
      ),
    );
  }
}
