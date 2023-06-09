// ignore: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CallApi {
  // final String _url = 'https://bundo-laravel.cslox-th.ruk-com.la/api/';
  final String url = 'http://10.150.246.12:8000/auth/login/';



  postDatalogin(
    data,
  ) async {
    return await http.post(Uri.parse(url),
        body: jsonEncode(data), headers: _setHeaders());
  }
  ///////////////////////////////////////////

  

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

  getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    return token;
  }
}
