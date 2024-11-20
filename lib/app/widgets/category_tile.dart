import 'package:budgetmate/app/shared/Constatnts.dart';
import 'package:budgetmate/app/shared/Enums.dart';
import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final IconData? icon;
  final String categoryTitle;
  final TransactionType transactionType;
  final num amount;
  const CategoryTile(
      {this.icon,
      required this.categoryTitle,
      required this.amount,
      required this.transactionType,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: const Color(0xfff0f6f5),
                borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: Icon(
                size: 30,
                icon ??
                    (transactionType == TransactionType.income
                        ? Icons.arrow_circle_down_rounded
                        : Icons.arrow_circle_up_rounded),
                color: transactionType == TransactionType.income
                    ? Colors.green
                    : Colors.red,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              categoryTitle,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          const Spacer(),
          Text(
            "${transactionType == TransactionType.income ? "+" : "-"}$currency ${amount.toStringAsFixed(2)}",
            style: TextStyle(
                color: transactionType == TransactionType.income
                    ? Colors.green
                    : Colors.red,
                fontSize: 18,
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
