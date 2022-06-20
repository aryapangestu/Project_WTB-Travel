import 'dart:convert';

import 'package:http/http.dart' as http;

login(String username, String password) async {
  var response =
      await http.post(Uri.parse("http://wtb-travel1.herokuapp.com/api/login"),
          headers: {'Content-Type': 'application/json; charset=UTF-8'},
          body: jsonEncode({
            "username": username,
            "password": password,
          }));

  if (response.statusCode != 200) {
    response =
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
