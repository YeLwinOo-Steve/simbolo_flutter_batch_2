import 'dart:math';

import 'package:flutter/material.dart';

import 'domain/dice_roller_notifier.dart';

class DiceRollerPage extends StatefulWidget {
  const DiceRollerPage({super.key});

  @override
  State<DiceRollerPage> createState() => _DiceRollerPageState();
}

class _DiceRollerPageState extends State<DiceRollerPage> {
  final diceRollerNotifier = DiceRollerNotifier();

  int diceVal = 1;
  @override
  void initState() {
    super.initState();
    diceRollerNotifier.addListener(() {
      print("-------------> ${diceRollerNotifier.diceFace}");
      diceVal = diceRollerNotifier.diceFace;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/dice_$diceVal.png",
              width: 150,
              height: 150,
            ),
            const SizedBox(
              height: 50,
            ),
            FilledButton.tonalIcon(
              onPressed: (){
                diceRollerNotifier.rollDice();
              },
              icon: Icon(Icons.ads_click),
              label: Text('Roll Dice'),
            ),
          ],
        ),
      ),
    );
  }
}
