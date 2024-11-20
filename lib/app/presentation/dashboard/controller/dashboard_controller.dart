import 'package:budgetmate/app/presentation/dashboard/model/dashboard_model.dart';
import 'package:budgetmate/config/route/AppRoutes.dart';
import 'package:budgetmate/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  DashboardModel dashboard = DashboardModel();
  String username = prefs.getUsername();

  bool isLoading = true;

  @override
  void onInit() {
    super.onInit();
    getDashboard();
  }

  void getDashboard() async {
    try {
      // dashboard = DashboardModel();
      // update();
      var res = await dioHelper.getDashboardData();
      if (res != null) {
        dashboard = res;
        isLoading = false;
        update();
      }
    } catch (e) {
      // Handle the error, maybe log it or show a user-friendly message
    }
  }

  Future<void> handleRefresh() async {
    getDashboard();
    update();
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
