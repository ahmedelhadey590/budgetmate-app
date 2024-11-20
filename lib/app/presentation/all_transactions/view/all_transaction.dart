import 'package:budgetmate/app/presentation/all_transactions/controller/all_transactions_controller.dart';
import 'package:budgetmate/app/presentation/all_transactions/model/all_transactions_model.dart';
import 'package:budgetmate/app/shared/Constatnts.dart';
import 'package:budgetmate/app/shared/Enums.dart';
import 'package:budgetmate/app/shared/Extensions.dart';
import 'package:budgetmate/app/widgets/transaction_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllTransactionsPage extends StatelessWidget {
  const AllTransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    AllTransactionsController controller = Get.put(AllTransactionsController());

    return Scaffold(
      backgroundColor: maincolor,
      appBar: AppBar(
        backgroundColor: maincolor,
        foregroundColor: Colors.white,
        toolbarHeight: 90,
        elevation: 0,
        title: const Text(
          'All Transactions',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: height * 0.9,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        padding: const EdgeInsets.all(20),
        child: RefreshIndicator(
          onRefresh: controller.fetchTransactions,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: GetBuilder(
              init: controller,
              builder: (AllTransactionsController controller) {
                return FutureBuilder(
                  future: controller.fetchTransactions(),
                  builder: (BuildContext context,
                      AsyncSnapshot<AllTransactionsModel?> snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return SizedBox(
                        height: height * 0.9,
                        child: ListView.builder(
                          itemCount: controller.allTransactionsModel
                              .transactions!.length, // Example count
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            var transaction = controller
                                .allTransactionsModel.transactions![index];
                            return TransactionTile(
                              id: transaction.Id,
                              transactionType:
                                  TransactionType.values[transaction.Type],
                              transactionCategory: TransactionType
                                          .values[transaction.Type] ==
                                      TransactionType.income
                                  ? TransactionIncomeCategory
                                      .values[transaction.Category].label!
                                  : TransactionExpenseCategory.values
                                      .where(
                                          (e) => transaction.Category == e.idx)
                                      .first
                                      .label!,
                              amount: transaction.Amount,
                              dateTime: DateTime.parse(transaction.Date),
                              icon: transaction.Type == 0
                                  ? TransactionIncomeCategory
                                      .values[transaction.Category].icon!
                                  : TransactionExpenseCategory.values
                                      .where(
                                          (e) => transaction.Category == e.idx)
                                      .first
                                      .icon!,
                            );
                          },
                        ),
                      );
                    } else {
                      return SizedBox(
                        height: context.height - 300,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
