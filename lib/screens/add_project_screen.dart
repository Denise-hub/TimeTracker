import 'package:flutter/material.dart';

class AddProjectScreen extends StatelessWidget {
  const AddProjectScreen({super.key}); 

  @override
  Widget build(BuildContext context) {
    final TextEditingController projectController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Add Project')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: projectController,
              decoration: const InputDecoration(labelText: 'Project Name'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // You can save the project to a list or database here
                String projectName = projectController.text;
                
                if (projectName.isNotEmpty) {
                  // Logic to save the project (you can pass it to the provider or save it in a list)
                  // For now, we'll just pop the screen.
                  Navigator.pop(context);
                }
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
