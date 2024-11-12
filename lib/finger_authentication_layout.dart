import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil
import 'package:get/get.dart'; // Import GetX
import 'package:spiral/pin_entry_screen.dart';

class FingerAuthenticationLayout extends StatelessWidget {
  const FingerAuthenticationLayout({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil for responsive UI scaling
    ScreenUtil.init(context);

    return Scaffold(
      backgroundColor: Colors.black87, // Background color similar to screenshot
      body: Stack(
        children: [
          // Center content with no header text
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                // No text now
                SizedBox(height: 20),
              ],
            ),
          ),
          // Align the container to the bottom and stretch it horizontally
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              // Use ScreenUtil for horizontal padding
              child: Container(
                height: 300.h, // Make the container height responsive
                padding: EdgeInsets.all(16.w), // Use ScreenUtil for padding
                decoration: BoxDecoration(
                  color: Colors.white,
                  // Rounded only at the top corners
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.w),
                    // Adjust radius for responsiveness
                    topRight: Radius.circular(20.w),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // Center the content vertically
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // Center the content horizontally
                  children: [
                    // Add the "Authentication with Fingerprint" text at the top of the container
                    Text(
                      'Authentication with Fingerprint',
                      style: TextStyle(
                        color: Colors.grey[700],
                        // Darker grey text color for better contrast
                        fontSize: 18.sp,
                        // Use ScreenUtil for responsive font size
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    // Adjust height with ScreenUtil
                    // Center the fingerprint icon
                    Icon(
                      Icons.fingerprint,
                      size: 60.sp, // Use ScreenUtil for responsive icon size
                      color: Colors.blue,
                    ),
                    SizedBox(height: 20.h),
                    // Text now appears below the icon
                    Text(
                      'Place your finger on the sensor to continue',
                      style: TextStyle(
                        fontSize: 14.sp,
                        // Use ScreenUtil for responsive font size
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    TextButton(
                      onPressed: () => Get.to(PinEntryScreen()),
                      // Use Get.to() instead of Navigator.push
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize:
                              16.sp, // Use ScreenUtil for responsive font size
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
