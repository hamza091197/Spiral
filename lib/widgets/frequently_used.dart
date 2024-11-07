import 'package:flutter/material.dart';
import 'package:spiral/widgets/bank_transfer.dart';
import 'package:spiral/widgets/callid.dart';
import 'package:spiral/widgets/credit_champ.dart';
import 'package:spiral/widgets/request_money.dart';
import 'package:spiral/widgets/transaction_history.dart';

class FrequentlyUsed extends StatelessWidget {
  const FrequentlyUsed({super.key});

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
                'Frequently Used',
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal, // Horizontal Scroll View
            child: Row(
              children: [
                _buildFeatureIcon(
                  Icons.call,
                  'Caller\nID',
                  Colors.green[100]!,
                  context, // Pass context to navigate
                ),
                SizedBox(width: 16), // Space between items
                _buildFeatureIcon(
                  Icons.credit_card,
                  'Credit\nChamp',
                  Colors.red[100]!,
                  context,
                ),
                SizedBox(width: 16),
                _buildFeatureIcon(
                  Icons.account_balance,
                  'Bank\nTransfer',
                  Colors.yellow[100]!,
                  context,
                ),
                SizedBox(width: 16),
                _buildFeatureIcon(
                  Icons.request_page,
                  'Request\nMoney',
                  Colors.blue[100]!,
                  context,
                ),
                SizedBox(width: 16),
                _buildFeatureIcon(
                  Icons.history,
                  'Transaction\nHistory',
                  Colors.purple[100]!,
                  context,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureIcon(
      IconData icon,
      String label,
      Color backgroundColor,
      BuildContext context,
      ) {
    return GestureDetector(
      onTap: () {
        // Navigate to CallerIdScreen when icon is clicked
        if (label == 'Caller\nID') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CallerIdScreen()),
          );
        }
        if (label == 'Credit\nChamp') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreditChampScreen()),
          );
        }
        if (label == 'Bank\nTransfer') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BankTransferScreen()),
          );
        }
        if (label == 'Request\nMoney') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RequestMoneyScreen()),
          );
        }
        if (label == 'Transaction\nHistory') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TransactionHistoryScreen()),
          );
        }
      },
      child: Column(
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
      ),
    );
  }
}
