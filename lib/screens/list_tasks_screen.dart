import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';

class ListTaskScreen extends StatelessWidget {
  const ListTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task List'),
      ),
      body: Consumer<TaskProvider>(
        builder: (context, taskProvider, child) {
          final tasksByCategory = taskProvider.tasksByCategory;

          if (tasksByCategory.isEmpty) {
            return const Center(
              child: Text('No tasks available. Add some tasks!'),
            );
          }

          return ListView(
            children: tasksByCategory.entries.map((entry) {
              final category = entry.key;
              final tasks = entry.value;

              return ExpansionTile(
                title: Text(category),
                children: tasks.map((task) {
                  return ListTile(
                    title: Text(task.name),
                    subtitle: Text('Due: ${task.dueDate}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.check, color: Colors.green),
                          onPressed: () {
                            // Mark the task as completed
                            taskProvider.completeTask(task);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Task marked as completed!')),
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            // Remove the task
                            taskProvider.removeTask(task);

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Task deleted successfully!')),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                }).toList(),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
