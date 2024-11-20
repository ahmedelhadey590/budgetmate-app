import 'dart:io';
import 'dart:typed_data';

import 'package:budgetmate/app/presentation/all_transactions/model/all_transactions_model.dart';
import 'package:budgetmate/app/presentation/dashboard/model/dashboard_model.dart';
import 'package:budgetmate/app/presentation/statistics/model/statistics_model.dart';
import 'package:budgetmate/app/presentation/transaction_details/model/transaction_details_model.dart';
import 'package:budgetmate/app/presentation/wallet/model/wallet_model.dart';
import 'package:budgetmate/app/shared/Constatnts.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:path_provider/path_provider.dart';

class DioHelper {
  Dio? dio;

  Future<void> init() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();

    final cookieJar =
        PersistCookieJar(storage: FileStorage('${appDocDir.path}/.cookies/'));

    dio = Dio(BaseOptions(
        baseUrl: "${BaseAPIAddress}api/", receiveDataWhenStatusError: true));
    dio!.interceptors.add(CookieManager(cookieJar));
  }

  Future<Response?> register(
      String username, String email, String password) async {
    try {
      var result = await dio!.post("User/Register", data: {
        "UserName": username,
        "Email": email,
        "Password": password,
        "ConfirmPassword": password
      });
      return result;
    } catch (e) {
      print("can't register user");
      print(e);
    }
    return null;
  }

  Future<Response?> login(String username, String password) async {
    try {
      var result = await dio!.post("User/Login",
          data: {"Username": username, "Password": password});
      return result;
    } catch (e) {
      print("can't login");
      print(e);
    }
    return null;
  }

  Future<Response?> logout() async {
    try {
      var result = await dio!.get("User/Logout");
      return result;
    } catch (e) {
      print("can't logout");
      print(e);
    }
    return null;
  }

  Future<Response?> getUserProfile() async {
    try {
      var result = await dio!.get("User/Profile");
      return result;
    } catch (e) {
      print("error getting UserProfile");
      print(e);
    }
    return null;
  }

  Future<DashboardModel?> getDashboardData() async {
    try {
      var result = await dio!.get("Dashboard");
      return DashboardModel.fromJson(result.data);
    } catch (e) {
      print("error getting dashboard");
      print(e);
    }
    return null;
  }

  Future<Response?> addTransaction(dynamic transaction) async {
    try {
      var formData = FormData.fromMap(transaction);
      var result = await dio!.post("Transaction/Add", data: formData);
      return result;
    } catch (e) {
      print("error adding transaction");
      print(e);
    }
    return null;
  }

  Future<AllTransactionsModel?> getAllTransactions() async {
    try {
      var result = await dio!.get("Transaction/GetAll");
      // print(result);
      return AllTransactionsModel.fromJson(result.data);
    } catch (e) {
      print("error fetching transactions");
      print(e);
    }
    return null;
  }

  Future<TransactionDetailsModel?> getTransaction(String transactionId) async {
    try {
      var result = await dio!.get("Transaction/Get/$transactionId");
      // print(result);
      return TransactionDetailsModel.fromJson(result.data);
    } catch (e) {
      print("error fetching transaction");
      print(e);
    }
    return null;
  }

  Future<Uint8List?> getTransactionInvoice(String invoicePath) async {
    try {
      var result = await dio!.get(
        '$BaseAPIAddress$invoicePath',
        options: Options(
          responseType: ResponseType.bytes,
        ),
      );
      // print("Invoice fetched");
      return result.data;
    } catch (e) {
      print("error fetching invoice");
      print(e);
    }
    return null;
  }

  Future<void> deleteTransaction(String transactionId) async {
    try {
      await dio!.post("Transaction/Delete/$transactionId");
    } catch (e) {
      print("error deleting transaction");
      print(e);
    }
  }

  Future<WalletModel?> getWallet() async {
    try {
      var result = await dio!.get("Wallet");
      // print(result);
      return WalletModel.fromJson(result.data);
    } catch (e) {
      print("error fetching wallet");
      print(e);
    }
    return null;
  }

  Future<StatisticsModel?> getStatistics() async {
    try {
      var result = await dio!.get("Stats");
      // print(result);
      return StatisticsModel.fromJson(result.data);
    } catch (e) {
      print("error fetching statistics");
      print(e);
    }
    return null;
  }
}
