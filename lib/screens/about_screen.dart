import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About 🍓',
          style: TextStyle(color: Color.fromARGB(255, 5, 119, 9)),
        ),
        backgroundColor: const Color.fromARGB(255, 233, 113, 153),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Purpose of the App:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('To manage your tasks easily and efficiently!'),
            SizedBox(height: 16),
            Text(
              'Reason for Development:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Mobile Development Midterm Project :>'),
            SizedBox(height: 16),
            Text(
              'By:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Gab Angela Indino 🎀'),
          ],
        ),
      ),
    );
  }
}
