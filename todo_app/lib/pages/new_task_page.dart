import 'package:flutter/material.dart';
import 'package:todo_app/config/todo_list.dart';
import 'package:todo_app/data/todo_model.dart';

class NewTaskPage extends StatefulWidget {
  const NewTaskPage({super.key});

  @override
  State<NewTaskPage> createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {
  /// [_formKey] is used for validating form state
  final _formKey = GlobalKey<FormState>();
  final today = DateTime.now();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final List<String> days = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];
  String weekDayToDay(int index) {
    return days[index - 1];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Task'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    label: Text('Title'),
                    prefixIcon: Icon(
                      Icons.title,
                      color: Colors.orange,
                    ),
                  ),
                  validator: (String? val) {
                    if (val == null || val == '') return 'Title is required!';
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: _descriptionController,
                  minLines: 1,
                  maxLines: null,
                  decoration: const InputDecoration(
                    label: Text('Description'),
                    prefixIcon: Icon(
                      Icons.description,
                      color: Colors.orange,
                    ),
                  ),
                  validator: (String? val) {
                    if (val == null || val == '') {
                      return 'Description is required!';
                    }
                    return null;
                  },
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.orange.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  width: 200,
                  margin: const EdgeInsets.only(top: 100),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.calendar_month,
                            size: 50,
                            color: Colors.orange,
                          ),
                          Text(
                            'Date',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  color: Colors.orange,
                                ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${today.month} / ${today.year}',
                                style: const TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                '${today.day}',
                                style: const TextStyle(
                                  fontSize: 60,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.orange,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 130,
                            child: VerticalDivider(
                              width: 3,
                              color: Colors.orange,
                            ),
                          ),
                          RotatedBox(
                            quarterTurns: 3,
                            child: Text(
                              weekDayToDay(today.weekday),
                              style: const TextStyle(
                                color: Colors.orange,
                                letterSpacing: 5,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            final now = DateTime.now();
            final newTodo = TodoModel(
                _titleController.text,
                _descriptionController.text,
                '${today.day}/${today.month}/${today.year}',
                '${now.hour} : ${now.minute}');
            Navigator.pop(context, newTodo);
          }
        },
        icon: const Icon(Icons.add_task_rounded),
        label: const Text("Save"),
      ),
    );
  }
}
