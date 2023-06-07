import 'package:http/http.dart' as http;
import 'package:myapp/src/materail_product/getx/model.dart';


class RemoteServiceProduct {
  static var client = http.Client();

  static Future<List<Product>?> fetchProducts() async {
    var response = await client.get(
        Uri.parse('http://10.150.246.12:8000/materail_borrow/materials/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjg2NTAxNzA2LCJpYXQiOjE2ODYwNjk3MDYsImp0aSI6IjAxZTgxZDhjZmI4OTQ5Njg4YWUyMWJhOGRhZWZlMDc1IiwidXNlcl9pZCI6Nn0.FT-jo6osb3OGSKoEgoYvfWM-zkm7NjUEwFhwlxZmZi8',
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
