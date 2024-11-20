// ignore_for_file: constant_identifier_names

enum TransactionType { income, expense }

enum TransactionIncomeCategory {
  salary(0),
  bonus(1),
  freelancing(2),
  investment_gains(3),
  rental_income(4),
  refunds(5),
  grant(6);

  final int idx;

  const TransactionIncomeCategory(this.idx);
}

enum TransactionExpenseCategory {
  rent(7),
  utilities(8),
  groceries(9),
  transportation(10),
  insurance(11),
  healthcare(12),
  entertainment(13),
  shopping(14),
  dept_payment(15),
  investment(16),
  taxes(17),
  donation(18);

  final int idx;

  const TransactionExpenseCategory(this.idx);
}
