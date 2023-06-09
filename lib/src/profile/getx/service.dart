// import 'package:http/http.dart' as http;
// import 'package:myapp/src/profile/getx/model.dart';
// import 'package:shared_preferences/shared_preferences.dart';


// class RemoteServiceProfile {
//   static var client = http.Client();

//   static Future<List<ProfileModel>?> fetchProducts() async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     String? id = sharedPreferences.getString('id');
//     String? token = sharedPreferences.getString('token');
//     var response = await client.get(
//         Uri.parse('http://10.150.246.12:8000/materail_borrow/profile-users/search/$id'),
//         headers: {
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//           'Authorization': 'Bearer $token',
//         });
//         print(response.statusCode.toString());
//     if (response.statusCode == 200) {
//      print('Profile::::::====>Ok' + '${response.statusCode}' + response.body);
//       var jsonString = response.body;
//       return profileFromJson(jsonString);
//     } else {
//       //show error message
//       return null;
//     }
//   }
// }
