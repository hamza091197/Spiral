import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

import 'package:spiral/home_dashboard_screen.dart';

class AuthenticationSuccessfulScreen extends StatefulWidget {
  const AuthenticationSuccessfulScreen({super.key});

  @override
  _AuthenticationSuccessfulScreenState createState() =>
      _AuthenticationSuccessfulScreenState();
}

class _AuthenticationSuccessfulScreenState
    extends State<AuthenticationSuccessfulScreen> {
  @override
  void initState() {
    super.initState();

    // Set a timer to automatically navigate after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Get.off(() => HomeDashboardScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/image.jpg'), // Set your background image here
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.blue[700]!.withOpacity(0.7), // Semi-transparent background
              borderRadius: BorderRadius.circular(20),
            ),
            width: 300,
            height: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Spiral',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.blue[800], // Dark blue surrounding circle
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black,  // Set border color to black
                      width: 5,  // Set the thickness of the border
                    ),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.check_circle,
                      color: Colors.white,
                      size: 80,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                const Text(
                  'Authentication Successful',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Redirecting you to your account',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}