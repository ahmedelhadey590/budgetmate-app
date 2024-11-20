import 'package:dio/dio.dart';

class AddTransactionModel {
  int? type;
  num? amount;
  int? category;
  String? description;
  String? date;
  MultipartFile? invoice;

  AddTransactionModel(
      {
      this.type,
      this.amount,
      this.category,
      this.description,
      this.date,
      this.invoice});

  AddTransactionModel.fromJson(Map<String, dynamic> json) {
    type = json['Type'];
    amount = json['Amount'];
    category = json['Category'];
    description = json['Description'];
    date = json['Date'];
    invoice = json['Invoice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Type'] = type;
    data['Amount'] = amount;
    data['Category'] = category;
    data['Description'] = description;
    data['Date'] = date;
    data['Invoice'] = invoice;
    return data;
  }
}
