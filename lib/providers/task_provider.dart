import 'package:flutter/material.dart';
import 'package:login_logout_simple_ui/providers/task.dart';

class TaskProvider with ChangeNotifier {
  final List<Task> _items = [
    Task(
      title: 'Code',
      difficulty: 'Medium',
      duration: 5.0,
      exp: 50.0,
    ),
    Task(
      title: 'Read',
      difficulty: 'Easy',
      duration: 1.0,
      exp: 10.0,
    ),
    Task(
      title: 'Go for a walk',
      difficulty: 'Easy',
      duration: 2.0,
      exp: 20.0,
    ),
    Task(
      title: 'Exercise',
      difficulty: 'Hard',
      duration: 0.5,
      exp: 15.0,
    ),
  ];

  List<Task> get items {
    return [..._items];
  }

  void addTask(Task task) {
    final newTask = Task(
      title: task.title,
      difficulty: task.difficulty,
      duration: task.duration,
      exp: task.exp,
    );
    _items.add(newTask);
    notifyListeners();
  }
}
