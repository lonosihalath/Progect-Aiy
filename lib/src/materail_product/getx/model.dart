import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str)['results'].map((x) => Product.fromJson(x)));

class Product {
  int? id;
  String? serialNo;
  String? name;
  String? description;
  int? qtyOnhand;
  String? model;
  String? image;
  DornorId? dornorId;
  TypeId? typeId;
  UomId? uomId;
  RabId? rabId;
  BrandId? brandId;

  Product(
      {this.id,
      this.serialNo,
      this.name,
      this.description,
      this.qtyOnhand,
      this.model,
      this.image,
      this.dornorId,
      this.typeId,
      this.uomId,
      this.rabId,
      this.brandId});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serialNo = json['serial_no'];
    name = json['name'];
    description = json['description'];
    qtyOnhand = json['qty_onhand'];
    model = json['model'];
    image = json['image'];
    dornorId = json['dornor_id'] != null
        ? new DornorId.fromJson(json['dornor_id'])
        : null;
    typeId =
        json['type_id'] != null ? new TypeId.fromJson(json['type_id']) : null;
    uomId = json['uom_id'] != null ? new UomId.fromJson(json['uom_id']) : null;
    rabId = json['rab_id'] != null ? new RabId.fromJson(json['rab_id']) : null;
    brandId = json['brand_id'] != null
        ? new BrandId.fromJson(json['brand_id'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['serial_no'] = this.serialNo;
    data['name'] = this.name;
    data['description'] = this.description;
    data['qty_onhand'] = this.qtyOnhand;
    data['model'] = this.model;
    data['image'] = this.image;
    if (this.dornorId != null) {
      data['dornor_id'] = this.dornorId!.toJson();
    }
    if (this.typeId != null) {
      data['type_id'] = this.typeId!.toJson();
    }
    if (this.uomId != null) {
      data['uom_id'] = this.uomId!.toJson();
    }
    if (this.rabId != null) {
      data['rab_id'] = this.rabId!.toJson();
    }
    if (this.brandId != null) {
      data['brand_id'] = this.brandId!.toJson();
    }
    return data;
  }
}

class DornorId {
  int? id;
  String? name;
  String? contact;
  String? address;
  String? email;

  DornorId({this.id, this.name, this.contact, this.address, this.email});

  DornorId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    contact = json['contact'];
    address = json['address'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['contact'] = this.contact;
    data['address'] = this.address;
    data['email'] = this.email;
    return data;
  }
}

class TypeId {
  int? id;
  String? name;
  String? description;

  TypeId({this.id, this.name, this.description});

  TypeId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}

class UomId {
  int? id;
  String? name;
  String? abbreviation;
  String? description;

  UomId({this.id, this.name, this.abbreviation, this.description});

  UomId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    abbreviation = json['abbreviation'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['abbreviation'] = this.abbreviation;
    data['description'] = this.description;
    return data;
  }
}

class RabId {
  int? id;
  String? code;
  String? name;
  String? description;
  int? department;

  RabId({this.id, this.code, this.name, this.description, this.department});

  RabId.fromJson(Map<String, dynamic> json) {
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

class BrandId {
  int? id;
  String? name;
  String? description;
  String? origin;

  BrandId({this.id, this.name, this.description, this.origin});

  BrandId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    origin = json['origin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['origin'] = this.origin;
    return data;
  }
}

