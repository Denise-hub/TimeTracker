import 'package:flutter/material.dart';
import 'package:time_tracker/models/time_entry.dart'; // Import the TimeEntry model

class TimeEntryProvider with ChangeNotifier {
  // In-memory list of time entries (you can replace this with actual storage)
  List<TimeEntry> _entries = [];

  // Getter to access the list of entries
  List<TimeEntry> get entries => _entries;

  // Add a new time entry to the list
  void addTimeEntry(TimeEntry entry) {
    _entries.add(entry);
    notifyListeners(); // Notify listeners to rebuild widgets
  }

  // Delete a time entry by its ID
  void deleteTimeEntry(String id) {
    _entries.removeWhere((entry) => entry.id == id);
    notifyListeners(); // Notify listeners to rebuild widgets
  }

  // Edit an existing time entry
  void editTimeEntry(TimeEntry updatedEntry) {
    int index = _entries.indexWhere((entry) => entry.id == updatedEntry.id);
    if (index != -1) {
      _entries[index] = updatedEntry;
      notifyListeners(); // Notify listeners to rebuild widgets
    }
  }

  // Group time entries by project ID
  Map<String, List<TimeEntry>> get groupedByProject {
    Map<String, List<TimeEntry>> groupedEntries = {};
    for (var entry in _entries) {
      if (!groupedEntries.containsKey(entry.projectId)) {
        groupedEntries[entry.projectId] = [];
      }
      groupedEntries[entry.projectId]?.add(entry);
    }
    return groupedEntries;
  }

  // Simulate loading time entries from local storage (for example, shared preferences or a database)
  Future<void> loadTimeEntries() async {
    // In this example, we just use a static list of entries.
    // In a real app, you would load entries from local storage or an API here.
    await Future.delayed(Duration(seconds: 1)); // Simulate delay
    _entries = [
      TimeEntry(
        id: '1',
        projectId: 'p1',
        taskId: 't1',
        totalTime: 2.5,
        date: DateTime.now(),
        notes: 'Worked on project task 1',
      ),
      TimeEntry(
        id: '2',
        projectId: 'p2',
        taskId: 't2',
        totalTime: 3.0,
        date: DateTime.now().subtract(Duration(days: 1)),
        notes: 'Worked on project task 2',
      ),
    ];
    notifyListeners(); // Notify listeners to rebuild widgets
  }

  // Simulate saving time entries to local storage
  Future<void> saveTimeEntries() async {
    // In a real app, you would save entries to local storage or a database here.
    await Future.delayed(Duration(seconds: 1)); // Simulate delay
    print("Time entries saved!");
  }
}
