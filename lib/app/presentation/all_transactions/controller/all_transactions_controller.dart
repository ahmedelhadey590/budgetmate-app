import 'package:budgetmate/app/presentation/all_transactions/model/all_transactions_model.dart';
import 'package:budgetmate/main.dart';
import 'package:get/get.dart';

class AllTransactionsController extends GetxController {
  AllTransactionsModel allTransactionsModel = AllTransactionsModel();

  List<Transaction> tmpList = [];
  bool isFiltered = false;

  Future<AllTransactionsModel?> fetchTransactions() async {
    var wallet = await dioHelper.getAllTransactions();
    allTransactionsModel = wallet!;
    print("All Transactions Fetched and Stored in model");
    return allTransactionsModel;
  }
}
