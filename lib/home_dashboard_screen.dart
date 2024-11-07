import 'package:flutter/material.dart';
import 'package:spiral/widgets/appointment_card.dart';
import 'package:spiral/widgets/category_filter.dart';
import 'package:spiral/widgets/financial_services.dart';
import 'package:spiral/widgets/frequently_used.dart';
import 'package:spiral/widgets/story.dart';

class HomeDashboardScreen extends StatelessWidget {
  const HomeDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section with "Good Morning, Jane" and profile image
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Good Morning,",
                        style: TextStyle(fontSize: 24, color: Colors.black),
                      ),
                      Text(
                        "Jane",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  // Profile Section with Profile Image and an additional decorative image
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      // Decorative image behind the profile image
                      Positioned(
                        left: -5,
                        top: -5,
                        child: Container(
                          height: 50, // Adjust the size of the image
                          width: 50,  // Adjust the size of the image
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/decorative_image.png'), // Add the image path
                              fit: BoxFit.cover,
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),

                      // Profile Image with Gradient Border
                      Container(
                        padding: EdgeInsets.all(2.5), // Space for gradient border
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: const [Colors.blue, Colors.purple, Colors.pink],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 25, // Size of the profile picture
                          backgroundImage: AssetImage('images/person_four.png'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Story
              StoryWidget(),
              // Appointment Card
              AppointmentCard(),
              SizedBox(height: 20),

              // Category Filter
              CategoryFilter(),
              SizedBox(height: 20),

              // Frequently Used Services
              FrequentlyUsed(),
              SizedBox(height: 20),

              // Financial Services
              FinancialServices(),
            ],
          ),
        ),
      ),
    );
  }
}
