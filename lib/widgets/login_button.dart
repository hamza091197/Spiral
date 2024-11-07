import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String buttonText; // Add buttonText parameter for custom text
  final VoidCallback onPressed; // onPressed parameter

  const LoginButton({super.key, required this.onPressed, required this.buttonText}); // Make buttonText required

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Makes the button take up the full width
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue[900]!, Colors.black], // Gradient from blue to black
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ElevatedButton(
        onPressed: onPressed, // Use the onPressed callback here
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent, // Make button background transparent
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Center(
          child: Text(
            buttonText, // Display the custom buttonText
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
