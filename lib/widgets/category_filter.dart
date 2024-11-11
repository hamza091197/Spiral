import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryFilter extends StatelessWidget {
  const CategoryFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.w, // Horizontal spacing between items (responsive)
      runSpacing: 8.h, // Vertical spacing between lines (responsive)
      children: [
        _buildCategory("Meeting", Colors.orange, Colors.orange.withOpacity(0.2)),
        _buildCategory("Hangout", Colors.purple, Colors.purple.withOpacity(0.2)),
        _buildCategory("Cooking", Colors.red, Colors.red.withOpacity(0.2)),
        _buildCategory("Other", Colors.black, Colors.black.withOpacity(0.2)),
        _buildCategory("Weekend", Colors.green, Colors.green.withOpacity(0.2)),
      ],
    );
  }

  Widget _buildCategory(String label, Color color, Color backgroundColor) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w), // Responsive margin
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w), // Responsive padding
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15.r), // Responsive border radius
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8.w, // Responsive width
            height: 8.h, // Responsive height
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 5.w), // Responsive spacing
          Text(
            label,
            style: TextStyle(color: Colors.black, fontSize: 14.sp), // Responsive font size
          ),
        ],
      ),
    );
  }
}