import 'package:flutter/material.dart';
import 'package:todo_app/routes/routes.dart';

import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.orange.shade50,
        ),
        scaffoldBackgroundColor: Colors.orange.shade50,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.orange.shade50,
        ),
      ),
      home: const HomePage(),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
