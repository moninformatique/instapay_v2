import 'package:flutter/widgets.dart';

class TransactionModel {
  final IconData icon;
  final String name;
  final String date;
  final String amount;

  const TransactionModel({
    required this.icon,
    required this.name,
    required this.date,
    required this.amount,
  });
}

class AmountModel {
  final IconData icon;
  final String title;
  final String amount;

  const AmountModel({
    required this.icon,
    required this.title,
    required this.amount,
  });
}
