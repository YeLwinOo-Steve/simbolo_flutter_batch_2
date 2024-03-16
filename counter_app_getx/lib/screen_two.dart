import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'domain/counter_controller.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('screen 2')),
      body: Center(
        child: Text(
          'Counter ${Get.find<CounterController>().counter}',
          style: TextStyle(
            fontSize: 50,
          ),
        ),
      ),
    );
  }
}
