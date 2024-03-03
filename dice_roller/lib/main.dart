import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dice_roller_page.dart';
import 'dice_roller_with_provider_page.dart';
import 'domain/dice_roller_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DiceRollerProvider(),
      child: MaterialApp(
        title: 'Dice Roller',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: const DiceRollerPage(),
        home: const DiceRollerWithProviderPage(),
      ),
    );
  }
}
