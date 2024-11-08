import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX
import 'package:spiral/profile_edit_screen.dart';
import 'pin_entry_screen.dart'; // Import the PinEntryScreen class

class CallerIDScreen extends StatelessWidget {
  const CallerIDScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(), // Replace Navigator.push with Get.back() for back navigation
        ),
        title: Text('Caller ID'),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => Get.to(EditProfileScreen()), // Replace Navigator.push with Get.to() for navigating to EditProfileScreen
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            PlaceholderLine(widthFactor: 0.9),
            SizedBox(height: 10),
            PlaceholderBox(height: 100),
            SizedBox(height: 20),
            PlaceholderLine(widthFactor: 0.8),
            SizedBox(height: 10),
            PlaceholderLine(widthFactor: 0.85),
            SizedBox(height: 10),
            PlaceholderLine(widthFactor: 0.75),
            SizedBox(height: 10),
            PlaceholderLine(widthFactor: 0.9),
            SizedBox(height: 10),
            PlaceholderLine(widthFactor: 0.8),
          ],
        ),
      ),
    );
  }
}

class PlaceholderLine extends StatelessWidget {
  final double widthFactor;

  const PlaceholderLine({super.key, required this.widthFactor});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: widthFactor,
      child: Container(
        height: 20,
        color: Colors.grey[300],
      ),
    );
  }
}

class PlaceholderBox extends StatelessWidget {
  final double height;

  const PlaceholderBox({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: Colors.grey[300],
    );
  }
}