import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config/todo_list.dart';
import '../data/todo_model.dart';
import '../widgets/info_card.dart';
import 'completed_page.dart';
import 'tasks_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pageController = PageController();

  ///[currentPageIndex] indicates current page index in [BottomNavigationBar] class
  int currentPageIndex = 0;

  /// define a [TodoModel] list for maintaining temporary state
  final List<TodoModel> tempTodoList = TodoList.todos;

  /// [Widget] list to show based on selected [currentPageIndex]
  void addTodo(TodoModel todo) {
    setState(() {
      tempTodoList.add(todo);
      TodoList.addTodo(todo);
    });
  }

  void doneTodo(TodoModel todo) {
    setState(() {
      tempTodoList.remove(todo);
      TodoList.addDoneTodo(todo.copyWith(
        isDone: true,
      ));
    });
  }

  void showInfoSheet() {
    showModalBottomSheet(
        context: context,
        isDismissible: false,
        constraints: BoxConstraints(
          maxHeight: MediaQuery.sizeOf(context).height * 0.45,
        ),
        builder: (context) {
          return Container(
            width: double.maxFinite,
            color: Colors.orange.shade100,
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      'TODO Tasks',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.orange,
                          ),
                    )),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close,
                            size: 18, color: Colors.orange))
                  ],
                ),
                Expanded(
                  child: Center(
                    child: Row(
                      children: [
                        InfoCard(
                          label: TodoList.todos.length.toString(),
                          bgColor: Colors.orange.shade200,
                          textColor: Colors.orange,
                          infoLabel: 'todo',
                        ),
                        InfoCard(
                          label: TodoList.doneTodos.length.toString(),
                          bgColor: Colors.green.shade200,
                          textColor: Colors.green,
                          infoLabel: 'done',
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO'),
        centerTitle: true,
        actions: [
          IconButton(
            style: IconButton.styleFrom(
              iconSize: 28,
              foregroundColor: Colors.orange,
            ),
            icon: const Icon(Icons.info),

            /// shows a information bottom sheet
            onPressed: showInfoSheet,
          )
        ],
      ),
      body: PageView(
        /// [PageView] is exactly [ListView] or [GridView] but for showing pages, we use [PageView] with [PageViewController]
        /// Tutorial: https://api.flutter.dev/flutter/widgets/PageView-class.html
        ///
        controller: pageController,
        onPageChanged: (int index) {
          /// update [currentPageIndex] when page is scrolled
          setState(() {
            currentPageIndex = index;
          });
        },
        children: [
          TasksPage(
            todoList: tempTodoList,
            onTodoDone: doneTodo,
          ), // index 0
          const CompletedPage(), // index 1
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () async {
          final returnVal = await Navigator.pushNamed(context, '/new_task');

          /// check if [returnVal] is [null]
          /// if not [null], check if it is of Type [TodoModel]
          /// if [returnVal] is not null and it is of Type [TodoModel]
          /// add it to the [TodoList]
          ///
          if (returnVal != null) {
            addTodo(returnVal as TodoModel);
          }
        },
        child: const Icon(
          Icons.add_task_rounded,
          color: Colors.orange,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            currentPageIndex = index;
          });
          pageController.animateToPage(currentPageIndex,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut);
        },
        elevation: 0.0,
        fixedColor: Colors.orange,
        currentIndex: currentPageIndex,
        items: const [
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.sticky_note_2_rounded),
            icon: Icon(Icons.sticky_note_2_outlined),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.task_rounded),
            icon: Icon(Icons.task_outlined),
            label: 'Completed',
          ),
        ],
      ),
    );
  }
}
