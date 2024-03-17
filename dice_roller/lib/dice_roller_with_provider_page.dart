import 'dart:math';

import 'package:dice_roller/domain/dice_roller_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'domain/dice_roller_notifier.dart';

class DiceRollerWithProviderPage extends StatefulWidget {
  const DiceRollerWithProviderPage({super.key});

  @override
  State<DiceRollerWithProviderPage> createState() =>
      _DiceRollerWithProviderPageState();
}

class _DiceRollerWithProviderPageState
    extends State<DiceRollerWithProviderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Consumer<DiceRollerProvider>(
              builder: (_, provider, __) {
                return Image.asset(
                  "assets/dice_${provider.diceFace}.png",
                  width: 150,
                  height: 150,
                );
              },
            ),
            const SizedBox(
              height: 50,
            ),
            FilledButton.tonalIcon(
              onPressed: () {
                context.read<DiceRollerProvider>().rollDice();
                // Provider.of<DiceRollerProvider>(context).rollDice();
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
