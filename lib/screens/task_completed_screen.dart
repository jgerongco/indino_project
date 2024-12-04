import 'package:flutter/material.dart';
import 'package:indino_project/models/task.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';

class TaskCompletedScreen extends StatelessWidget {
  const TaskCompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Completed Tasks'),
      ),
      body: Consumer<TaskProvider>(
        builder: (context, taskProvider, child) {
          final completedTasksByCategory =
              _groupTasksByCategory(taskProvider.completedTasks);

          if (completedTasksByCategory.isEmpty) {
            return const Center(
              child: Text('No completed tasks.'),
            );
          }

          return ListView(
            children: completedTasksByCategory.entries.map((entry) {
              final category = entry.key;
              final tasks = entry.value;

              return ExpansionTile(
                title: Text(
                  category,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                children: tasks.map((task) {
                  return ListTile(
                    title: Text(task.name),
                    subtitle: Text('Completed: ${task.dueDate}'),
                  );
                }).toList(),
              );
            }).toList(),
          );
        },
      ),
    );
  }

  Map<String, List<Task>> _groupTasksByCategory(List<Task> tasks) {
    final Map<String, List<Task>> groupedTasks = {
      'General': [],
      'Work': [],
      'Personal': [],
      'Urgent': [],
    };

    for (var task in tasks) {
      if (groupedTasks.containsKey(task.category)) {
        groupedTasks[task.category]!.add(task);
      } else {
        groupedTasks['General']!
            .add(task); // Default to 'General' if no matching category
      }
    }

    return groupedTasks;
  }
}
