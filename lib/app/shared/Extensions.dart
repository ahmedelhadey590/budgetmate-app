import 'package:budgetmate/app/shared/Enums.dart';
import 'package:flutter/material.dart';

extension TransactionIncomeCategoryExtension on TransactionIncomeCategory {
  String? get label {
    switch (this) {
      case TransactionIncomeCategory.salary:
        return 'Salary';
      case TransactionIncomeCategory.bonus:
        return 'Bonus';
      case TransactionIncomeCategory.freelancing:
        return 'Freelancing';
      case TransactionIncomeCategory.investment_gains:
        return 'Investment Gains';
      case TransactionIncomeCategory.rental_income:
        return 'Rental Income';
      case TransactionIncomeCategory.refunds:
        return 'Refunds';
      case TransactionIncomeCategory.grant:
        return 'Grant';
      default:
        return null;
    }
  }

  Color? get color {
    switch (this) {
      case TransactionIncomeCategory.salary:
        return Colors.blue;
      case TransactionIncomeCategory.bonus:
        return Colors.green;
      case TransactionIncomeCategory.freelancing:
        return Colors.orange;
      case TransactionIncomeCategory.investment_gains:
        return Colors.purple;
      case TransactionIncomeCategory.rental_income:
        return Colors.teal;
      case TransactionIncomeCategory.refunds:
        return Colors.red;
      case TransactionIncomeCategory.grant:
        return Colors.yellow;
      default:
        return null;
    }
  }

  IconData? get icon {
    switch (this) {
      case TransactionIncomeCategory.salary:
        return Icons.monetization_on;
      case TransactionIncomeCategory.bonus:
        return Icons.card_giftcard;
      case TransactionIncomeCategory.freelancing:
        return Icons.work;
      case TransactionIncomeCategory.investment_gains:
        return Icons.trending_up;
      case TransactionIncomeCategory.rental_income:
        return Icons.home;
      case TransactionIncomeCategory.refunds:
        return Icons.undo;
      case TransactionIncomeCategory.grant:
        return Icons.school;
      default:
        return null;
    }
  }
}

extension TransactionExpenseCategoryExtension on TransactionExpenseCategory {
  String? get label {
    switch (this) {
      case TransactionExpenseCategory.rent:
        return 'Rent';
      case TransactionExpenseCategory.utilities:
        return 'Utilities';
      case TransactionExpenseCategory.groceries:
        return 'Groceries';
      case TransactionExpenseCategory.transportation:
        return 'Transportation';
      case TransactionExpenseCategory.insurance:
        return 'Insurance';
      case TransactionExpenseCategory.healthcare:
        return 'Healthcare';
      case TransactionExpenseCategory.entertainment:
        return 'Entertainment';
      case TransactionExpenseCategory.shopping:
        return 'Shopping';
      case TransactionExpenseCategory.dept_payment:
        return 'Dept Payment';
      case TransactionExpenseCategory.investment:
        return 'Investment';
      case TransactionExpenseCategory.taxes:
        return 'Taxes';
      case TransactionExpenseCategory.donation:
        return 'Donation';
    }
  }

  Color? get color {
    switch (this) {
      case TransactionExpenseCategory.rent:
        return Colors.blueGrey;
      case TransactionExpenseCategory.utilities:
        return Colors.cyan;
      case TransactionExpenseCategory.groceries:
        return Colors.green;
      case TransactionExpenseCategory.transportation:
        return Colors.orange;
      case TransactionExpenseCategory.insurance:
        return Colors.indigo;
      case TransactionExpenseCategory.healthcare:
        return Colors.red;
      case TransactionExpenseCategory.entertainment:
        return Colors.pink;
      case TransactionExpenseCategory.shopping:
        return Colors.purple;
      case TransactionExpenseCategory.dept_payment:
        return Colors.brown;
      case TransactionExpenseCategory.investment:
        return Colors.teal;
      case TransactionExpenseCategory.taxes:
        return Colors.deepOrange;
      case TransactionExpenseCategory.donation:
        return Colors.lightGreen;
      default:
        return null;
    }
  }

  IconData? get icon {
    switch (this) {
      case TransactionExpenseCategory.rent:
        return Icons.home;
      case TransactionExpenseCategory.utilities:
        return Icons.lightbulb;
      case TransactionExpenseCategory.groceries:
        return Icons.shopping_cart;
      case TransactionExpenseCategory.transportation:
        return Icons.directions_car;
      case TransactionExpenseCategory.insurance:
        return Icons.security;
      case TransactionExpenseCategory.healthcare:
        return Icons.local_hospital;
      case TransactionExpenseCategory.entertainment:
        return Icons.movie_rounded;
      case TransactionExpenseCategory.shopping:
        return Icons.shopping_cart;
      case TransactionExpenseCategory.dept_payment:
        return Icons.payment_rounded;
      case TransactionExpenseCategory.investment:
        return Icons.trending_up;
      case TransactionExpenseCategory.taxes:
        return Icons.receipt;
      case TransactionExpenseCategory.donation:
        return Icons.volunteer_activism;
      default:
        return null;
    }
  }
}
