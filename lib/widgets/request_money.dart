import 'package:flutter/material.dart';

class RequestMoneyScreen extends StatelessWidget {
  const RequestMoneyScreen({super.key});

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
                color: Colors.orange[50], // Light orange background
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Icon(
                Icons.request_page,
                color: Colors.blue[100]!, // Corrected color assignment
                size: 48.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Request Money',
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
