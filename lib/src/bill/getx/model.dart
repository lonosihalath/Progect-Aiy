import 'dart:convert';

List<BillsModel> billFromJson(String str) =>
    List<BillsModel>.from(json.decode(str).map((x) =>BillsModel.fromJson(x)));

class BillsModel {
  int? id;
  String? borrowDate;
  String? returnDate;
  String? borrowAmount;
  String? created;
  String? lastUpdate;
  String? transactionType;
  String? status;
  int? user;
  int? department;
  int? lab;

  BillsModel(
      {this.id,
      this.borrowDate,
      this.returnDate,
      this.borrowAmount,
      this.created,
      this.lastUpdate,
      this.transactionType,
      this.status,
      this.user,
      this.department,
      this.lab});

  BillsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    borrowDate = json['borrow_date'];
    returnDate = json['return_date'];
    borrowAmount = json['borrow_amount'];
    created = json['created'];
    lastUpdate = json['last_update'];
    transactionType = json['transaction_type'];
    status = json['status'];
    user = json['user'];
    department = json['department'];
    lab = json['lab'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['borrow_date'] = this.borrowDate;
    data['return_date'] = this.returnDate;
    data['borrow_amount'] = this.borrowAmount;
    data['created'] = this.created;
    data['last_update'] = this.lastUpdate;
    data['transaction_type'] = this.transactionType;
    data['status'] = this.status;
    data['user'] = this.user;
    data['department'] = this.department;
    data['lab'] = this.lab;
    return data;
  }
}
