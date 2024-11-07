import 'package:flutter/material.dart';

class BankTransferScreen extends StatelessWidget {
  const BankTransferScreen({super.key});

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
                color: Colors.purple[50], // Light purple background
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Icon(
                Icons.account_balance,
                color: Colors.yellow[100]!, // Corrected color assignment
                size: 48.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Bank Transfer',
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
    home: BankTransferScreen(),
  ));
}
