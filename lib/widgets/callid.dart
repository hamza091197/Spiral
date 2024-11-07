import 'package:flutter/material.dart';

class CallerIdScreen extends StatelessWidget {
  const CallerIdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.green[50], // Light green background for the icon
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Icon(
                Icons.call,
                color: Colors.green, // Green phone icon
                size: 48.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Caller ID',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Colors.grey[800],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CallerIdScreen(),
  ));
}
