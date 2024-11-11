import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil
import 'package:spiral/widgets/appointment_card.dart';
import 'package:spiral/widgets/category_filter.dart';
import 'package:spiral/widgets/financial_services.dart';
import 'package:spiral/widgets/frequently_used.dart';
import 'package:spiral/widgets/story.dart';

class HomeDashboardScreen extends StatelessWidget {
  const HomeDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil to scale the UI based on screen size
    ScreenUtil.init(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.w), // Use .w for scaling width
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section with "Good Morning, Jane" and profile image
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Good Morning,",
                        style: TextStyle(
                          fontSize: 24.sp, // Use .sp for scaling font size
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "Jane",
                        style: TextStyle(
                          fontSize: 24.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  // Profile Section with Profile Image
                  GestureDetector(
                    onTap: () {
                      _openImageDialog(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(2.5.w), // Scale padding
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: const [
                            Colors.blue,
                            Colors.purple,
                            Colors.pink
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 25.r, // Use .r for scaling radius
                        backgroundImage: AssetImage('images/person_four.png'),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h), // Scale height

              // Story
              StoryWidget(),
              // Appointment Card
              AppointmentCard(),
              SizedBox(height: 20.h), // Scale height

              // Category Filter
              CategoryFilter(),
              SizedBox(height: 20.h), // Scale height

              // Frequently Used Services
              FrequentlyUsed(),
              SizedBox(height: 20.h), // Scale height

              // Financial Services
              FinancialServices(),
            ],
          ),
        ),
      ),
    );
  }

  // Function to open the image in a dialog with a loader
  void _openImageDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true, // Allows closing dialog by tapping outside
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context); // Close the dialog when tapping anywhere
            },
            child: Center(
              child: ImageDialogWithLoader(), // Custom widget for image and loader
            ),
          ),
        );
      },
    );
  }
}

class ImageDialogWithLoader extends StatefulWidget {
  @override
  _ImageDialogWithLoaderState createState() => _ImageDialogWithLoaderState();
}

class _ImageDialogWithLoaderState extends State<ImageDialogWithLoader> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Set the loader to disappear after 2 seconds
    Future.delayed(Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (_isLoading)
          CircularProgressIndicator() // Show loader
        else
          Image.asset('images/person_four.png'), // Show image after loader

        if (_isLoading)
          SizedBox(height: 10.h), // Space between loader and image if loading
      ],
    );
  }
}