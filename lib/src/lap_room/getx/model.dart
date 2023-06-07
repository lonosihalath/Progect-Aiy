
import 'dart:convert';

List<Lab> labtFromJson(String str) =>
    List<Lab>.from(json.decode(str)['results'].map((x) => Lab.fromJson(x)));

class Lab {
  int? id;
  String? code;
  String? name;
  String? description;
  int? department;

  Lab({this.id, this.code, this.name, this.description, this.department});

  Lab.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    description = json['description'];
    department = json['department'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['name'] = this.name;
    data['description'] = this.description;
    data['department'] = this.department;
    return data;
  }
}
