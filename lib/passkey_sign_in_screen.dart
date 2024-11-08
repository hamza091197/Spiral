import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX
import 'package:spiral/login_screen.dart';
import 'authentication_successful_screen.dart'; // Import the success screen

class PasskeySignInScreen extends StatelessWidget {
  const PasskeySignInScreen({super.key});

  void _onSignInWithPasskey(BuildContext context) {
    // Navigate to the Authentication Successful screen using GetX
    Get.to(() => const AuthenticationSuccessfulScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/image.jpg'), // Use the same image as in LoginScreen
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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Passkey Sign in',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Place your finger on the sensor to continue',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 40),
                Center(
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.blue[800],
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black,  // Set border color to black
                        width: 5,  // Set the thickness of the border
                      ),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.fingerprint,
                        color: Colors.white,
                        size: 80,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Center(
                  child: ElevatedButton(
                    onPressed: () => _onSignInWithPasskey(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[800],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                    ),
                    child: const Text(
                      'Sign in with Passkey',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () => Get.to(() => LoginScreen()), // Use GetX for navigation
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: const Size(200, 50),
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}