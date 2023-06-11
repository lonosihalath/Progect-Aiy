import 'package:http/http.dart' as http;
import 'package:myapp/src/materail_product/getx/model.dart';
import 'package:shared_preferences/shared_preferences.dart';


class RemoteServiceProduct {
  static var client = http.Client();

  static Future<List<Product>?> fetchProducts() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString('token');
    var response = await client.get(
        Uri.parse('http://10.150.246.12:8000/materail_borrow/materials/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    if (response.statusCode == 200) {
     //print('Product::::::====>Ok' + '${response.statusCode}' + response.body);
      var jsonString = response.body;
      return productFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }
}
