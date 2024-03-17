import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class CounterController extends GetxController {
  var counter = 0.obs; // reactive integer
  var someString = "".obs;
  void incrementCounter() {
    counter.value = counter.value + 1;
  }
  void decrementCounter(){
    counter.value = counter.value - 1; // 11
  }
}
