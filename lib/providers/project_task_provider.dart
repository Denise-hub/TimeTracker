import 'package:flutter/foundation.dart';
import '../models/project.dart';
import '../models/task.dart';

class ProjectTaskProvider extends ChangeNotifier {
  final List<Project> _projects = [];
  final List<Task> _tasks = [];

  List<Project> get projects => _projects;
  List<Task> get tasks => _tasks;

  void addProject(Project project) {
    _projects.add(project);
    notifyListeners();
  }

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }
}
