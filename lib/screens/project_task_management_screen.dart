import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:time_tracker/models/project.dart';
//import 'package:time_tracker/models/task.dart';
import 'package:time_tracker/providers/project_task_provider.dart';
import 'package:time_tracker/screens/add_project_screen.dart'; // Ensure this file exists

class ProjectTaskManagementScreen extends StatelessWidget {
  const ProjectTaskManagementScreen({super.key}); // ✅ Fix: Added key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Projects and Tasks'),
      ),
      body: Consumer<ProjectTaskProvider>(
        builder: (context, provider, child) {
          return provider.projects.isEmpty
              ? const Center(child: Text('No projects found. Add one!')) // ✅ Prevent errors if empty
              : ListView.builder(
                  itemCount: provider.projects.length,
                  itemBuilder: (context, index) {
                    final project = provider.projects[index];
                    return ListTile(
                      title: Text(project.name),
                      subtitle: Text('Tasks: ${project.tasks.length}'), // ✅ Ensure tasks exist in Project model
                      onTap: () {
                        // Navigate to task details or edit screen
                      },
                    );
                  },
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddProjectScreen()),
        );
        },
          tooltip: 'Add Project/Task',
          child: const Icon(Icons.add), 
        ),

    );
  }
}
