import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth
import 'package:spiral/widgets/auth_options.dart';
import 'package:spiral/widgets/custom_text_field.dart';
import 'package:spiral/widgets/login_button.dart';
import 'home_dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _isPasswordVisible = false.obs;

  // Login or sign up with Firebase
  Future<void> _validateAndLogin() async {
    if (_formKey.currentState?.validate() ?? false) {
      try {
        // Print email and password for debugging
        print("Email: ${_emailController.text.trim()}");
        print("Password: ${_passwordController.text}");

        final userCredential = await _auth.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text,
        );
        if (userCredential.user != null) {
          Get.offAll(() => HomeDashboardScreen());
        }
      } on FirebaseAuthException catch (e) {
        // Specific error handling
        print("Firebase Auth Error: ${e.message}");

        if (e.code == 'user-not-found' || e.code == 'wrong-password') {
          final userCredential = await _auth.createUserWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text,
          );
          if (userCredential.user != null) {
            Get.offAll(() => HomeDashboardScreen());
          }
        } else {
          print("Error: ${e.message}");
        }
      } catch (e) {
        print("Unexpected Error: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/image.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24.0),
                  decoration: BoxDecoration(
                    color: Colors.blue[700]!.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: const Text(
                          'Spiral',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        controller: _emailController,
                        label: 'Email',
                        hintText: 'john@spiral.com',
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!RegExp(
                              r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                              .hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      Obx(() => CustomTextField(
                        controller: _passwordController,
                        label: 'Password',
                        hintText: 'Password',
                        isPassword: !_isPasswordVisible.value,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            _isPasswordVisible.value = !_isPasswordVisible.value;
                          },
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      )),
                      const SizedBox(height: 16),
                      LoginButton(
                        onPressed: _validateAndLogin,
                        buttonText: 'Sign in',
                      ),
                      const SizedBox(height: 16),
                      const Center(
                        child: Text(
                          'or choose',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const AuthOptions(),
                      const SizedBox(height: 16),
                      Text.rich(
                        TextSpan(
                          text: "Don't have an account yet? ",
                          style: const TextStyle(color: Colors.white),
                          children: [
                            TextSpan(
                              text: 'Signup for free',
                              style: TextStyle(color: Colors.blue[200]),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}