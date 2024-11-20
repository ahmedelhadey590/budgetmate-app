class WalletModel {
  WalletModel({
    this.Id,
    this.Balance,
    this.Income,
    this.Expense,
    this.Transactions,
  });
  late final String? Id;
  late final num? Balance;
  late final num? Income;
  late final num? Expense;
  late final List<TodayTransactions>? Transactions;

  WalletModel.fromJson(Map<String, dynamic> json) {
    Id = json['Wallet']['Id'];
    Balance = json['Wallet']['Balance'];
    Income = json['Wallet']['Income'];
    Expense = json['Wallet']['Expense'];
    Transactions = List.from(json['Transactions'])
        .map((e) => TodayTransactions.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Id'] = Id;
    _data['Balance'] = Balance;
    _data['Income'] = Income;
    _data['Expense'] = Expense;
    _data['Transactions'] = Transactions!.map((e) => e.toJson()).toList();
    return _data;
  }
}

class TodayTransactions {
  TodayTransactions({
    required this.Id,
    required this.Type,
    required this.Amount,
    required this.Category,
    required this.Description,
    required this.Date,
    required this.Invoice,
  });
  late final String? Id;
  late final int Type;
  late final num Amount;
  late final int Category;
  late final String? Description;
  late final String Date;
  late final String? Invoice;

  TodayTransactions.fromJson(Map<String, dynamic> json) {
    Id = json['Id'];
    Type = json['Type'];
    Amount = json['Amount'];
    Category = json['Category'];
    Description = json['Description'];
    Date = json['Date'];
    Invoice = json['Invoice'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Id'] = Id;
    _data['Type'] = Type;
    _data['Amount'] = Amount;
    _data['Category'] = Category;
    _data['Description'] = Description;
    _data['Date'] = Date;
    _data['Invoice'] = Invoice;
    return _data;
  }
}
