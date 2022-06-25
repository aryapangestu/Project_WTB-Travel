import 'dart:convert';

import 'package:http/http.dart' as http;

login(String username, String password) async {
  http.Response response;

  response =
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

register(String username, String password, String password_confirmation) async {
  http.Response response;

  response = await http.post(
      Uri.parse("http://wtb-travel1.herokuapp.com/api/register"),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode({
        "username": username,
        "password": password,
        "password_confirmation": password_confirmation
      }));

  if (response.statusCode != 200 && response.statusCode != 422) {
    response =
        await http.post(Uri.parse("http://wtb-travel1.herokuapp.com/api/login"),
            headers: {'Content-Type': 'application/json; charset=UTF-8'},
            body: jsonEncode({
              "username": username,
              "password": password,
              "password_confirmation": password_confirmation
            }));
  }

  Map<String, dynamic> body = jsonDecode(response.body);

  if (response.statusCode == 422) {
    return ['error', body["errors"]];
  }

  return ['alert', body['alert']];
}

logout(String token) async {
  http.Response response;

  response = await http.post(
    Uri.parse("http://wtb-travel1.herokuapp.com/api/logout"),
    headers: {'Accept': 'application/json', 'Authorization': 'Bearer $token'},
  );

  return;
}
