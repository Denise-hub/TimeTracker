import 'package:flutter/material.dart';

class AddTimeEntryScreen extends StatelessWidget {
  const AddTimeEntryScreen({super.key});  // ✅ Added key parameter

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Time Entry')),  // Use const for better performance
      body: const Center(child: Text('Add Time Entry Screen')),  // Use const for better performance
    );
  }
}
