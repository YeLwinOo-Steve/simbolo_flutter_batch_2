import 'package:flutter/material.dart';

class ScreenThree extends StatelessWidget {
  const ScreenThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('Screen Three'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Screen Three'),
            FilledButton(onPressed: (){
              // Navigator.popUntil(context, (route) => false);
            }, child: Text('Screen One')),
          ],
        ),
      ),
    );
  }
}
