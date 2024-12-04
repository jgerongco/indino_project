import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskProvider with ChangeNotifier {
  final List<Task> _tasks = [];
  final List<Task> _completedTasks = [];

  List<Task> get tasks => _tasks;

  List<Task> get completedTasks => _completedTasks;

  Map<String, List<Task>> get tasksByCategory {
    Map<String, List<Task>> categorizedTasks = {};
    for (var task in _tasks) {
      categorizedTasks.putIfAbsent(task.category, () => []).add(task);
    }
    return categorizedTasks;
  }

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void removeTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  void completeTask(Task task) {
    _tasks.remove(task);
    _completedTasks.add(task);
    notifyListeners();
  }
}
