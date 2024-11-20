import 'package:budgetmate/app/presentation/statistics/controller/statistics_controller.dart';
import 'package:budgetmate/app/presentation/statistics/model/statistics_model.dart';
import 'package:budgetmate/app/shared/Constatnts.dart';
import 'package:budgetmate/app/widgets/statistics_categories_list.dart';
import 'package:budgetmate/app/widgets/statistics_piechart_categories_list.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({super.key});

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  StatisticsController controller = Get.put(StatisticsController());

  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: controller.screenshotController,
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          toolbarHeight: 90,
          elevation: 0,
          title: const Text(
            'Statistics',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  controller.takeScreenShot();
                },
                icon: const Icon(Icons.save_alt_rounded))
          ],
        ),
        body: FutureBuilder(
          future: controller.fetchStatistics(),
          builder:
              (BuildContext context, AsyncSnapshot<StatisticsModel?> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else if (snapshot.hasData) {
              return GetBuilder(
                init: controller,
                builder: (StatisticsController controller) {
                  return RefreshIndicator(
                    onRefresh: controller.fetchStatistics,
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              MaterialButton(
                                onPressed: () {
                                  controller.setActivatedTimePeriod(0);
                                },
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                textColor: controller.activatedTimePeriod == 0
                                    ? Colors.white
                                    : null,
                                color: controller.activatedTimePeriod == 0
                                    ? maincolor
                                    : null,
                                child: Text(controller.timePeriods[0]),
                              ),
                              MaterialButton(
                                onPressed: () {
                                  controller.setActivatedTimePeriod(1);
                                },
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                textColor: controller.activatedTimePeriod == 1
                                    ? Colors.white
                                    : null,
                                color: controller.activatedTimePeriod == 1
                                    ? maincolor
                                    : null,
                                child: Text(controller.timePeriods[1]),
                              ),
                              MaterialButton(
                                onPressed: () {
                                  controller.setActivatedTimePeriod(2);
                                },
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                textColor: controller.activatedTimePeriod == 2
                                    ? Colors.white
                                    : null,
                                color: controller.activatedTimePeriod == 2
                                    ? maincolor
                                    : null,
                                child: Text(controller.timePeriods[2]),
                              ),
                              MaterialButton(
                                onPressed: () {
                                  controller.setActivatedTimePeriod(3);
                                },
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                textColor: controller.activatedTimePeriod == 3
                                    ? Colors.white
                                    : null,
                                color: controller.activatedTimePeriod == 3
                                    ? maincolor
                                    : null,
                                child: Text(controller.timePeriods[3]),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 12, top: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width: context.width * 0.3,
                                  child: DropdownButtonFormField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                    itemHeight: 48,
                                    value: "Expense",
                                    items: [
                                      DropdownMenuItem<String>(
                                        value: "Income",
                                        child: Text("Income"),
                                        onTap: () => controller
                                            .setSelectedTransactionType(false),
                                      ),
                                      DropdownMenuItem<String>(
                                        value: "Expense",
                                        child: Text("Expense"),
                                        onTap: () => controller
                                            .setSelectedTransactionType(true),
                                      ),
                                    ],
                                    // TODO add logic to change from expense stats and income stats
                                    onChanged: (value) {},
                                  ),
                                )
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 35, right: 35),
                                child: SizedBox(
                                  width: double.infinity,
                                  height: context.height * 0.35,
                                  child: Center(
                                    child: PieChart(
                                      PieChartData(
                                        sections: controller.pieChartSections,
                                        centerSpaceRadius: 70,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  child: StatisticsPieChartCategoriesList(
                                      isExpenseSelected:
                                          controller.isExpenseSelected,
                                      timePeriodStats:
                                          controller.timePeriodStats)),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 20, 20, 0),
                                child: Row(
                                  children: [
                                    Text(
                                      "Categories",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Spacer(),
                                    IconButton(
                                      onPressed: () {
                                        controller.setSortDirection();
                                      },
                                      icon: Icon(Icons.sort_rounded),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(25, 8, 25, 0),
                                child: StatisticsCategoriesList(
                                    isExpenseSelected:
                                        controller.isExpenseSelected,
                                    timePeriodStats:
                                        controller.timePeriodStats),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
