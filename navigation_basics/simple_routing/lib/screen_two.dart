import 'package:flutter/material.dart';

import 'screen_three.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Screen Two'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Screen Two'),
            FilledButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScreenThree(),
                    ),
                  );
                },
                child: Text('Screen three')),
            FilledButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios),
              label: Text('Screen one'),
            ),
          ],
        ),
      ),
    );
  }
}
