// lib/models/task.dart
class Task {
  final String name;
  final String category;
  final String dueDate;
  bool completed; // Add this field

  Task({
    required this.name,
    required this.category,
    required this.dueDate,
    this.completed = false, // Default to not completed
  });
}
