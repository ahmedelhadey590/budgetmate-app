import 'package:budgetmate/app/presentation/statistics/model/statistics_model.dart';
import 'package:budgetmate/app/shared/Enums.dart';
import 'package:budgetmate/app/shared/Extensions.dart';
import 'package:budgetmate/app/widgets/category_tile.dart';
import 'package:flutter/material.dart';

class StatisticsCategoriesList extends StatelessWidget {
  bool isExpenseSelected;
  TimePeriodStats timePeriodStats;
  StatisticsCategoriesList(
      {required this.isExpenseSelected,
      required this.timePeriodStats,
      super.key});

  @override
  Widget build(BuildContext context) {
    if (isExpenseSelected) {
      if (timePeriodStats.categoryWiseSpending!.isNotEmpty) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: timePeriodStats.categoryWiseSpending!.length,
          itemBuilder: (BuildContext context, int index) {
            var category = timePeriodStats.categoryWiseSpending![index];
            return CategoryTile(
              categoryTitle: TransactionExpenseCategory.values
                  .where((e) => category.category == e.idx)
                  .first
                  .label!,
              amount: category.totalSpent!,
              transactionType: TransactionType.expense,
              icon: TransactionExpenseCategory.values
                  .where((e) => category.category == e.idx)
                  .first
                  .icon,
            );
          },
        );
      }
    }
    if (timePeriodStats.categoryWiseIncome!.isNotEmpty) {
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: timePeriodStats.categoryWiseIncome!.length,
        itemBuilder: (BuildContext context, int index) {
          var category = timePeriodStats.categoryWiseIncome![index];
          return CategoryTile(
            categoryTitle: TransactionIncomeCategory.values
                .where((e) => category.category == e.idx)
                .first
                .label!,
            amount: category.totalSpent!,
            transactionType: TransactionType.income,
            icon: TransactionIncomeCategory.values
                .where((e) => category.category == e.idx)
                .first
                .icon,
          );
        },
      );
    }
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      child: const Center(
        child: Text(" No Categories in this Time Frame"),
      ),
    );
  }
}
