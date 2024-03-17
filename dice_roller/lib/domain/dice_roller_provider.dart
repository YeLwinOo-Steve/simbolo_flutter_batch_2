import 'dart:math';

import 'package:flutter/material.dart';

class DiceRollerProvider with ChangeNotifier{
  int diceFace = 1;
  void rollDice() {
    diceFace = Random().nextInt(6) + 1; // 1,..,6
    notifyListeners(); // important
    print("dice face value $diceFace");
  }
}