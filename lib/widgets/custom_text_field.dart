import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final bool isPassword;
  final TextEditingController controller; // Controller for text input
  final String? Function(String?)? validator; // Validator function for validation
  final TextInputType? keyboardType; // Optional keyboardType for custom input types
  final Widget? suffixIcon; // Optional suffix icon for extra functionality

  const CustomTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller, // Adding controller as a required parameter
    this.isPassword = false,
    this.validator, // Adding validator as a required parameter
    this.keyboardType, // Add this line to support keyboardType
    this.suffixIcon, // Add suffixIcon parameter
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white), // Label color remains white
        ),
        TextFormField(
          controller: controller, // Using the controller to manage the text input
          obscureText: isPassword, // Use obscureText to hide text for password fields
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            filled: true,
            fillColor: Colors.white, // Set background color to white
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.red), // Red border on error
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.red), // Red border on error
            ),
            suffixIcon: suffixIcon, // Set the suffixIcon here
          ),
          style: const TextStyle(color: Colors.black), // Text color set to black for readability
          validator: validator, // Attach the validator function
          keyboardType: keyboardType, // Pass the keyboardType to the TextFormField
        ),
        // Error message is automatically shown below the TextFormField if validation fails
      ],
    );
  }
}
