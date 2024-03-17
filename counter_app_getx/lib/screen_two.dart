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
        child: GetBuilder<CounterController>(
          builder: (controller) {
            return Text(
              'Counter ${controller.counter}',
              style: TextStyle(
                fontSize: 50,
              ),
            );
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          final controller = Get.find<CounterController>();
          controller.decrementCounter();
        },
        child: Icon(Icons.exposure_minus_1),
      ),
    );
  }
}
