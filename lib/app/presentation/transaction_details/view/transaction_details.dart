import 'package:budgetmate/app/presentation/transaction_details/controller/transaction_details_controller.dart';
import 'package:budgetmate/app/shared/Constatnts.dart';
import 'package:budgetmate/app/shared/Enums.dart';
import 'package:budgetmate/app/shared/Extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TransactionDetailsPage extends StatelessWidget {
  const TransactionDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    TransactionDetailsController controller =
        Get.put(TransactionDetailsController());

    return Scaffold(
      backgroundColor: maincolor,
      appBar: AppBar(
        actions: <Widget>[
          PopupMenuButton<String>(
            position: PopupMenuPosition.under,
            icon: const Icon(Icons.more_horiz),
            iconSize: 32,
            itemBuilder: (BuildContext context) {
              return controller.actionButtonItems;
            },
          ),
        ],
        elevation: 0,
        toolbarHeight: 90,
        foregroundColor: Colors.white,
        backgroundColor: maincolor,
        title: const Text(
          "Transaction Details",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: height - 130,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35.0),
              topRight: Radius.circular(35.0),
            )),
        child: SingleChildScrollView(
          child: GetBuilder(
            builder: (TransactionDetailsController controller) {
              if (controller.transaction != null) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        top: 30,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: controller.transaction!.Type == 0
                                ? const Color.fromARGB(137, 140, 235, 143)
                                : const Color.fromARGB(136, 226, 149, 143),
                            radius: 40,
                            child: Icon(
                              controller.transaction!.Type == 0
                                  ? TransactionIncomeCategory
                                      .values[controller.transaction!.Category!]
                                      .icon
                                  : TransactionExpenseCategory.values
                                      .where((e) =>
                                          controller.transaction!.Category ==
                                          e.idx)
                                      .first
                                      .icon,
                              size: 40,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 20),
                        alignment: Alignment.center,
                        width: 80,
                        height: 25,
                        decoration: BoxDecoration(
                            color: controller.transaction!.Type == 0
                                ? const Color.fromARGB(137, 140, 235, 143)
                                : const Color.fromARGB(136, 226, 149, 143),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                        child: Text(
                          controller.transaction!.Type == 0
                              ? "Income"
                              : "Expense",
                          style: TextStyle(
                            color: controller.transaction!.Type == 0
                                ? const Color.fromARGB(255, 27, 151, 31)
                                : const Color.fromARGB(255, 233, 51, 38),
                          ),
                        )),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("$currency ${controller.transaction!.Amount}",
                              style: const TextStyle(fontSize: 24)),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(20, 25, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Transaction Details",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    TransactionDetailsEntry(
                      "Status",
                      controller.transaction!.Type == 0 ? "Income" : "Expense",
                    ),
                    TransactionDetailsEntry(
                      "Category",
                      controller.transaction!.Type == 0
                          ? TransactionIncomeCategory
                              .values[controller.transaction!.Category!].label!
                          : TransactionExpenseCategory.values
                              .where((e) =>
                                  controller.transaction!.Category == e.idx)
                              .first
                              .label!,
                    ),
                    TransactionDetailsEntry(
                        "Time",
                        DateFormat.jm()
                            .format(
                                DateTime.parse(controller.transaction!.Date!))
                            .toString()),
                    TransactionDetailsEntry(
                        "Date",
                        DateFormat.yMMMMd()
                            .format(
                                DateTime.parse(controller.transaction!.Date!))
                            .toString()),
                    TransactionDetailsEntry("Amount",
                        "$currency ${controller.transaction!.Amount}"),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 6, left: 5),
                            child: Text(
                              "Invoice",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Container(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: GetBuilder(
                                init: controller,
                                builder:
                                    (TransactionDetailsController controller) {
                                  return controller.transaction!.Invoice == null
                                      ? const Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.hide_image_outlined),
                                              Text('No Invoice')
                                            ],
                                          ),
                                        )
                                      : controller.invoiceBytes != null
                                          ? Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Image.memory(
                                                controller.invoiceBytes!,
                                              ),
                                            )
                                          : const SizedBox(
                                              height: 300,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Column(
                                                    children: [
                                                      SizedBox(
                                                        width: 50,
                                                        child:
                                                            LinearProgressIndicator(),
                                                      ),
                                                      Text("Loading Invocie")
                                                    ],
                                                  )
                                                ],
                                              ),
                                            );
                                  // '$BaseAPIAddress${controller.transaction.Invoice}'
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                return SizedBox(
                  height: height - 130,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class TransactionDetailsEntry extends StatelessWidget {
  final String sLeft;
  final String sRight;
  const TransactionDetailsEntry(
    this.sLeft,
    this.sRight, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20.0),
            child: Text(
              sLeft,
              style: const TextStyle(
                  color: Color(0xff666666), fontWeight: FontWeight.w500),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(right: 20.0),
              child: Text(
                sRight,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ))
        ],
      ),
    );
  }
}
