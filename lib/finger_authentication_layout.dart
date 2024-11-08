import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX
import 'package:spiral/pin_entry_screen.dart';

class FingerAuthenticationLayout extends StatelessWidget {
  const FingerAuthenticationLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87, // Background color similar to screenshot
      body: Stack(
        children: [
          // Center content with no header text
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                // No text now
                SizedBox(height: 20),
              ],
            ),
          ),
          // Align the container to the bottom and stretch it horizontally
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                height: 300, // Increased height for the container
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  // Rounded only at the top corners
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, // Center the content vertically
                  crossAxisAlignment: CrossAxisAlignment.center, // Center the content horizontally
                  children: [
                    // Add the "Authentication with Fingerprint" text at the top of the container
                    Text(
                      'Authentication with Fingerprint',
                      style: TextStyle(
                        color: Colors.grey[700], // Darker grey text color for better contrast
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    // Center the fingerprint icon
                    Icon(
                      Icons.fingerprint,
                      size: 60,
                      color: Colors.blue,
                    ),
                    SizedBox(height: 20),
                    // Text now appears below the icon
                    Text(
                      'Place your finger on the sensor to continue',
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                    SizedBox(height: 20),
                    TextButton(
                      onPressed: () => Get.to(PinEntryScreen()), // Use Get.to() instead of Navigator.push
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}