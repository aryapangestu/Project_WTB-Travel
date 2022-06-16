import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

Future<Response> login(String username, String password) async {
  try {
    Response response = await Dio().post(
      'http://wtb-travel1.herokuapp.com/api/login',
      data: {'email': username, 'password': password},
    );
    //returns the successful user data json object
    return response.data;
  } on DioError catch (e) {
    //returns the error object if any
    return e.response!.data;
  }
}
