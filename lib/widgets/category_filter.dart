import 'package:flutter/material.dart';

class CategoryFilter extends StatelessWidget {
  const CategoryFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0, // Horizontal spacing between items
      runSpacing: 8.0, // Vertical spacing between lines
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
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 5),
          Text(
            label,
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
