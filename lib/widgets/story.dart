import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoryWidget extends StatelessWidget {
  final List<Map<String, String>> stories = [
    {"name": "My Story", "image": "images/person_six.png"},
    {"name": "Selena", "image": "images/person_one.png"},
    {"name": "Clara", "image": "images/person_three.png"},
    {"name": "Fabian", "image": "images/person_seven.png"},
    {"name": "George", "image": "images/person_five.png"},
    // Add more stories as needed
  ];

  StoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil for screen scaling
    ScreenUtil.init(context, designSize: Size(360, 690), minTextAdapt: true);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // Enable horizontal scrolling
      padding: EdgeInsets.zero, // Removed left padding, keep right padding
      child: Row(
        children: _buildStoryItems(context),
      ),
    );
  }

  List<Widget> _buildStoryItems(BuildContext context) {
    List<Widget> storyWidgets = [];
    // Get the screen width using ScreenUtil
    double screenWidth = MediaQuery.of(context).size.width;

    // Determine how many stories per row depending on the screen width
    int storiesPerRow = 5; // Default for larger screens
    if (screenWidth < 600) {
      storiesPerRow = 3; // Mobile
    } else if (screenWidth < 1200) {
      storiesPerRow = 4; // Tablet
    }

    for (int i = 0; i < stories.length; i++) {
      storyWidgets.add(_buildStoryItem(stories[i]));
      if ((i + 1) % storiesPerRow == 0) {
        storyWidgets.add(
            SizedBox(width: 16.w)); // Add space after every row (responsive)
      }
    }
    return storyWidgets;
  }

  Widget _buildStoryItem(Map<String, String> story) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w), // Responsive padding
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                padding: EdgeInsets.all(3.h), // Border thickness (responsive)
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.blue, width: 2.w),
                ),
                child: CircleAvatar(
                  radius: 32.r, // Responsive radius for avatar
                  backgroundImage: AssetImage(story['image']!),
                ),
              ),
              if (story['name'] ==
                  "My Story") // Add "+" icon to "My Story" only
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: CircleAvatar(
                    radius: 10.r, // Responsive radius for "+" icon
                    backgroundColor: Colors.blue,
                    child: Icon(
                      Icons.add,
                      size: 14.sp, // Responsive size for icon
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: 8.h), // Responsive height between story and name
          Text(
            story['name']!,
            style: TextStyle(fontSize: 12.sp), // Responsive font size
          ),
        ],
      ),
    );
  }
}
