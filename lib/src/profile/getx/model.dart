import 'dart:convert';

List<ProfileModel> profileFromJson(String str) =>
    List<ProfileModel>.from(json.decode(str).map((x) => ProfileModel.fromJson(x)));


class ProfileModel {
  int? id;
  String? phoneNumber;
  String? address;
  String? name;
  String? dateOfBirth;
  String? profileImage;
  String? createdAt;
  String? updatedAt;
  int? user;
  int? unit;

  ProfileModel(
      {this.id,
      this.phoneNumber,
      this.address,
      this.name,
      this.dateOfBirth,
      this.profileImage,
      this.createdAt,
      this.updatedAt,
      this.user,
      this.unit});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phoneNumber = json['phone_number'];
    address = json['address'];
    name = json['name'];
    dateOfBirth = json['date_of_birth'];
    profileImage = json['profile_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['phone_number'] = this.phoneNumber;
    data['address'] = this.address;
    data['name'] = this.name;
    data['date_of_birth'] = this.dateOfBirth;
    data['profile_image'] = this.profileImage;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['user'] = this.user;
    data['unit'] = this.unit;
    return data;
  }
}
