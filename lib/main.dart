import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import './providers/time_entry_provider.dart';
import './screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter(); // Initialize Hive
  await Hive.openBox('timetracker'); // Open Hive storage

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TimeEntryProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Time Tracker',
        theme: ThemeData(
          primaryColor: const Color(0xFF009999),
          scaffoldBackgroundColor: const Color.fromARGB(200, 238, 238, 238),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.black,
            foregroundColor: Color(0xFF009999),
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Color(0xFF009999),
          ),
          // Applying Poppins font throughout the app
          textTheme: TextTheme(
            bodyLarge: TextStyle(
              fontFamily: 'Poppins', // Replacing bodyText1 with bodyLarge
            ),
            bodyMedium: TextStyle(
              fontFamily: 'Poppins', // Replacing bodyText2 with bodyMedium
            ),
            headlineLarge: TextStyle(
              fontFamily: 'Poppins', // For large headlines, if needed
            ),
            headlineMedium: TextStyle(
              fontFamily: 'Poppins', // For medium headlines, if needed
            ),
            headlineSmall: TextStyle(
              fontFamily: 'Poppins', // For small headlines, if needed
            ),
            // Add other text styles here as needed
          ),
        ),
        home: const HomeScreen(), // Ensure HomeScreen exists
      ),
    );
  }
}
