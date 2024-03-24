import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterProvider extends ChangeNotifier{
  int counter = 0;
  void incrementCounter() {
      counter++;
      notifyListeners(); // update();
  }
}