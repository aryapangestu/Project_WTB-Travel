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
