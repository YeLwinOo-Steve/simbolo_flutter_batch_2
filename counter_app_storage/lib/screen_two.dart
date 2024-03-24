import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'domain/counter_provider.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final counterProvider = Provider.of<CounterProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('screen 2')),
      body: Center(
        child: Text('Counter ${counterProvider.counter}',style: TextStyle(
          fontSize: 50,
        ),),
      ),
    );
  }
}
