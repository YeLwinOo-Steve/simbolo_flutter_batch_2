import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzer/quiz_controller.dart';

import 'add_quiz_screen.dart';

class QuizScreen extends StatelessWidget {
  final QuizController quizController = Get.put(QuizController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quiz')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Get.to(() => AddQuizScreen()),
        label: const Text('Add Quiz'),
        icon: const Icon(Icons.add),
      ),
      body: Obx(() {
        return Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  quizController
                      .questions[quizController.currentQuestionIndex.value]
                      .question,
                  style: TextStyle(fontSize: 24.0),
                ),
              ),
              ...List.generate(
                quizController
                    .questions[quizController.currentQuestionIndex.value]
                    .options
                    .length,
                (index) {
                  return ElevatedButton(
                    onPressed: () {
                      quizController.answerQuestion(index);
                    },
                    child: Text(
                      quizController
                          .questions[quizController.currentQuestionIndex.value]
                          .options[index],
                    ),
                  );
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}

class ScorePage extends StatelessWidget {
  final int score;
  final int totalQuestions;

  ScorePage({required this.score, required this.totalQuestions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quiz Score')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Your score: $score / $totalQuestions'),
            ElevatedButton(
              onPressed: () {
                Get.find<QuizController>().currentQuestionIndex.value = 0;
                Get.find<QuizController>().score.value = 0;
                Get.back();
              },
              child: Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
