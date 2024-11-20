import 'package:budgetmate/app/shared/Constatnts.dart';
import 'package:budgetmate/app/shared/Enums.dart';
import 'package:budgetmate/app/shared/Extensions.dart';
import 'package:budgetmate/app/shared/Functions.dart';
import 'package:budgetmate/app/widgets/shimmer_list.dart';
import 'package:budgetmate/app/widgets/transaction_tile.dart';
import 'package:budgetmate/app/presentation/dashboard/controller/dashboard_controller.dart';
import 'package:budgetmate/app/widgets/shimmer_text.dart';
import 'package:budgetmate/config/route/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  DashboardController controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return GetBuilder(
      init: controller,
      builder: (DashboardController controller) => Scaffold(
        body: SizedBox(
          height: height * 0.9,
          child: Stack(
            children: [
              ClipPath(
                clipper: CurvedPainter(),
                child: Container(
                  height: 300,
                  color: maincolor,
                ),
              ),
              RefreshIndicator(
                onRefresh: controller.handleRefresh,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: SizedBox(
                    height: context.height * 0.9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: context.height * 0.06,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Welcome Back,",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                controller.username,
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: const Color(0xff2f7e79),
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromARGB(64, 47, 126, 121),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 5),
                                  ),
                                ]),
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Total Balance',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                controller.dashboard.wallet != null
                                    ? Text(
                                        '$currency ${(controller.dashboard.wallet!.balance!).toStringAsFixed(2)}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 32,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    : ShimmerText(
                                        text: "$currency 0.00",
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold,
                                        textColor: Colors.white,
                                      ),
                                const SizedBox(height: 25),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Row(
                                          children: [
                                            Icon(
                                              Icons.arrow_circle_down_rounded,
                                              color: Colors.white,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'Income',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 5),
                                        controller.dashboard.wallet != null
                                            ? Text(
                                                '$currency ${(controller.dashboard.wallet!.income!).toStringAsFixed(2)}',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                ),
                                              )
                                            : ShimmerText(
                                                text: "$currency 0.00",
                                                fontSize: 16,
                                                textColor: Colors.white,
                                              ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        const Row(
                                          children: [
                                            Icon(
                                              Icons.arrow_circle_up_rounded,
                                              color: Colors.white,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'Expense',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 5),
                                        controller.dashboard.wallet != null
                                            ? Text(
                                                '$currency ${(controller.dashboard.wallet!.expense!).toStringAsFixed(2)}',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                ),
                                              )
                                            : ShimmerText(
                                                text: "$currency 0.00",
                                                fontSize: 16,
                                                textColor: Colors.white,
                                              ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Latest Transactions',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextButton(
                                child: const Text('See all'),
                                onPressed: () {
                                  Get.toNamed(AppRoutes.allTransactions);
                                },
                              ),
                            ],
                          ),
                        ),
                        controller.dashboard.latestTransactions == null
                            ? Padding(
                                padding: const EdgeInsets.only(
                                    left: 25, right: 25, top: 8),
                                child: SizedBox(
                                  height: height * 0.39,
                                  child: const ShimmerList(),
                                ),
                              )
                            : controller
                                    .dashboard.latestTransactions!.isNotEmpty
                                ? Padding(
                                    padding: const EdgeInsets.only(
                                        left: 25, right: 25, top: 8),
                                    child: SizedBox(
                                      height: height * 0.39,
                                      child: ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        padding: EdgeInsets.zero,
                                        itemCount: controller.dashboard
                                            .latestTransactions!.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          var transaction = controller.dashboard
                                              .latestTransactions![index];

                                          return TransactionTile(
                                            id: transaction.id!,
                                            transactionType: TransactionType
                                                .values[transaction.type!],
                                            transactionCategory: TransactionType
                                                            .values[
                                                        transaction.type!] ==
                                                    TransactionType.income
                                                ? TransactionIncomeCategory
                                                    .values[
                                                        transaction.category!]
                                                    .label!
                                                : TransactionExpenseCategory
                                                    .values
                                                    .where((e) =>
                                                        transaction.category ==
                                                        e.idx)
                                                    .first
                                                    .label!,
                                            amount: transaction.amount!,
                                            dateTime: DateTime.parse(
                                                transaction.date!),
                                            icon: transaction.type == 0
                                                ? TransactionIncomeCategory
                                                    .values[
                                                        transaction.category!]
                                                    .icon!
                                                : TransactionExpenseCategory
                                                    .values
                                                    .where((e) =>
                                                        transaction.category ==
                                                        e.idx)
                                                    .first
                                                    .icon!,
                                          );
                                        },
                                      ),
                                    ),
                                  )
                                : const Expanded(
                                    child: Center(
                                      child: Text('No transactions to show.'),
                                    ),
                                  )
                      ],
                    ),
                  ),
                ),
              )
              // : const Center(child: CircularProgressIndicator())
            ],
          ),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: Container(
          width: 75,
          height: 75,
          decoration: BoxDecoration(boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(64, 47, 126, 121),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 5),
            ),
          ], borderRadius: BorderRadius.circular(50)),
          child: FittedBox(
            child: FloatingActionButton(
              onPressed: () {
                controller.showTransactionTypeDialog();
              },
              backgroundColor: const Color(0xff428681),
              shape: const CircleBorder(),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.home_filled,
                  size: 30,
                  color: Color(0xff2f7e79),
                ),
                onPressed: () {},
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: IconButton(
                  icon: const Icon(
                    Icons.bar_chart_rounded,
                    size: 30,
                  ),
                  onPressed: () {
                    Get.toNamed(AppRoutes.statistics);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: IconButton(
                  icon: const Icon(
                    Icons.wallet,
                    size: 30,
                  ),
                  onPressed: () {
                    Get.toNamed(AppRoutes.wallet);
                  },
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.more_vert_rounded,
                  size: 30,
                ),
                onPressed: () {
                  Get.toNamed(AppRoutes.moreOptions);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
