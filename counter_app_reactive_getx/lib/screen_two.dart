import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'domain/counter_controller.dart';

class ScreenTwo extends StatelessWidget {
  ScreenTwo({super.key});
  final controller = Get.find<CounterController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('screen 2')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(() {
              return Text(
                'Counter ${controller.counter}',
                style: TextStyle(
                  fontSize: 50,
                ),
              );
            }),
            FilledButton(onPressed: () {
              // Navigator.pop(context);
            Get.back();
            }, child: Text('Screen One')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.decrementCounter();
        },
        child: Icon(Icons.exposure_minus_1),
      ),
    );
  }
}
