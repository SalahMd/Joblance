class TransactionModel {
  int? id;
  int? balance;
  String? code;
  String? transactionTypeName;
  int? transactionTypeId;
  String? transactionStatusName;
  int? transactionStatusId;
  String? date;
  int? userId;

  TransactionModel(
      {this.id,
      this.balance,
      this.code,
      this.transactionTypeName,
      this.transactionTypeId,
      this.transactionStatusName,
      this.transactionStatusId,
      this.date,
      this.userId});

  TransactionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    balance = json['balance'];
    code = json['code'];
    transactionTypeName = json['transaction_type_name'];
    transactionTypeId = json['transaction_type_id'];
    transactionStatusName = json['transaction_status_name'];
    transactionStatusId = json['transaction_status_id'];
    date = json['date'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['balance'] = this.balance;
    data['code'] = this.code;
    data['transaction_type_name'] = this.transactionTypeName;
    data['transaction_type_id'] = this.transactionTypeId;
    data['transaction_status_name'] = this.transactionStatusName;
    data['transaction_status_id'] = this.transactionStatusId;
    data['date'] = this.date;
    data['user_id'] = this.userId;
    return data;
  }
}