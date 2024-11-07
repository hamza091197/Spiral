import 'package:flutter/material.dart';
import 'package:spiral/pin_entry_screen.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      height: 150, // Adjusted height for the container
      decoration: BoxDecoration(
        color: Colors.lightBlue,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          // Column for Avatar, Doctor Name, Date, and Time
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row for Avatar and Doctor Name
              Row(
                children: const [
                  CircleAvatar(
                    backgroundImage: AssetImage('images/person_two.png'),
                    radius: 30,
                  ),
                  SizedBox(width: 16), // Space between avatar and name
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dr. A Syahir",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Set text color to white
                        ),
                      ),
                      Text(
                        "General Doctor",
                        style: TextStyle(
                          color: Colors.white, // Set text color to white
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 8),
              // Lighter White Divider line
              Container(
                height: 1,
                // Set height of the line
                color: Colors.white.withOpacity(0.4),
                // Lighter white line using opacity
                margin: EdgeInsets.symmetric(
                    vertical: 10), // Space around the divider
              ),
              // Row for Date and Time horizontally
              Row(
                children: const [
                  Icon(Icons.calendar_today, size: 14, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    "Sunday, 12 June",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(width: 16), // Space between date and time
                  Icon(Icons.access_time, size: 14, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    "9:00 - 12:00 AM",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
          // Arrow icon placed at the top-right corner using Positioned widget
          Positioned(
            top: 1, // Distance from top
            right: 1, // Distance from right
            child: IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white, // Set icon color to white
              ),
              onPressed: () {
                // Navigate to the PinEntryScreen when the icon is pressed
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => PinEntryScreen()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
