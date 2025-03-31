import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/models/time_entry.dart';
import 'package:time_tracker/providers/time_entry_provider.dart';

class AddTimeEntryScreen extends StatefulWidget {
  const AddTimeEntryScreen({super.key});

  @override
  AddTimeEntryScreenState createState() => AddTimeEntryScreenState();
}

class AddTimeEntryScreenState extends State<AddTimeEntryScreen> {
  final _formKey = GlobalKey<FormState>();
  String? projectId;
  String? taskId;
  double totalTime = 0.0;
  DateTime date = DateTime.now();
  String notes = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Time Entry')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            constraints: BoxConstraints(maxWidth: 600),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  // Project Dropdown
                  DropdownButtonFormField<String>(
                    value: projectId,
                    onChanged: (String? newValue) {
                      setState(() => projectId = newValue);
                    },
                    decoration: InputDecoration(
                      labelText: 'Project',
                      labelStyle: TextStyle(color: Colors.teal), // Teal text color
                      filled: true,
                      fillColor: const Color(0xFFE0F7FA), // Light teal
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    items: ['Project 1', 'Project 2', 'Project 3']
                        .map((value) => DropdownMenuItem(value: value, child: Text(value, style: TextStyle(color: Colors.teal))))
                        .toList(),
                    validator: (value) => value == null ? 'Please select a project' : null,
                  ),
                  const SizedBox(height: 16), // Space between fields

                  // Task Dropdown
                  DropdownButtonFormField<String>(
                    value: taskId,
                    onChanged: (String? newValue) {
                      setState(() => taskId = newValue);
                    },
                    decoration: InputDecoration(
                      labelText: 'Task',
                      labelStyle: TextStyle(color: Colors.teal), // Teal text color
                      filled: true,
                      fillColor: const Color(0xFFE0F7FA), // Light teal
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    items: ['Task 1', 'Task 2', 'Task 3']
                        .map((value) => DropdownMenuItem(value: value, child: Text(value, style: TextStyle(color: Colors.teal))))
                        .toList(),
                    validator: (value) => value == null ? 'Please select a task' : null,
                  ),
                  const SizedBox(height: 16), // Space between fields

                  // Total Time Field
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Total Time (hours)',
                      labelStyle: TextStyle(color: Colors.teal), // Teal text color
                      filled: true,
                      fillColor: const Color(0xFFE0F7FA), // Light teal
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Please enter total time';
                      if (double.tryParse(value) == null) return 'Please enter a valid number';
                      return null;
                    },
                    onSaved: (value) => totalTime = double.parse(value!),
                  ),
                  const SizedBox(height: 16), // Space between fields

                  // Notes Field
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Notes',
                      labelStyle: TextStyle(color: Colors.teal), // Teal text color
                      filled: true,
                      fillColor: const Color(0xFFE0F7FA), // Light teal
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (value) => (value == null || value.isEmpty) ? 'Please enter some notes' : null,
                    onSaved: (value) => notes = value!,
                  ),
                  const SizedBox(height: 20), // Space before button

                  // Save Button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00796B), // Teal color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        Provider.of<TimeEntryProvider>(context, listen: false).addTimeEntry(
                          TimeEntry(
                            id: DateTime.now().toString(),
                            projectId: projectId!,
                            taskId: taskId!,
                            totalTime: totalTime,
                            date: date,
                            notes: notes,
                          ),
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Save', style: TextStyle(color: Colors.white)), // White text color for the button
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
