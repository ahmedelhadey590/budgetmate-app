class DashboardModel {
  DashboardWalletModel? wallet;
  List<LatestTransactionsModel>? latestTransactions;

  DashboardModel({this.wallet, this.latestTransactions});

  DashboardModel.fromJson(Map<String, dynamic> json) {
    wallet = json['Wallet'] != null
        ? DashboardWalletModel.fromJson(json['Wallet'])
        : null;
    if (json['LatestTransactions'] != null) {
      latestTransactions = <LatestTransactionsModel>[];
      json['LatestTransactions'].forEach((v) {
        latestTransactions!.add(LatestTransactionsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (wallet != null) {
      data['Wallet'] = wallet!.toJson();
    }
    if (latestTransactions != null) {
      data['LatestTransactions'] =
          latestTransactions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DashboardWalletModel {
  String? id;
  num? balance;
  num? income;
  num? expense;

  DashboardWalletModel({this.id, this.balance, this.income, this.expense});

  DashboardWalletModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    balance = json['Balance'];
    income = json['Income'];
    expense = json['Expense'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['Balance'] = balance;
    data['Income'] = income;
    data['Expense'] = expense;
    return data;
  }
}

class LatestTransactionsModel {
  String? id;
  int? type;
  num? amount;
  int? category;
  String? description;
  String? date;
  String? invoice;

  LatestTransactionsModel(
      {this.id,
      this.type,
      this.amount,
      this.category,
      this.description,
      this.date,
      this.invoice});

  LatestTransactionsModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    type = json['Type'];
    amount = json['Amount'];
    category = json['Category'];
    description = json['Description'] ?? '';
    date = json['Date'] ?? '';
    invoice = json['Invoice'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['Type'] = type;
    data['Amount'] = amount;
    data['Category'] = category;
    data['Description'] = description;
    data['Date'] = date;
    data['Invoice'] = invoice;
    return data;
  }
}
