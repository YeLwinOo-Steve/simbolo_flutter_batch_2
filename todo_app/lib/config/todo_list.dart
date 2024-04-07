import '../data/todo_model.dart';

class TodoList {
  static final List<TodoModel> _todos = [];

  static List<TodoModel> get todos => _todos;
  static void addTodo(TodoModel todo) {
    if (_todos.contains(todo)) return;
    _todos.add(todo);
  }

  /// TODO: Assignment - add edit and delete function for [_todos] list
  /// TODO: add local storage for [_todos] CRUD
  static final List<TodoModel> _doneTodos = [];
  static List<TodoModel> get doneTodos => _doneTodos;
  static void addDoneTodo(TodoModel todo) {
    if (_doneTodos.contains(todo)) return;
    _doneTodos.add(todo);
  }
}
