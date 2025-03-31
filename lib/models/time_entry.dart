class TimeEntry {
  final String id;
  final String projectId;
  final String taskId;
  final double totalTime; // Total time spent on the task (in hours)
  final DateTime date; // Date of the time entry
  final String notes; // Any additional notes for the time entry

  // Constructor
  TimeEntry({
    required this.id,
    required this.projectId,
    required this.taskId,
    required this.totalTime,
    required this.date,
    required this.notes,
  });

  // Convert the TimeEntry object to a map (for storage or passing data)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'projectId': projectId,
      'taskId': taskId,
      'totalTime': totalTime,
      'date': date.toIso8601String(),
      'notes': notes,
    };
  }

  // Create a TimeEntry object from a map (e.g., when retrieving from storage or a database)
  factory TimeEntry.fromMap(Map<String, dynamic> map) {
    return TimeEntry(
      id: map['id'],
      projectId: map['projectId'],
      taskId: map['taskId'],
      totalTime: map['totalTime'],
      date: DateTime.parse(map['date']),
      notes: map['notes'],
    );
  }

  // Optional: A string representation of the object for easier debugging or logging
  @override
  String toString() {
    return 'TimeEntry{id: $id, projectId: $projectId, taskId: $taskId, totalTime: $totalTime, date: $date, notes: $notes}';
  }
}
