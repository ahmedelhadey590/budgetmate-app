import 'package:budgetmate/app/presentation/add_expense/view/add_expense.dart';
import 'package:budgetmate/app/presentation/add_income/view/add_income.dart';
import 'package:budgetmate/app/presentation/all_transactions/view/all_transaction.dart';
import 'package:budgetmate/app/presentation/data_and_privacy_policy/view/data_and_privacy_policy.dart';
import 'package:budgetmate/app/presentation/login/view/login.dart';
import 'package:budgetmate/app/presentation/more_options/view/more_options.dart';
import 'package:budgetmate/app/presentation/personal_profile/view/personal_profile.dart';
import 'package:budgetmate/app/presentation/register/view/register.dart';
import 'package:budgetmate/app/presentation/dashboard/view/dashboard.dart';
import 'package:budgetmate/app/presentation/one_time_welcome/view/one_time_welcome_screen.dart';
import 'package:budgetmate/app/presentation/settings/view/settings.dart';
import 'package:budgetmate/app/presentation/splash/view/splash_screen.dart';
import 'package:budgetmate/app/presentation/statistics/view/statistics.dart';
import 'package:budgetmate/app/presentation/transaction_details/view/transaction_details.dart';
import 'package:budgetmate/app/presentation/wallet/view/wallet.dart';
import 'package:budgetmate/config/route/AppRoutes.dart';
import 'package:get/get.dart';

class AppPages {
  static List<GetPage> pages = [
    GetPage(name: AppRoutes.splash, page: () => const SplashScreen()),
    GetPage(name: AppRoutes.oneTimeWelcome, page: () => OneTimeWelcomeScreen()),
    GetPage(name: AppRoutes.login, page: () => const Login()),
    GetPage(name: AppRoutes.register, page: () => const Register()),
    GetPage(name: AppRoutes.dashboard, page: () => const DashboardPage()),
    GetPage(name: AppRoutes.wallet, page: () => const WalletPage()),
    GetPage(name: AppRoutes.addIncome, page: () => const AddIncomePage()),
    GetPage(name: AppRoutes.addExpense, page: () => const AddExpensePage()),
    GetPage(name: AppRoutes.allTransactions, page: () => const AllTransactionsPage()),
    GetPage(name: AppRoutes.transactionDetails, page: () => const TransactionDetailsPage()),
    GetPage(name: AppRoutes.statistics, page: () => const StatisticsPage()),
    GetPage(name: AppRoutes.moreOptions, page: () => MoreOptionsPage()),
    GetPage(
      name: AppRoutes.dataAndPrivacyPolicy,
      page: () => Dataandprivacypolicy(),
    ),
    GetPage(
        name: AppRoutes.personalProfile, page: () => const PersonalProfile()),
    GetPage(name: AppRoutes.settings, page: () => const SettingsPage()),
  ];
}
