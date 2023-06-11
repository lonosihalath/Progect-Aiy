// ignore: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CallApi {
  // final String _url = 'https://bundo-laravel.cslox-th.ruk-com.la/api/';
  final String url = 'http://10.150.246.12:8000/auth/login/';
  final String urlUpdate = 'http://10.150.246.12:8000/materail_borrow/bills/<id>/status/';



  postDatalogin(
    data,
  ) async {
    return await http.post(Uri.parse(url),
        body: jsonEncode(data), headers: _setHeaders());
  }
  ///////////////////////////////////////////
  postDataUpadte(
    data,
    id
  ) async {
    return await http.put(Uri.parse(urlUpdate),
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
