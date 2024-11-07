import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spiral/login_screen.dart';
import 'package:spiral/widgets/login_button.dart'; // Import LoginButton

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>(); // Key for form validation
  String? email, phoneNumber, career, address;
  bool emailValid = true,
      phoneValid = true,
      careerValid = true,
      addressValid = true;

  final emailRegEx = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zAZ0-9.-]+\.[a-zA-Z]{2,}$");
  final phoneRegEx = RegExp(r"^\+?[0-9]{10,13}$");

  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    phoneController.addListener(() {
      // Prepend '+' if it's not there already
      if (!phoneController.text.startsWith('+')) {
        String text = phoneController.text;
        if (text.isNotEmpty) {
          phoneController.text = '+$text';
          phoneController.selection = TextSelection.fromPosition(
              TextPosition(offset: phoneController.text.length));
        }
      }
    });
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          ),
        ),
        title: Text(
          'Edit Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true, // This centers the title in the AppBar
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: _buildAvatar(),
                ),
                SizedBox(height: 16),
                Text(
                  'Jane Doe',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(bottom: 32.0),
                  child: Text(
                    'Developer',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(height: 32),
                _buildTextField(
                  label: 'Your Email',
                  hint: 'jane@gmail.com',
                  icon: Icons.mail,
                  isEmail: true,
                  onChanged: (value) => email = value,
                  isValid: emailValid,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please fill out this field';
                    }
                    if (!emailRegEx.hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                // Email input
                _buildPhoneTextField(),
                // Phone number input
                _buildTextField(
                  label: 'Career',
                  hint: 'Developer',
                  onChanged: (value) => career = value,
                  isValid: careerValid,
                ),
                _buildTextField(
                  label: 'Address',
                  hint: 'Nairobi',
                  icon: Icons.location_on,
                  onChanged: (value) => address = value,
                  isValid: addressValid,
                ),
                SizedBox(height: 32),
                // Using the LoginButton widget here with custom text "Save Changes"
                LoginButton(
                  buttonText: 'Save Changes', // Add the text parameter
                  onPressed: () {
                    // Trigger form validation
                    setState(() {
                      emailValid = email != null && email!.isNotEmpty;
                      phoneValid =
                          phoneNumber != null && phoneNumber!.isNotEmpty;
                      careerValid = career != null && career!.isNotEmpty;
                      addressValid = address != null && address!.isNotEmpty;
                    });

                    if (_formKey.currentState!.validate()) {
                      // Save changes if form is valid
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Changes saved successfully!')),
                      );

                      // Navigate to the Login screen after saving changes
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    }
                  },
                ),
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
              colors: const [Colors.blue, Colors.purple, Colors.pink],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: 80,
              height: 80,
              color: Colors.white,
              child: Image.asset(
                'images/person_one.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: CircleAvatar(
            radius: 12,
            backgroundColor: Colors.orange,
            child: Icon(
              Icons.edit,
              color: Colors.white,
              size: 14,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    IconData? icon,
    bool isNumeric = false,
    bool isEmail = false,
    int? maxLength, // Maximum length parameter
    required ValueChanged<String> onChanged,
    required bool isValid, // Check if the field is valid
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: isValid ? Colors.grey : Colors.red, // Set border color
              width: 1,
            ),
          ),
          child: TextFormField(
            onChanged: onChanged,
            keyboardType: isEmail
                ? TextInputType.emailAddress // Email-specific keyboard
                : isNumeric
                    ? TextInputType.numberWithOptions(
                        decimal: false) // Numeric keypad
                    : TextInputType.text,
            // Default keyboard for non-numeric fields
            inputFormatters: [
              if (isNumeric) FilteringTextInputFormatter.digitsOnly,
              // Allow only digits
              if (maxLength != null)
                LengthLimitingTextInputFormatter(maxLength),
              // Limit input length
            ],
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                fontWeight: FontWeight.w300,
                color: Colors.grey[500],
              ),
              prefixIcon:
                  icon != null ? Icon(icon, color: Colors.grey[500]) : null,
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            ),
            validator: validator,
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }

  Widget _buildPhoneTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Phone Number',
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: phoneValid ? Colors.grey : Colors.red, // Set border color
              width: 1,
            ),
          ),
          child: TextFormField(
            controller: phoneController,
            keyboardType: TextInputType.phone,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(13),
            ],
            decoration: InputDecoration(
              hintText: '+254182729202',
              hintStyle: TextStyle(
                fontWeight: FontWeight.w300,
                color: Colors.grey[500],
              ),
              prefixIcon: Icon(
                Icons.phone,
                color: Colors.grey[500],
              ),
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please fill out this field';
              }
              if (!phoneRegEx.hasMatch(value)) {
                return 'Please enter a valid phone number';
              }
              return null;
            },
            onChanged: (value) => phoneNumber = value,
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
