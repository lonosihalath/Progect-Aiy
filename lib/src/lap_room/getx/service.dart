import 'package:http/http.dart' as http;
import 'package:myapp/src/lap_room/getx/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RemoteServiceLab {
  static var client = http.Client();

  static Future<List<Lab>?> fetchLab() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString('token');
    var response = await client.get(
        Uri.parse('http://10.150.246.12:8000/materail_borrow/rabs/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    if (response.statusCode == 200) {
     //print('Lab::::::====>Ok' + '${response.statusCode}' + response.body);
      var jsonString = response.body;
      return labtFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }
}
