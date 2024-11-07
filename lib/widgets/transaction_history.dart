import 'package:flutter/material.dart';

class TransactionHistoryScreen extends StatelessWidget {
  const TransactionHistoryScreen({super.key});

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
                color: Colors.teal[50], // Light teal background
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Icon(
                Icons.history,
                color: Colors.teal, // Teal history icon
                size: 48.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Transaction History',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Colors.purple[100], // Corrected color assignment
              ),
            ),
          ],
        ),
      ),
    );
  }
}
