import 'package:flutter/material.dart';
import 'screens/add_subject_screen.dart'; // Import the new screen

void main() {
  runApp(SmartStudyApp());
}

class SmartStudyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Study App',
      theme: ThemeData(fontFamily: 'Poppins', primarySwatch: Colors.blue),
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Smart Study')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/study_image.png', height: 150),
            SizedBox(height: 20),
            Text(
              'Welcome to Smart Study!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Subjects',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text('You don\'t have any subjects yet.'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () async {
                // Navigate to the AddSubjectScreen and wait for the result
                final newSubject = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddSubjectScreen()),
                );

                // If a new subject was added, display it
                if (newSubject != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Added subject: $newSubject')),
                  );
                }
              },
              icon: Icon(Icons.add),
              label: Text('Add Subject'),
            ),
          ],
        ),
      ),
    );
  }
}
