class AllTransactionsModel {
  AllTransactionsModel({
    this.transactions,
  });
  List<Transaction>? transactions;

  AllTransactionsModel.fromJson(Map<String, dynamic> json) {
    transactions = List.from(json['Transactions'])
        .map((e) => Transaction.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Transactions'] = transactions!.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Transaction {
  Transaction({
    required this.Id,
    required this.Type,
    required this.Amount,
    required this.Category,
    this.Description,
    required this.Date,
    this.Invoice,
  });
  late final String Id;
  late final int Type;
  late final int Amount;
  late final int Category;
  late final String? Description;
  late final String Date;
  late final String? Invoice;

  Transaction.fromJson(Map<String, dynamic> json) {
    Id = json['Id'];
    Type = json['Type'];
    Amount = json['Amount'];
    Category = json['Category'];
    Description = null;
    Date = json['Date'];
    Invoice = null;
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
