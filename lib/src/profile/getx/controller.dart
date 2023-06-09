import 'dart:convert';

import 'package:get/state_manager.dart';
import 'package:myapp/src/profile/getx/model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class ProfileController extends GetxController {
  var userlist = <ProfileModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchAlbumData();
    super.onInit();
  }

  Future<void> fetchAlbumData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString('token');
    String? id = preferences.getString('id');
    final response = await http.get(
        Uri.parse('http://10.150.246.12:8000/materail_borrow/profile-users/search/$id'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    if (response.statusCode == 200) {
      userlist.clear();
      print(response.statusCode);
     ProfileModel usermodel = ProfileModel.fromJson(jsonDecode(response.body));

      userlist.add(
       ProfileModel(
          id: usermodel .id,
          name: usermodel .name,
          address: usermodel.address,
          phoneNumber: usermodel.phoneNumber,
          dateOfBirth: usermodel.dateOfBirth,
          profileImage: usermodel.profileImage,
          user: usermodel.user,
          unit: usermodel.unit
        ),
      );

      isLoading.value = false;
      update();
    } else {
       isLoading.value = false;
      //Get.to(Server_Error());
    }
  }

  void clear() {
    userlist.clear();
    update();
  }
}
