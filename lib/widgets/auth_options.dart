import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:spiral/passkey_sign_in_screen.dart';

class AuthOptions extends StatefulWidget {
  const AuthOptions({super.key});

  @override
  AuthOptionsState createState() => AuthOptionsState();
}

class AuthOptionsState extends State<AuthOptions> {
  final LocalAuthentication auth = LocalAuthentication();

  bool isFingerprintAvailable = false;

  @override
  void initState() {
    super.initState();
    checkBiometricAvailability();
  }

  Future<void> checkBiometricAvailability() async {
    bool canAuthenticate = await auth.isDeviceSupported();
    if (canAuthenticate) {
      // Get the available biometrics enrolled
      List<BiometricType> availableBiometrics =
          await auth.getAvailableBiometrics();

      setState(() {
        // Check if biometrics are available
        isFingerprintAvailable = availableBiometrics.isNotEmpty &&
            (availableBiometrics.contains(BiometricType.strong) ||
                availableBiometrics.contains(BiometricType.face));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(  // Wrap the whole column with SingleChildScrollView
      child: Column(
        children: [
          ElevatedButton.icon(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PasskeySignInScreen()), // Navigating to PinEntryScreen
            ),
            icon: const Icon(Icons.fingerprint, color: Colors.black),
            label: const Text(
              'Sign in with Fingerprint',
              style: TextStyle(color: Colors.black), // Text color set to black
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              // Background color set to white
              padding: const EdgeInsets.symmetric(vertical: 14),
              minimumSize: const Size(300, 50),
              // Sets width to 300 and height to 50
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const SizedBox(height: 7),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Google Icon Button with rectangular style
              Container(
                decoration: BoxDecoration(
                  color: Colors.white, // White background
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                  border: Border.all(
                    color: Colors.black, // Border color
                    width: 1, // Thin border width
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Image.asset(
                      'images/google.png',
                      // Google logo (add the image to assets)
                      width: 100,
                      height: 20,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              // GitHub Icon Button with rectangular style
              Container(
                decoration: BoxDecoration(
                  color: Colors.white, // White background
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                  border: Border.all(
                    color: Colors.black, // Border color
                    width: 1, // Thin border width
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Image.asset(
                      'images/github.png',
                      // GitHub logo (add the image to assets)
                      width: 100,
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
