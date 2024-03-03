import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'screen_two.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: const Text('Screen One'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Screen One'),
            FilledButton(onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => ScreenTwo()), // material or cupertino
              );
            }, child: Text('Screen two')),
          ],
        ),
      ),
    );
  }
}
