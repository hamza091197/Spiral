import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spiral/login_screen.dart';
import 'package:spiral/pin_entry_screen.dart';
import 'package:spiral/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAm15W_gX-ZGpRBgZqVA8QEj5lir0ZC3lQ",
          authDomain: "spiral-f023e.firebaseapp.com",
          projectId: "spiral-f023e",
          storageBucket: "spiral-f023e.firebasestorage.app",
          messagingSenderId: "82621912352",
          appId: "1:82621912352:web:d3aa15eff463b890b63345"
      ),
    );
    print("Firebase initialized successfully");
  } catch (e) {
    print("Error initializing Firebase: $e");
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spiral Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}