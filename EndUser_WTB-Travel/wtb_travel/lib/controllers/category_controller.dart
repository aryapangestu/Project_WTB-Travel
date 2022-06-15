import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wtb_travel/models/category.dart';
import 'package:wtb_travel/models/place.dart';

Future<List<Category>> getCategories() async {
  var response = await http
      .get(Uri.parse("https://wtb-travel1.herokuapp.com/api/categories"));

  if (response.statusCode != 200) {
    throw "Gagal dalam fetching data";
  }

  List body = jsonDecode(response.body);

  List<Category> finalList = [];

  for (var category in body) {
    finalList.add(Category(
        name: category["name_category"], url_icon: category["url_icon"]));
  }

  return finalList;
}
