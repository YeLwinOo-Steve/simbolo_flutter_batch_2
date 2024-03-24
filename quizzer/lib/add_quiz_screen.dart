import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzer/quiz_controller.dart';

import 'question.dart';

class AddQuizScreen extends StatelessWidget {
  final quizController = Get.find<QuizController>();
  final TextEditingController questionController = TextEditingController();
  final TextEditingController option1Controller = TextEditingController();
  final TextEditingController option2Controller = TextEditingController();
  final TextEditingController option3Controller = TextEditingController();
  final TextEditingController option4Controller = TextEditingController();
  final TextEditingController correctAnswerController = TextEditingController();

  AddQuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Question')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: questionController,
              decoration: InputDecoration(labelText: 'Question'),
            ),
            TextField(
              controller: option1Controller,
              decoration: InputDecoration(labelText: 'Option 1'),
            ),
            TextField(
              controller: option2Controller,
              decoration: InputDecoration(labelText: 'Option 2'),
            ),
            TextField(
              controller: option3Controller,
              decoration: InputDecoration(labelText: 'Option 3'),
            ),
            TextField(
              controller: option4Controller,
              decoration: InputDecoration(labelText: 'Option 4'),
            ),
            TextField(
              controller: correctAnswerController,
              decoration: const InputDecoration(
                labelText: 'Correct Answer Index (0-3)',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                int correctAnswerIndex =
                    int.parse(correctAnswerController.text);
                Question newQuestion = Question(
                  id: Random().nextInt(1000),
                  question: questionController.text,
                  options: [
                    option1Controller.text,
                    option2Controller.text,
                    option3Controller.text,
                    option4Controller.text,
                  ],
                  correctAnswerIndex: correctAnswerIndex,
                );
                quizController.addQuestion(newQuestion);
                Get.back();
              },
              child: Text('Add Question'),
            ),
          ],
        ),
      ),
    );
  }
}
