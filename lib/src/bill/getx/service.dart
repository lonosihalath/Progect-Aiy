import 'package:http/http.dart' as http;
import 'package:myapp/src/bill/getx/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RemoteServiceBills {
  static var client = http.Client();

  static Future<List<BillsModel>?> fetchLab() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString('token');
    String? id = preferences.getString('id');
    var response = await client.get(
        Uri.parse('http://10.150.246.12:8000/materail_borrow/borrow-return-bills/user/$id'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    if (response.statusCode == 200) {
     //print('Bills::::::====>Ok' + '${response.statusCode}' + response.body);
      var jsonString = response.body;
      return billFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }
}
