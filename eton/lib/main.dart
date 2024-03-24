import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'note_controller.dart';
import 'note_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Note App',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.amber.shade100,
        ),
        scaffoldBackgroundColor: Colors.amber.shade100,
      ),
      home: NoteListScreen(),
    );
  }
}
