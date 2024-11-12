import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double progress = 0.0;

  @override
  void initState() {
    super.initState();
    _simulateLoading();
  }

  // Method to simulate loading progress
  void _simulateLoading() async {
    for (double i = 0.0; i <= 1.0; i += 0.01) {
      await Future.delayed(const Duration(milliseconds: 100));
      setState(() {
        progress = i;
      });
    }
    // After the progress is complete, navigate to the LoginScreen
    Get.off(() => LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // Customize background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Spiral App',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            // LinearProgressIndicator to show the loading progress
            LinearProgressIndicator(
              value: progress,
              color: Colors.white,
              backgroundColor: Colors.blue.shade200,
            ),
            SizedBox(height: 20),
            // Optionally show the progress percentage
            Text(
              '${(progress * 100).toInt()}%',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
