import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

login(String username, String password) async {
  var response =
      await http.post(Uri.parse("http://wtb-travel1.herokuapp.com/api/login"),
          headers: {'Content-Type': 'application/json; charset=UTF-8'},
          body: jsonEncode({
            "username": username,
            "password": password,
          }));

  if (response.statusCode != 200) {
    var response =
        await http.post(Uri.parse("http://wtb-travel1.herokuapp.com/api/login"),
            headers: {'Content-Type': 'application/json; charset=UTF-8'},
            body: jsonEncode({
              "username": username,
              "password": password,
            }));
  }

  Map<String, dynamic> body = jsonDecode(response.body);

  return body['token'];
}
