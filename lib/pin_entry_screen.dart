import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:spiral/caller_id_screen.dart';
import 'package:spiral/login_screen.dart';

import 'finger_authentication_layout.dart';

class PinEntryScreen extends StatefulWidget {
  const PinEntryScreen({super.key});

  @override
  _PinEntryScreenState createState() => _PinEntryScreenState();
}

class _PinEntryScreenState extends State<PinEntryScreen> {
  List<String> pin = ["", "", "", ""];
  final LocalAuthentication auth = LocalAuthentication();

  void updatePin(String digit, [bool isDelete = false]) {
    setState(() {
      if (isDelete) {
        pin[pin.lastIndexWhere((e) => e.isNotEmpty)] = "";
      } else {
        pin[pin.indexWhere((e) => e.isEmpty)] = digit;
      }
    });
  }

  void _onSubmit() {
    if (pin.contains("")) {
      Get.snackbar(
        'Incomplete Pin',
        'Please enter all 4 digits.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: Duration(seconds: 2),
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.all(10),
      );
    } else {
      Get.to(() => CallerIDScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil to scale the UI based on screen size
    ScreenUtil.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.to(() => LoginScreen()),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildAvatar(),
            SizedBox(height: 16.h),
            _buildUserInfo(),
            SizedBox(height: 24.h),
            _buildPinDisplay(),
            SizedBox(height: 24.h),
            _buildSubmitButton(),
            SizedBox(height: 24.h),
            _buildKeypad(),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    return Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: const [Colors.blue, Colors.purple, Colors.pink],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: 70,
          height: 70,
          color: Colors.white,
          child: Image.asset(
            'images/person_four.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildUserInfo() {
    return Column(
      children: const [
        Text('Jane Doe Matthews',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Text('0712364748', style: TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget _buildPinDisplay() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(4, (index) {
        return Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8.0),
            color: pin[index].isNotEmpty ? Colors.blue[100] : Colors.white,
          ),
          child: Center(
            child: Text(
              pin[index],
              style: TextStyle(fontSize: 20.sp, color: Colors.black),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildSubmitButton() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue[900]!, Colors.black],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ElevatedButton(
        onPressed: _onSubmit,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 48.h),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Text(
          'Enter Pin',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildKeypad() {
    return Column(
      children: [
        for (int i = 0; i < 3; i++)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(3, (j) {
              int number = i * 3 + j + 1;
              return _buildNumberButton(number.toString());
            }),
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(width: 60.w),
            _buildNumberButton("0"),
            IconButton(
              onPressed: () {
                Get.to(() => FingerAuthenticationLayout());
              },
              icon: Icon(Icons.fingerprint, size: 30.sp, color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNumberButton(String number) {
    return GestureDetector(
      onTap: () {
        if (pin.contains("")) updatePin(number);
      },
      child: Container(
        width: 60.w,
        height: 60.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[200],
        ),
        child: Center(
          child: Text(
            number,
            style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}