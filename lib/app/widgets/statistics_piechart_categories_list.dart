import 'package:budgetmate/app/presentation/statistics/model/statistics_model.dart';
import 'package:budgetmate/app/shared/Constatnts.dart';
import 'package:budgetmate/app/shared/Enums.dart';
import 'package:budgetmate/app/shared/Extensions.dart';
import 'package:flutter/material.dart';

class StatisticsPieChartCategoriesList extends StatelessWidget {
  bool isExpenseSelected;
  TimePeriodStats timePeriodStats;
  StatisticsPieChartCategoriesList(
      {required this.isExpenseSelected,
      required this.timePeriodStats,
      super.key});

  @override
  Widget build(BuildContext context) {
    if (isExpenseSelected) {
      if (timePeriodStats.categoryWiseSpending!.isNotEmpty) {
        return SizedBox(
          height: 20,
          child: ShaderMask(
            shaderCallback: (Rect rect) {
              return const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.white70,
                  Colors.transparent,
                  Colors.transparent,
                  Colors.white70
                ],
                stops: [
                  0.0,
                  0.01,
                  0.99,
                  1.0
                ], // 10% white, 80% transparent, 10% white
              ).createShader(rect);
            },
            blendMode: BlendMode.dstOut,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: timePeriodStats.categoryWiseSpending!.length,
              itemBuilder: (BuildContext context, int index) {
                var category = timePeriodStats.categoryWiseSpending![index];
                return Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Container(
                        height: 20,
                        width: 20,
                        color: TransactionExpenseCategory.values
                            .where((e) => category.category == e.idx)
                            .first
                            .color,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text(TransactionExpenseCategory.values
                          .where((e) => category.category == e.idx)
                          .first
                          .label!),
                    )
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: 20,
                );
              },
            ),
          ),
        );
      }
    }
    if (timePeriodStats.categoryWiseIncome!.isNotEmpty) {
      return SizedBox(
        height: 20,
        child: ShaderMask(
          shaderCallback: (Rect rect) {
            return const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.white70,
                Colors.transparent,
                Colors.transparent,
                Colors.white70
              ],
              stops: [
                0.0,
                0.01,
                0.99,
                1.0
              ], // 10% white, 80% transparent, 10% white
            ).createShader(rect);
          },
          blendMode: BlendMode.dstOut,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: timePeriodStats.categoryWiseIncome!.length,
            itemBuilder: (BuildContext context, int index) {
              var category = timePeriodStats.categoryWiseIncome![index];
              return Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                      height: 20,
                      width: 20,
                      color: TransactionIncomeCategory.values
                          .where((e) => category.category == e.idx)
                          .first
                          .color,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(TransactionIncomeCategory.values
                        .where((e) => category.category == e.idx)
                        .first
                        .label!),
                  )
                ],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: 20,
              );
            },
          ),
        ),
      );
    }
    return SizedBox(
      height: 20,
      child: ShaderMask(
        shaderCallback: (Rect rect) {
          return const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Colors.white70,
              Colors.transparent,
              Colors.transparent,
              Colors.white70
            ],
            stops: [
              0.0,
              0.01,
              0.99,
              1.0
            ], // 10% white, 80% transparent, 10% white
          ).createShader(rect);
        },
        blendMode: BlendMode.dstOut,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Container(height: 20, width: 20, color: maincolor),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text('None'),
                )
              ],
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              width: 20,
            );
          },
        ),
      ),
    );
  }
}
