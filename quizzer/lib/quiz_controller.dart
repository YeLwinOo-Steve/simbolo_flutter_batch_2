import 'dart:math';

import 'package:get/get.dart';
import 'package:quizzer/question.dart';
import 'package:quizzer/quiz_screen.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';

class QuizController extends GetxController {
  late Database _database;
  RxList<Question> questions = <Question>[].obs;
  RxInt currentQuestionIndex = 0.obs;
  RxInt score = 0.obs;

  @override
  void onInit() {
    super.onInit();
    initDatabase();
  }

  Future<void> initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'quiz.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE questions(
            id INTEGER PRIMARY KEY,
            question TEXT,
            options TEXT,
            correctAnswerIndex INTEGER
          )
        ''');
      },
    );
    getQuestions();
  }

  Future<void> getQuestions() async {
    final List<Map<String, dynamic>> maps = await _database.query('questions');
    questions.value = maps.isNotEmpty
        ? maps.map((e) => Question.fromMap(e)).toList()
        : [
            Question(
              id: Random().nextInt(1000),
              question:
                  'The Eiffel Tower was originally intended for which city?',
              options: ['Barcelona', 'London', 'Paris', 'Brussels'],
              correctAnswerIndex: 0,
            ),
            Question(
              id: Random().nextInt(1000),
              question: 'What is the national flower of Japan?',
              options: ['Cherry Blossom', 'Rose', 'Daffodil', 'Tulip'],
              correctAnswerIndex: 0,
            ),
            Question(
              id: Random().nextInt(1000),
              question: 'What is the largest mammal in the world?',
              options: ['Elephant', 'Blue Whale', 'Giraffe', 'Hippo'],
              correctAnswerIndex: 1,
            ),
            Question(
              id: Random().nextInt(1000),
              question: 'Which planet is known as the Red Planet?',
              options: ['Venus', 'Mars', 'Jupiter', 'Mercury'],
              correctAnswerIndex: 1,
            ),
            Question(
              id: Random().nextInt(1000),
              question: 'What is the smallest country in the world?',
              options: ['Monaco', 'Vatican City', 'Maldives', 'Nauru'],
              correctAnswerIndex: 1,
            ),
            Question(
              id: Random().nextInt(1000),
              question: 'What is the hardest natural substance on Earth?',
              options: ['Gold', 'Diamond', 'Iron', 'Platinum'],
              correctAnswerIndex: 1,
            ),
            Question(
              id: Random().nextInt(1000),
              question: 'What is the capital city of Australia?',
              options: ['Sydney', 'Melbourne', 'Canberra', 'Brisbane'],
              correctAnswerIndex: 2,
            ),
            Question(
              id: Random().nextInt(1000),
              question: 'Which animal can be seen on the Porsche logo?',
              options: ['Lion', 'Horse', 'Bear', 'Tiger'],
              correctAnswerIndex: 1,
            ),
            Question(
              id: Random().nextInt(1000),
              question: 'What is the largest ocean on Earth?',
              options: [
                'Indian Ocean',
                'Atlantic Ocean',
                'Arctic Ocean',
                'Pacific Ocean'
              ],
              correctAnswerIndex: 3,
            ),
            Question(
              id: Random().nextInt(1000),
              question: 'How many continents are there in the world?',
              options: ['5', '6', '7', '8'],
              correctAnswerIndex: 2,
            ),
          ];
  }

  Future<void> addQuestion(Question question) async {
    await _database.insert('questions', question.toMap());
    getQuestions();
  }

  Future<void> deleteQuestion(int id) async {
    await _database.delete('questions', where: 'id = ?', whereArgs: [id]);
    getQuestions();
  }

  void answerQuestion(int selectedAnswerIndex) {
    if (selectedAnswerIndex ==
        questions[currentQuestionIndex.value].correctAnswerIndex) {
      score.value++;
    }
    if (currentQuestionIndex < questions.length - 1) {
      currentQuestionIndex++;
    } else {
      showScorePage();
    }
  }

  void showScorePage() {
    Get.to(
      () => ScorePage(
        score: score.value,
        totalQuestions: questions.length,
      ),
    );
  }
}
