class TransactionDetailsModel {
  TransactionDetailsModel({
    this.Id,
    this.Type,
    this.Amount,
    this.Category,
    this.Description,
    this.Date,
    this.Invoice,
  });
  String? Id;
  int? Type;
  num? Amount;
  int? Category;
  String? Description;
  String? Date;
  String? Invoice;
  
  TransactionDetailsModel.fromJson(Map<String, dynamic> json){
    Id = json['Id'];
    Type = json['Type'];
    Amount = json['Amount'];
    Category = json['Category'];
    Description = null;
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