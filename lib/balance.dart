import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Balance extends StatelessWidget {
  double balance;
  Balance({super.key, required this.balance});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Bank Balance: '),
          SizedBox(
            height: 20.0,
          ),
          Text(
            '\$ ${NumberFormat.simpleCurrency(name: '').format(balance)}',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          ),
        ],
      ),
    );
  }
}
