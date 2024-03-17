import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  int counter = 0;
  void incrementCounter() {
    counter++;
    update();
  }
  void decrementCounter(){
    counter--; // 11
    update();
  }
}
