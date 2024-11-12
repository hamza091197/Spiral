import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil
import 'package:get/get.dart'; // Import GetX
import 'package:spiral/pin_entry_screen.dart';
import 'package:spiral/profile_edit_screen.dart';

class CallerIDScreen extends StatelessWidget {
  const CallerIDScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil for responsive UI scaling
    ScreenUtil.init(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.to(
              PinEntryScreen()), // Replace Navigator.push with Get.to() for navigating to EditProfileScreen
        ),
        title: Text(
          'Caller ID',
          style: TextStyle(
              fontSize: 18.sp), // Use ScreenUtil for font size scaling
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => Get.to(
                EditProfileScreen()), // Replace Navigator.push with Get.to() for navigating to EditProfileScreen
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w), // Use ScreenUtil for padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PlaceholderLine(widthFactor: 0.9),
            SizedBox(height: 10.h), // Use ScreenUtil for spacing
            PlaceholderBox(height: 100.h), // Use ScreenUtil for height
            SizedBox(height: 20.h),
            PlaceholderLine(widthFactor: 0.8),
            SizedBox(height: 10.h),
            PlaceholderLine(widthFactor: 0.85),
            SizedBox(height: 10.h),
            PlaceholderLine(widthFactor: 0.75),
            SizedBox(height: 10.h),
            PlaceholderLine(widthFactor: 0.9),
            SizedBox(height: 10.h),
            PlaceholderLine(widthFactor: 0.8),
          ],
        ),
      ),
    );
  }
}

class PlaceholderLine extends StatelessWidget {
  final double widthFactor;

  const PlaceholderLine({super.key, required this.widthFactor});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: widthFactor,
      child: Container(
        height: 20.h, // Use ScreenUtil for height scaling
        color: Colors.grey[300],
      ),
    );
  }
}

class PlaceholderBox extends StatelessWidget {
  final double height;

  const PlaceholderBox({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h, // Use ScreenUtil for height scaling
      color: Colors.grey[300],
    );
  }
}
