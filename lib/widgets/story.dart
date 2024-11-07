import 'package:flutter/material.dart';

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
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: stories.map((story) => _buildStoryItem(story)).toList(),
      ),
    );
  }

  Widget _buildStoryItem(Map<String, String> story) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                padding: EdgeInsets.all(3), // Border thickness
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.blue, width: 2),
                ),
                child: CircleAvatar(
                  radius: 32,
                  backgroundImage: AssetImage(story['image']!),
                ),
              ),
              if (story['name'] == "My Story") // Add "+" icon to "My Story" only
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.blue,
                    child: Icon(
                      Icons.add,
                      size: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            story['name']!,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
