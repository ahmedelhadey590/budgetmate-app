import 'package:budgetmate/app/presentation/wallet/model/wallet_model.dart';
import 'package:budgetmate/config/route/AppRoutes.dart';
import 'package:budgetmate/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WalletController extends GetxController {
  WalletModel walletModel = WalletModel();

  @override
  void onInit() {
    super.onInit();
    fetchWallet();
  }

  Future<WalletModel?> fetchWallet() async {
    var wallet = await dioHelper.getWallet();
    walletModel = wallet!;
    update();
    print("Wallet Fetched and Stored in model");
    return walletModel;
  }

  Future<void> showTransactionTypeDialog() async {
    Get.dialog(
      AlertDialog(
        title: const Text('Transaction Type'),
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Please Choose the Type of Transaction'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Income'),
            onPressed: () {
              Get.offNamed(AppRoutes.addIncome);
            },
          ),
          TextButton(
            child: const Text('Expense'),
            onPressed: () {
              Get.offNamed(AppRoutes.addExpense);
            },
          ),
        ],
      ),
    );
  }
}
