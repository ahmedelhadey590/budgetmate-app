import 'package:budgetmate/app/presentation/transaction_details/view/transaction_details.dart';
import 'package:budgetmate/app/shared/Constatnts.dart';
import 'package:budgetmate/app/shared/Enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionTile extends StatelessWidget {
  final String id;
  final TransactionType transactionType;
  final String transactionCategory;
  final num amount;
  final DateTime dateTime;
  final IconData icon;
  const TransactionTile(
      {required this.id,
      required this.transactionType,
      required this.transactionCategory,
      required this.amount,
      required this.dateTime,
      required this.icon,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => const TransactionDetailsPage(), arguments: id);
      },
      child: Container(
        decoration: BoxDecoration(color: Colors.transparent),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
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
                        icon,
                        color: transactionType == TransactionType.income
                            ? Colors.green
                            : Colors.red,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          transactionCategory,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        Text(
                            "${dateTime.month}, ${dateTime.day}, ${dateTime.year}")
                      ],
                    ),
                  ),
                ],
              ),
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
        ),
      ),
    );
  }
}
