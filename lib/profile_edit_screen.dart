import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil
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
      if (!phoneController.text.startsWith('+') &&
          phoneController.text.isNotEmpty) {
        phoneController.text = '+${phoneController.text}';
        phoneController.selection =
            TextSelection.collapsed(offset: phoneController.text.length);
      }
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
      padding: EdgeInsets.only(bottom: 16.0.h), // Scale bottom padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontSize: 14.sp, color: Colors.grey)),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(color: isValid ? Colors.grey : Colors.red, width: 1),
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
                hintStyle: TextStyle(fontWeight: FontWeight.w300, color: Colors.grey[500]),
                prefixIcon: icon != null ? Icon(icon, color: Colors.grey[500]) : null,
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 12.0.h, horizontal: 16.0.w), // Scale padding
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
    // Initialize ScreenUtil to scale the UI based on screen size
    ScreenUtil.init(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.to(() => CallerIDScreen()),
        ),
        title: Text('Edit Profile', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0.w), // Scale padding
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _buildAvatar(),
                SizedBox(height: 16.h), // Scale height
                Text('Jane Doe', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
                SizedBox(height: 8.h), // Scale height
                Text('Developer', style: TextStyle(color: Colors.grey)),
                SizedBox(height: 32.h), // Scale height
                _buildTextField(
                  label: 'Email',
                  hint: 'jane@gmail.com',
                  icon: Icons.mail,
                  isEmail: true,
                  onChanged: (value) => email = value,
                  isValid: emailValid,
                  validator: (value) => value!.isEmpty
                      ? 'Email field is required'
                      : (emailRegEx.hasMatch(value) ? null : 'Please enter a valid email address'),
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
                      : (phoneRegEx.hasMatch(value) ? null : 'Please enter a valid phone number'),
                ),
                _buildTextField(
                  label: 'Career',
                  hint: 'Developer',
                  onChanged: (value) => career = value,
                  isValid: careerValid,
                  validator: (value) => value!.isEmpty ? 'Career field is required' : null,
                ),
                _buildTextField(
                  label: 'Address',
                  hint: 'Nairobi',
                  icon: Icons.location_on,
                  onChanged: (value) => address = value,
                  isValid: addressValid,
                  validator: (value) => value!.isEmpty ? 'Address field is required' : null,
                ),
                SizedBox(height: 20.h), // Scale height
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
          padding: EdgeInsets.all(4.w), // Scale padding
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(12.r), // Scale radius
            gradient: LinearGradient(
              colors: const [Colors.blue, Colors.purple, Colors.pink],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.r), // Scale radius
            child: Container(
              width: 80.w, // Scale width
              height: 80.h, // Scale height
              color: Colors.white,
              child: Image.asset(
                'images/person_one.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0.h, // Scale bottom positioning
          right: 0.w, // Scale right positioning
          child: CircleAvatar(
            radius: 12.r, // Scale radius
            backgroundColor: Colors.orange,
            child: Icon(
              Icons.edit,
              color: Colors.white,
              size: 14.sp, // Scale icon size
            ),
          ),
        ),
      ],
    );
  }
}