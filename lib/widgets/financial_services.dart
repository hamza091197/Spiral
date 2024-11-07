import 'package:flutter/material.dart';

class FinancialServices extends StatelessWidget {
  const FinancialServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Financial Services',
                style: TextStyle(
                  fontSize: 18,
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
                    fontSize: 14,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              _buildServiceIcon(
                  Icons.bar_chart, 'Transaction\nHistory', Colors.purple[100]!),
              SizedBox(width: 16),
              _buildServiceIcon(
                  Icons.request_page, 'Request\nMoney', Colors.blue[100]!),
              SizedBox(width: 16),
              _buildServiceIcon(
                  Icons.credit_card, 'Credit\nChamp', Colors.red[100]!),
              SizedBox(width: 16),
              _buildServiceIcon(
                  Icons.arrow_forward, 'Bank\nTransfer', Colors.yellow[100]!),
              SizedBox(width: 16),
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
            borderRadius: BorderRadius.circular(16),
          ),
          padding: EdgeInsets.all(16),
          child: Icon(
            icon,
            size: 28,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
