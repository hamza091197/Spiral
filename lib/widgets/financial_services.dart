import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FinancialServices extends StatelessWidget {
  const FinancialServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.zero, // Removed left and right padding
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Financial Services',
                style: TextStyle(
                  fontSize: 18.sp, // Responsive font size
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Navigate to view all page
                },
                child: Text(
                  'View all',
                  style: TextStyle(
                    fontSize: 14.sp, // Responsive font size
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h), // Responsive height
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.zero, // Removed left and right padding
          child: Row(
            children: [
              _buildServiceIcon(
                  Icons.bar_chart, 'Transaction\nHistory', Colors.purple[100]!),
              SizedBox(width: 16.w), // Responsive width
              _buildServiceIcon(
                  Icons.request_page, 'Request\nMoney', Colors.blue[100]!),
              SizedBox(width: 16.w), // Responsive width
              _buildServiceIcon(
                  Icons.credit_card, 'Credit\nChamp', Colors.red[100]!),
              SizedBox(width: 16.w), // Responsive width
              _buildServiceIcon(
                  Icons.arrow_forward, 'Bank\nTransfer', Colors.yellow[100]!),
              SizedBox(width: 16.w), // Responsive width
              _buildServiceIcon(Icons.call, 'Caller\nID', Colors.green[100]!),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildServiceIcon(IconData icon, String label, Color backgroundColor) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(16.r), // Responsive border radius
          ),
          padding: EdgeInsets.all(16.w), // Responsive padding
          child: Icon(
            icon,
            size: 28.sp, // Responsive icon size
            color: Colors.black,
          ),
        ),
        SizedBox(height: 8.h), // Responsive height
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12.sp), // Responsive font size
        ),
      ],
    );
  }
}