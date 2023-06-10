

import 'dart:convert';
import 'package:http/http.dart' as http;

class OrderCallApi {
  final String url = 'http://10.150.246.12:8000/materail_borrow/borrow-return-order/create/';


postDataOrder(data, token) async {
    return await http.post(Uri.parse(url),
        body: jsonEncode(data), headers: _setHeaders(token));
  }
  _setHeaders(token) => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
}