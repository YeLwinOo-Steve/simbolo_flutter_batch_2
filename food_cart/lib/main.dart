import 'package:flutter/material.dart';
import 'package:food_cart_getx/setup.dart';
import 'package:get/get.dart';

import 'counter/counter_controller.dart';
import 'page/home_page.dart';

void main() {
  Binding.setUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}