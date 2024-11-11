import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spiral/pin_entry_screen.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w), // Responsive padding
      height: 150.h, // Responsive height
      decoration: BoxDecoration(
        color: Colors.lightBlue,
        borderRadius: BorderRadius.circular(16.r), // Responsive border radius
      ),
      child: Stack(
        children: [
          // Column for Avatar, Doctor Name, Date, and Time
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row for Avatar and Doctor Name
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('images/person_two.png'),
                    radius: 30.r, // Responsive radius for avatar
                  ),
                  SizedBox(width: 16.w), // Responsive space between avatar and name
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dr. A Syahir",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16.sp, // Responsive font size
                        ),
                      ),
                      Text(
                        "General Doctor",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp, // Responsive font size
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 8.h), // Responsive space between elements
              // Lighter White Divider line
              Container(
                height: 1.h, // Responsive height for divider
                color: Colors.white.withOpacity(0.4),
                margin: EdgeInsets.symmetric(vertical: 10.h), // Responsive margin
              ),
              // Row for Date and Time horizontally
              Row(
                children: [
                  Icon(Icons.calendar_today, size: 14.sp, color: Colors.white),
                  SizedBox(width: 8.w),
                  Text(
                    "Sunday, 12 June",
                    style: TextStyle(fontSize: 14.sp, color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(width: 16.w), // Responsive space between date and time
                  Icon(Icons.access_time, size: 14.sp, color: Colors.white),
                  SizedBox(width: 8.w),
                  Text(
                    "9:00 - 12:00 AM",
                    style: TextStyle(fontSize: 14.sp, color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
          // Arrow icon placed at the top-right corner using Positioned widget
          Positioned(
            top: 1.h, // Responsive top distance
            right: 1.w, // Responsive right distance
            child: IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 20.sp, // Responsive icon size
              ),
              onPressed: () {
                // Navigate to the PinEntryScreen when the icon is pressed using GetX
                Get.to(() => PinEntryScreen());
              },
            ),
          ),
        ],
      ),
    );
  }
}