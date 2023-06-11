import 'dart:convert';

List<Transactions> transactionsFromJson(String str) =>
    List<Transactions>.from(json.decode(str)['results'].map((x) =>Transactions.fromJson(x)));
class Transactions {
  int? id;
  String? transactionDate;
  int? qty;
  int? bill;
  int? material;
  int? lab;

  Transactions(
      {this.id,
      this.transactionDate,
      this.qty,
      this.bill,
      this.material,
      this.lab});

  Transactions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    transactionDate = json['transaction_date'];
    qty = json['qty'];
    bill = json['bill'];
    material = json['material'];
    lab = json['lab'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['transaction_date'] = this.transactionDate;
    data['qty'] = this.qty;
    data['bill'] = this.bill;
    data['material'] = this.material;
    data['lab'] = this.lab;
    return data;
  }
}
