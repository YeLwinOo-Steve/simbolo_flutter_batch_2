import 'package:flutter/material.dart';
import 'package:widget_basics/text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Widget basics',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[300],
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        leading: Icon(Icons.arrow_back_ios),
        title: Text("Widget Basics"),
        centerTitle: true,
        actions: [
          Icon(Icons.arrow_forward_ios),
          FlutterLogo(),
        ],
      ),
      body: TextBasics(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: "Floating Action Button",
        backgroundColor: Colors.red,
        child: Icon(
          Icons.add,
          size: 40,
          color: Colors.white,
        ),
      ),
    );
  }
}
