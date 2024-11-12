import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:spiral/login_screen.dart';
import 'package:spiral/widgets/login_button.dart';

import 'caller_id_screen.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  String? email, phoneNumber, career, address;
  bool emailValid = true,
      phoneValid = true,
      careerValid = true,
      addressValid = true;

  final emailRegEx =
      RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
  final phoneRegEx = RegExp(r"^\+?[0-9]{10,13}$");

  @override
  void initState() {
    super.initState();
    phoneController.addListener(() {
      // Automatically adds '+' if not present and ensures the length does not exceed 13 characters
      if (!phoneController.text.startsWith('+') &&
          phoneController.text.isNotEmpty) {
        phoneController.text = '+${phoneController.text}';
        phoneController.selection =
            TextSelection.collapsed(offset: phoneController.text.length);
      }
      // Limit the phone number to 13 digits (including '+')
      if (phoneController.text.length > 13) {
        phoneController.text = phoneController.text.substring(0, 13);
        phoneController.selection =
            TextSelection.collapsed(offset: phoneController.text.length);
      }
    });
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  void _validateAndSave() {
    setState(() {
      emailValid = email?.isNotEmpty ?? false;
      phoneValid = phoneNumber?.isNotEmpty ?? false;
      careerValid = career?.isNotEmpty ?? false;
      addressValid = address?.isNotEmpty ?? false;
    });

    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Changes saved successfully!')),
      );
      // Use GetX for navigation
      Get.to(() => LoginScreen());
    }
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    IconData? icon,
    bool isNumeric = false,
    bool isEmail = false,
    required ValueChanged<String> onChanged,
    required bool isValid,
    required String? Function(String?) validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontSize: 14, color: Colors.grey)),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(
                  color: isValid ? Colors.grey : Colors.red, width: 1),
            ),
            child: TextFormField(
              onChanged: onChanged,
              keyboardType: isEmail
                  ? TextInputType.emailAddress
                  : isNumeric
                      ? TextInputType.numberWithOptions(decimal: false)
                      : TextInputType.text,
              inputFormatters: isNumeric
                  ? [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(13),
                    ]
                  : [],
              controller: icon == Icons.phone ? phoneController : null,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(
                    fontWeight: FontWeight.w300, color: Colors.grey[500]),
                prefixIcon:
                    icon != null ? Icon(icon, color: Colors.grey[500]) : null,
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              ),
              validator: validator,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () =>
              Get.to(() => CallerIDScreen()), // Use GetX for navigation
        ),
        title:
            Text('Edit Profile', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _buildAvatar(),
                SizedBox(height: 16),
                Text('Jane Doe',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text('Developer', style: TextStyle(color: Colors.grey)),
                SizedBox(height: 32),
                _buildTextField(
                  label: 'Email',
                  hint: 'jane@gmail.com',
                  icon: Icons.mail,
                  isEmail: true,
                  onChanged: (value) => email = value,
                  isValid: emailValid,
                  validator: (value) => value!.isEmpty
                      ? 'Email field is required'
                      : (emailRegEx.hasMatch(value)
                          ? null
                          : 'Please enter a valid email address'),
                ),
                _buildTextField(
                  label: 'Phone Number',
                  hint: '+254182729202',
                  icon: Icons.phone,
                  isNumeric: true,
                  onChanged: (value) => phoneNumber = value,
                  isValid: phoneValid,
                  validator: (value) => value!.isEmpty
                      ? 'Phone Number field is required'
                      : (phoneRegEx.hasMatch(value)
                          ? null
                          : 'Please enter a valid phone number'),
                ),
                _buildTextField(
                  label: 'Career',
                  hint: 'Developer',
                  onChanged: (value) => career = value,
                  isValid: careerValid,
                  validator: (value) =>
                      value!.isEmpty ? 'Career field is required' : null,
                ),
                _buildTextField(
                  label: 'Address',
                  hint: 'Nairobi',
                  icon: Icons.location_on,
                  onChanged: (value) => address = value,
                  isValid: addressValid,
                  validator: (value) =>
                      value!.isEmpty ? 'Address field is required' : null,
                ),
                SizedBox(height: 32),
                LoginButton(
                    buttonText: 'Save Changes', onPressed: _validateAndSave),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple, Colors.pink],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'images/person_one.png',
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: CircleAvatar(
            radius: 12,
            backgroundColor: Colors.orange,
            child: Icon(Icons.edit, color: Colors.white, size: 14),
          ),
        ),
      ],
    );
  }
}
