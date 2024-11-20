import 'package:budgetmate/app/presentation/wallet/controller/wallet_controller.dart';
import 'package:budgetmate/app/presentation/wallet/model/wallet_model.dart';
import 'package:budgetmate/app/shared/Constatnts.dart';
import 'package:budgetmate/app/shared/Enums.dart';
import 'package:budgetmate/app/shared/Extensions.dart';
import 'package:budgetmate/app/widgets/transaction_tile.dart';
import 'package:budgetmate/config/route/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  WalletController controller = Get.put(WalletController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: maincolor,
      appBar: AppBar(
        backgroundColor: maincolor,
        foregroundColor: Colors.white,
        toolbarHeight: 90,
        title: const Text(
          'Wallet',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () => controller.fetchWallet(),
        child: Container(
          height: context.height - 90,
          padding:
              const EdgeInsets.only(top: 50, bottom: 10, left: 40, right: 40),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: FutureBuilder(
              future: controller.fetchWallet(),
              builder:
                  (BuildContext context, AsyncSnapshot<WalletModel?> snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else if (snapshot.hasData) {
                  return Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total Balance',
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Center(
                                child: Text(
                                  '\$ ${controller.walletModel.Balance}',
                                  style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              OutlinedButton(
                                onPressed: () {
                                  controller.showTransactionTypeDialog();
                                },
                                style: OutlinedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  side: BorderSide(
                                    width: 1.0,
                                    color: maincolor,
                                  ),
                                  minimumSize: const Size(70, 70),
                                ),
                                child: Icon(
                                  Icons.add,
                                  size: 60,
                                  color: maincolor,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Add Transaction',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w200),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Today\'s Transactions',
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
                      controller.walletModel.Transactions!.isNotEmpty
                          ? Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: SizedBox(
                                height: context.height * 0.39,
                                child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.zero,
                                  itemCount: controller
                                      .walletModel.Transactions!.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var transaction = controller
                                        .walletModel.Transactions![index];

                                    return TransactionTile(
                                      id: transaction.Id!,
                                      transactionType: TransactionType
                                          .values[transaction.Type],
                                      transactionCategory: TransactionType
                                                  .values[transaction.Type] ==
                                              TransactionType.income
                                          ? TransactionIncomeCategory
                                              .values[transaction.Category]
                                              .label!
                                          : TransactionExpenseCategory.values
                                              .where((e) =>
                                                  transaction.Category == e.idx)
                                              .first
                                              .label!,
                                      amount: transaction.Amount,
                                      dateTime:
                                          DateTime.parse(transaction.Date),
                                      icon: transaction.Type == 0
                                          ? TransactionIncomeCategory
                                              .values[transaction.Category]
                                              .icon!
                                          : TransactionExpenseCategory.values
                                              .where((e) =>
                                                  transaction.Category == e.idx)
                                              .first
                                              .icon!,
                                    );
                                  },
                                ),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: SizedBox(
                                height: context.height * 0.39,
                                child: const Center(
                                  child: Text('No transactions to show.'),
                                ),
                              ),
                            )
                    ],
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
            ),
          ),
        ),
      ),
    );
  }
}
