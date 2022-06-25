import 'package:wtb_travel/models/user.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

Future<profilUser> getProfilUser(String token) async {
  http.Response response;

  response = await http
      .get(Uri.parse("https://wtb-travel1.herokuapp.com/api/user"), headers: {
    'Accept': 'application/json',
    'Authorization': 'Bearer $token'
  });

  if (response.statusCode != 200) {
    response = await http
        .get(Uri.parse("https://wtb-travel1.herokuapp.com/api/user"), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
  }

  var user = json.decode(response.body);
  List<profilUser> userData = [
    profilUser(id: user["id"], name: user["username"], status: user["status"])
  ];

  return userData[0];
}

updateUsername(String token, int id, String newUsername) async {
  http.Response response;
  response = await http.put(
    Uri.parse('https://wtb-travel1.herokuapp.com/api/user/updateUsername/$id'),
    headers: <String, String>{
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode({
      'username': newUsername,
    }),
  );

  if (response.statusCode != 200 &&
      response.statusCode != 422 &&
      response.statusCode != 500 &&
      response.statusCode != 400) {
    response = await http.put(
      Uri.parse(
          'https://wtb-travel1.herokuapp.com/api/user/updateUsername/$id'),
      headers: <String, String>{
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'username': newUsername,
      }),
    );
  }

  Map<String, dynamic> body = jsonDecode(response.body);
  if (response.statusCode == 422 ||
      response.statusCode == 500 ||
      response.statusCode == 400) {
    return [body['success'], body['message']];
  }

  return [body['success']];
}

updatePassword(
    String token, int id, String currentPassword, String newPassword) async {
  http.Response response;
  response = await http.put(
    Uri.parse('https://wtb-travel1.herokuapp.com/api/user/updatePassword/$id'),
    headers: <String, String>{
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode({
      'currentPassword': currentPassword,
      'newPassword': newPassword,
    }),
  );

  if (response.statusCode != 200 &&
      response.statusCode != 422 &&
      response.statusCode != 500) {
    response = await http.put(
      Uri.parse(
          'https://wtb-travel1.herokuapp.com/api/user/updatePassword/$id'),
      headers: <String, String>{
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'currentPassword': currentPassword,
        'newPassword': newPassword,
      }),
    );
  }

  Map<String, dynamic> body = jsonDecode(response.body);
  if (response.statusCode == 200) {
    return [body['success']];
  }
  return [body['success'], body['message']];
}
