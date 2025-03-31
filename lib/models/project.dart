import 'task.dart'; // ✅ Ensure Task model is imported

class Project {
  final String id;
  final String name;
  final List<Task> tasks; // ✅ Fix: Ensure tasks exist

  Project({required this.id, required this.name, this.tasks = const []});
}
