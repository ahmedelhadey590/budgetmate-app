import 'dart:typed_data';

import 'package:budgetmate/app/presentation/transaction_details/model/transaction_details_model.dart';
import 'package:budgetmate/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionDetailsController extends GetxController {
  String? id = Get.arguments ?? '';
  TransactionDetailsModel? transaction;
  Uint8List? invoiceBytes;

  List<PopupMenuItem<String>> actionButtonItems = [
    PopupMenuItem(
      value: "Delete",
      child: ListTile(
        leading: Icon(Icons.delete_forever),
        title: Text('Delete'),
      ),
      onTap: () {
        dioHelper.deleteTransaction(Get.arguments);
        Get.back();
      },
    )
  ];

  @override
  onInit() {
    super.onInit();

    fetchTransaction();
  }

  Future<TransactionDetailsModel?> fetchTransaction() async {
    if (id != null) {
      var tempTransaction = await dioHelper.getTransaction(id!);
      if (tempTransaction != null) {
        transaction = tempTransaction;
        if (transaction!.Invoice != null) {
          fetchInvoice(transaction!.Invoice!);
        }
        update();
        print("Transaction Details Fetched and Stored in model");
      } else {
        print("Failed to fetch transaction details");
      }
      return transaction;
    } else {
      print("ID is null, cannot fetch transaction");
      return null;
    }
  }

  Future<void> fetchInvoice(String invoicePath) async {
    var invoice = await dioHelper.getTransactionInvoice(invoicePath);
    invoiceBytes = invoice;
    update();
  }

  Future<void> deleteTransaction(String id) async {}
}
